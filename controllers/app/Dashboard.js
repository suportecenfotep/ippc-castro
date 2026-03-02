const { Estudante, Pagamento, ItensPagamento, Matricula, Despesa } = require("../../models/App");
const { User } = require("../../models/Auth");
const { Curso, EmolumentoPreco, AnoLectivo, Sala } = require("../../models/Config");
const { Op, fn, col, literal } = require("sequelize");
const moment = require("moment");

const getAcademicDashboard = async (req, res) => {
  try {
    const hoje = moment().startOf('day').toDate();
    const inicioMes = moment().startOf('month').toDate();
    const fimMes = moment().endOf('month').toDate();
    const diasPassadosNoMes = moment().date();
    const totalDiasNoMes = moment().daysInMonth();

    // 1️⃣ HELPER: Cálculo de Saldo Líquido
    const getSaldo = async (startDate, endDate = null) => {
      const filtro = { [Op.gte]: startDate };
      if (endDate) filtro[Op.lte] = endDate;

      const receitasRaw = await ItensPagamento.findAll({
        include: [{ 
          model: Pagamento, 
          where: { createdAt: filtro, estado: "Pago" }, 
          attributes: [] 
        }, { 
          model: EmolumentoPreco, 
          attributes: [] 
        }],
        attributes: [[fn("SUM", literal("`EmolumentoPreco`.`preco` + `ItensPagamento`.`multa` - `ItensPagamento`.`desconto`")), "total"]],
        raw: true
      });

      const despesas = await Despesa.sum("valor", { 
        where: { createdAt: filtro, status: true } 
      }) || 0;
      
      const entradas = parseFloat(receitasRaw[0]?.total || 0);
      return { entradas, saidas: despesas, total: entradas - despesas };
    };

    // 2️⃣ EXECUÇÃO DE QUERIES (Novas estatísticas adicionadas)
    const [
      totalEstudantes, 
      matriculasAtivas, 
      alunosPagantes, 
      ultimasMatriculas, 
      despesasRecentes, 
      desempenhoUsers, 
      comparativoAnos,
      statsGenero,
      ocupacaoSalas
    ] = await Promise.all([
      Estudante.count(),
      Matricula.count({ where: { estado: "Estudando" } }),
      Pagamento.count({ distinct: true, col: 'estudante_id', where: { estado: "Pago" } }),
      Matricula.findAll({ include: [Estudante, Curso], order: [['createdAt', 'DESC']], limit: 4 }),
      Despesa.findAll({ order: [['createdAt', 'DESC']], limit: 4 }),
      Pagamento.findAll({
        where: { estado: "Pago" },
        include: [{ model: User, attributes: ["nome", "foto"] }],
        attributes: ["user_id", [fn("COUNT", col("Pagamento.id")), "total"]],
        group: ["user_id", "User.id"],
        order: [[literal("total"), "DESC"]],
        limit: 3
      }),
      ItensPagamento.findAll({
        include: [{ model: Pagamento, where: { estado: "Pago" }, attributes: [], include: [{ model: AnoLectivo, attributes: [] }] }, { model: EmolumentoPreco, attributes: [] }],
        attributes: [[col("Pagamento->AnoLectivo.nome"), "ano"], [fn("SUM", literal("`EmolumentoPreco`.`preco` + `ItensPagamento`.`multa` - `ItensPagamento`.`desconto`")), "total"]],
        group: [col("Pagamento->AnoLectivo.nome")], raw: true
      }),
      // Novas Estatísticas: Gênero
      Estudante.findAll({
        attributes: ['genero', [fn('COUNT', col('id')), 'total']],
        group: ['genero'], raw: true
      }),
      // Novas Estatísticas: Ocupação de Salas
      Matricula.findAll({
        where: { estado: "Estudando" },
        include: [{ model: Sala, attributes: ["nome"] }],
        attributes: [[fn("COUNT", col("Matricula.id")), "total"]],
        group: ["Sala.id", "Sala.nome"], raw: true, limit: 5
      })
    ]);

    const saldoMensal = await getSaldo(inicioMes);
    const saldoHoje = await getSaldo(hoje);
    const taxaInadimplencia = totalEstudantes > 0 ? ((totalEstudantes - alunosPagantes) / totalEstudantes) * 100 : 0;

    // 3️⃣ LÓGICA DE META AUTOMÁTICA (Baseada em Produtividade)
    /* Cálculo: Pegamos o que foi arrecadado no mês, dividimos pelos dias passados 
       para achar a média diária e definimos a meta como 20% acima da média atual.
    */
    const mediaDiariaAtual = saldoMensal.entradas / diasPassadosNoMes;
    const metaProdutividadeDiaria = Math.ceil(mediaDiariaAtual * 1.2); // Meta é a média + 20% de esforço
    const arrecadadoHoje = saldoHoje.entradas;

    const desafios = [];
    
    desafios.push({
      titulo: "Meta de Produtividade",
      objetivo: `Superar média diária (${numberFormat(metaProdutividadeDiaria)} Kz)`,
      progresso: Math.min(Math.round((arrecadadoHoje / metaProdutividadeDiaria) * 100), 100),
      cor: arrecadadoHoje >= metaProdutividadeDiaria ? "bg-success" : "bg-info",
      status: arrecadadoHoje >= metaProdutividadeDiaria ? "Superada!" : "Em progresso"
    });

    // Desafio de Regularização (Dinâmico)
    if (taxaInadimplencia > 15) {
      desafios.push({
        titulo: "Recuperação",
        objetivo: `Cobrar ${totalEstudantes - alunosPagantes} pendentes`,
        progresso: Math.round((alunosPagantes / totalEstudantes) * 100),
        cor: "bg-danger",
        status: "Urgente"
      });
    }

    // Projeção de Fechamento de Mês
    const projecaoFinalMes = mediaDiariaAtual * totalDiasNoMes;

    res.json({
      cards: { 
        totalEstudantes, 
        matriculasAtivas, 
        taxaInadimplencia: taxaInadimplencia.toFixed(2) + "%",
        projecaoMensal: projecaoFinalMes.toFixed(2)
      },
      saldos: { 
        mensal: saldoMensal, 
        geral: await getSaldo(moment("2000-01-01").toDate()) // Desde o início
      },
      stats: {
        genero: statsGenero,
        salas: ocupacaoSalas
      },
      comparativoAnos,
      desafios,
      feed: { ultimasMatriculas, despesasRecentes },
      topUsers: desempenhoUsers
    });
  } catch (e) { res.status(500).json({ error: e.message }); }
};

// Helper simples para formatação no log se necessário
function numberFormat(val) {
  return new Intl.NumberFormat('pt-AO').format(val);
}

module.exports = { getAcademicDashboard };