
const { 
          AnoLectivo, 
          Curso, 
          Sala,
          Matricula,
          Classe, 
          Periodo,
          Pagamento,
          ItensPagamento,
          Emolumento,
          EmolumentoPreco,
          Despesa,
          Estudante,
          User,
          DisciplinaClasse,
          Disciplina
      } = require("../models/Model");
var pdf = require("pdf-creator-node")
const path = require("path")
const moment = require("moment")
const Sequelize = require("sequelize")
const {numberFormat,formattedToday} = require('../config/utils');
var fs = require("fs")
const timestamp = Date.now().toString();
const logo = "http://localhost:9000/api/mediafiles/castro.jpeg"
const logoRepublica = "http://localhost:9000/api/mediafiles/insignia.png"

var options = {
    format: "A4",
    orientation: "portrait",
    border: "10mm",
    /*header: {
        height: "45mm",
        contents: '<div style="text-align: center;">Author: Shyam Hajare</div>'
    },
    footer: {
        height: "28mm",
        contents: {
            first: 'Cover page',
            2: 'Second page', // Any page number is working. 1-based index
            default: '<span style="color: #444;">{{page}}</span>/<span>{{pages}}</span>', // fallback value
            last: 'Last Page'
        }
    }*/
};

async function createComprovativoMatricula(req, res) {
  const { id } = req.params;

  // Carrega o template HTML
  const html = fs.readFileSync("./templates/boletim_matricula.html", "utf8");

  const matricula = await Matricula.findOne({
    where: { id },
    include: [
      { model: Estudante },
      { model: AnoLectivo },
      { model: Sala },
      { model: Periodo },
      { model: Classe },
      { model: User }
    ]
  });

  const curso = await Curso.findOne({ where: { id: matricula.curso_id } });

  // Mapear números de meses para seus nomes em português
  const meses = [
    "Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho",
    "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"
  ];

  // Obter a data de hoje
  const dataHoje = new Date();
  const dia = dataHoje.getDate();
  const mes = meses[dataHoje.getMonth()];
  const ano = dataHoje.getFullYear();

  // Formatar a data no formato desejado
  const dataFormatada = `Huambo aos ${dia} de ${mes} de ${ano}`;

  const dadosPDF = {
    header: {
      nome_curso: curso.nome,
      nome_ano: matricula.AnoLectivo.nome,
      ano: new Date().getFullYear(),
      logo:logo
    },
    estudante: {
      id: matricula.id,
      data_matricula: matricula.createdAt,
      numero: matricula.Estudante.numero,
      numero_processual: matricula.Estudante.numero_processual,
      data_nascimento: moment(matricula.Estudante.data_de_nascimento).format("DD / MM / YYYY"),
      idade: new Date().getFullYear() - moment(matricula.Estudante.data_de_nascimento).format("YYYY"),
      nome: matricula.Estudante.nome,
      numero_processo: matricula.Estudante.numero_processo,
      nome_pai: matricula.Estudante.nome_pai,
      nome_mae: matricula.Estudante.nome_mae,
      identificacao: matricula.Estudante.identificacao,
      local_emissao_identificacao: matricula.Estudante.local_emissao_identificacao,
      data_emissao_bi: moment(matricula.Estudante.data_emissao_bi).format("DD / MM / YYYY"),
      telefone: matricula.Estudante.telefone,
      email: matricula.Estudante.email,
      nacionalidade: matricula.Estudante.nacionalidade,
      naturalidade: matricula.Estudante.naturalidade,
      municipio: matricula.Estudante.municipio,
      provincia: matricula.Estudante.provincia,
      bairro: matricula.Estudante.bairro,
      genero: matricula.Estudante.genero,
      estado_civil: matricula.Estudante.estado_civil,
      lingua_opcao: matricula.Estudante.lingua_opcao,
      escola_anterior: matricula.Estudante.escola_anterior,
      residencia: matricula.Estudante.residencia,
      necessidade_especial: matricula.Estudante.necessidade_especial,
      encarregado: matricula.Estudante.encarregado,
      contacto_encarregado: matricula.Estudante.contacto_encarregado,
      grau_parentesco: matricula.Estudante.grau_parentesco,
      sala: matricula.Sala.nome,
      periodo: matricula.Periodo.nome,
      classe: matricula.Classe.nome,
      operador: matricula.User.nome,
      data: moment(matricula.createdAt).format("DD-MM-YYYY"),
      today: dataFormatada // Passa a data formatada para o objeto de dados
    }
  };

  const document = {
    html: html,
    data: dadosPDF,
    type: "buffer", // Gera como buffer
  };

  pdf
    .create(document, options)
    .then((buffer) => {
      res.setHeader("Content-Type", "application/pdf");
      res.setHeader("Content-Disposition", "inline; filename=comprovativo_matricula.pdf");
      res.status(200).send(buffer); // Envia o buffer como resposta
    })
    .catch((error) => {
      console.error(error);
      res.status(500).send("Erro ao gerar o PDF");
    });
}

async function createListaMatriculados(req, res){
  const {ano_id, curso_id, periodo_id, classe_id, sala_id} = req.params;
  let num =1;
  var html = fs.readFileSync("./templates/lista_estudantes_matriculados.html", "utf8");
    // Read HTML Template
    const candidatos = await Matricula.findAll({
      where: {
        ano_id, 
        sala_id, 
        estado: { [Sequelize.Op.not]: 'Cancelada' } 
      },
      include: [
        {
          model: Estudante,
        },
        {
          model: Curso,
        }
      ],
      order: [[{ model: Estudante }, 'nome', 'ASC']], // Ordena por nome dos estudantes
    });    
  const curso = await Curso.findOne({where:{id:curso_id}})
  const ano = await AnoLectivo.findOne({where:{id:ano_id}})
  const periodo = await Periodo.findOne({where:{id:periodo_id}})
  const classe = await Classe.findOne({where:{id:classe_id}})
  const sala = await Sala.findOne({where:{id:sala_id}})
  const dadosPDF = {
    header:{
      nome_curso:curso.nome,
      nome_ano:ano.nome,
      nome_periodo:periodo.nome,
      nome_classe:classe.nome,
      nome_sala:sala.nome,
      numero_sala:sala.numero_sala,
      formattedToday:formattedToday,
      logo:logo
    },
    candidatos:candidatos.map(item => ({
      id:num++,
      nome:item.Estudante ? item.Estudante.nome : "Não definido",
      identificacao:item.Estudante ? item.Estudante.identificacao : "Não definido",
      numero_processual:item.Estudante ? item.Estudante.numero_processual : "Não definido",
    }))
  }
  const document = {
    html: html,
    data: dadosPDF,
    type: "buffer"
  };

  pdf
    .create(document, options)
    .then((buffer) => {
      res.setHeader("Content-Type", "application/pdf");
      res.setHeader("Content-Disposition", "inline; filename=lista_estudantes_matriculados.pdf");
      res.status(200).send(buffer); 
    })
    .catch((error) => {
        console.error(error);
    });
}

async function createMapaDeFaltas(req, res){
  const {ano_id, curso_id, periodo_id, classe_id, sala_id} = req.params;
  var options = {
    format: "A4",
    orientation: "landscape",
    border: "10mm",
  }
  const disciplinas = await DisciplinaClasse.findAll({where:{classe_id,curso_id}, include:[Disciplina]})
  let num =1;
  var html = fs.readFileSync("./templates/mapa_controlo_faltas.html", "utf8");
    // Read HTML Template
    const candidatos = await Matricula.findAll({
      where: {
        ano_id, 
        sala_id, 
        estado: { [Sequelize.Op.not]: 'Cancelada' } 
      },
      include: [
        {
          model: Estudante,
        },
        {
          model: Curso,
        }
      ],
      order: [[{ model: Estudante }, 'nome', 'ASC']], 
    });    
  const curso = await Curso.findOne({where:{id:curso_id}})
  const ano = await AnoLectivo.findOne({where:{id:ano_id}})
  const periodo = await Periodo.findOne({where:{id:periodo_id}})
  const classe = await Classe.findOne({where:{id:classe_id}})
  const sala = await Sala.findOne({where:{id:sala_id}})
  const dadosPDF = {
    header:{
      nome_curso:curso.nome,
      nome_ano:ano.nome,
      nome_periodo:periodo.nome,
      nome_classe:classe.nome,
      nome_sala:sala.nome,
      numero_sala:sala.numero_sala,
      formattedToday:formattedToday,
      logo:logo
    },
    candidatos:candidatos.map(item => ({
      id:num++,
      nome:item.Estudante ? item.Estudante.nome : "Não definido",
      identificacao:item.Estudante ? item.Estudante.identificacao : "Não definido",
      numero_processual:item.Estudante ? item.Estudante.numero_processual : "Não definido",
      disciplinas:disciplinas.map(item => ({
        nome:item.Disciplina.nome
      }))
    })),
    disciplinas:disciplinas.map(item => ({
      nome:item.Disciplina.nome
    }))
  }
  const document = {
    html: html,
    data: dadosPDF,
    type: "buffer"
  };

  pdf
    .create(document, options)
    .then((buffer) => {
      res.setHeader("Content-Type", "application/pdf");
      res.setHeader("Content-Disposition", "inline; filename=lista_estudantes_matriculados.pdf");
      res.status(200).send(buffer); 
    })
    .catch((error) => {
        console.error(error);
    });
}

async function createFluxoDeCaixa(req, res){
    var options = {
        format: "A4",
        orientation: "portrait",
        border: "10mm",
        phantomPath: path.resolve(
            "./node_modules/phantomjs-prebuilt/lib/phantom/bin/phantomjs.exe"
        ),
    };
    const {start_date, end_date} = req.params;
    let num =1;
    // Note: Garantir que o path para o HTML é acessível
    var html = fs.readFileSync("./templates/fluxo_de_caixa.html", "utf8"); 

    // 1. CONSULTA AOS PAGAMENTOS (Sem SUM e GROUP BY)
    const pagamentosData = await Pagamento.findAll({
        where:{
            createdAt:{
                [Sequelize.Op.between]:[start_date, end_date]
            }
        },
        attributes: [
            'id',
            'createdAt',
        ],
        include: [
            {
                model: ItensPagamento,
                attributes: ['desconto', 'multa'],
                include: [
                    {
                        model: EmolumentoPreco,
                        attributes: ['id', 'preco'],
                        include:[
                            {
                                model:Emolumento,
                                attributes:['id','nome']
                            }
                        ]
                    }
                ],
                required: true 
            },
            {
                model:User,
                attributes:['id','nome']
            },
            {
                model:Estudante,
                attributes:['nome']
            }
        ],
    })

    const despesas = await Despesa.findAll({
        where:{
            createdAt:{
                [Sequelize.Op.between]:[start_date, end_date]
            }
        },
        include:[User]
    })

    // 2. PROCESSAMENTO DOS PAGAMENTOS NO JAVASCRIPT
    let totalEntradasCalculado = 0;
    
    const pagamentosFormatados = pagamentosData.map(pagamento => {
        let totalDocumento = 0;
        let itensPagosDescricao = 'Nenhum item pago';

        if (pagamento.ItensPagamentos && pagamento.ItensPagamentos.length > 0) {
            // A. Calcular o total
            totalDocumento = pagamento.ItensPagamentos.reduce((total, item) => {
                // *** CORREÇÃO APLICADA AQUI ***
                // Navegação direta: item.EmolumentoPreco
                const preco = item.EmolumentoPreco ? item.EmolumentoPreco.preco : 0; 
                
                const desconto = item.desconto || 0;
                const multa = item.multa || 0;
                const valorLiquido = preco - (preco * desconto / 100) + (preco * multa / 100);
                return total + valorLiquido;
            }, 0);
            
            // B. Criar a nova descrição (Itens Pagos)
            itensPagosDescricao = pagamento.ItensPagamentos
                .map(item => {
                    // *** CORREÇÃO APLICADA AQUI ***
                    // Navegação direta: item.EmolumentoPreco.Emolumento
                    return item.EmolumentoPreco && item.EmolumentoPreco.Emolumento 
                        ? item.EmolumentoPreco.Emolumento.nome 
                        : 'Emolumento Desconhecido';
                })
                .join(', ');
        }

        totalEntradasCalculado += totalDocumento;

        return {
            id: num++,
            descricao: itensPagosDescricao,
            estudante: pagamento.Estudante.nome,
            valor: totalDocumento, 
            valorFormatado: numberFormat(totalDocumento, 2, ',', '.'),
            utilizador: pagamento.User.nome,
            data: moment(pagamento.createdAt).format("DD-MM-YYYY"),
        };
    });

    // 3. MONTAGEM DO PDF
    let totalSaidasCalculado = 0;
    despesas.map(item=>{
        totalSaidasCalculado += item.valor
    })

    var dadosPDF = {
        header:{
            start_date:moment(start_date).format("DD-MM-YYYY"),
            end_date:moment(end_date).format("DD-MM-YYYY"),
            logo:logo,
            data:formattedToday,
            totalEntradas: numberFormat(totalEntradasCalculado, 2, ',', '.'),
            totalSaidas: numberFormat(totalSaidasCalculado, 2, ',', '.')
        },
        pagamentos: pagamentosFormatados.map(item => ({
             ...item, 
             valor: item.valorFormatado 
        })),
        despesas:despesas.map(item => ({
            id:num++,
            descricao:item.descricao,
            valor:numberFormat(item.valor,2,',','.'),
            referencia:item.referencia,
            utilizador:item.User.nome,
            data:moment(item.createdAt).format("DD-MM-YYYY"),
        }))
    }
    
    var document = {
        html: html,
        data: dadosPDF,
        path: './mediafiles/'+timestamp+'.pdf',
        type: "buffer",
    };
    pdf
        .create(document, options)
        .then((doc) => {
            res.setHeader("Content-Type", "application/pdf");
            res.setHeader("Content-Disposition", "inline; filename=fluxo_de_caixa.pdf");
            res.status(200).send(doc); 
        })
        .catch((error) => {
            console.error(error);
             res.status(500).json({ error: 'Erro ao gerar PDF de Fluxo de Caixa: ' + error.message });
        });
}

async function createComprovativoPagamento(req, res){
  var options = {
    format: "A4",
    orientation: "landscape",
    border: "5mm",
  }
  const {pagamento_id} = req.params;
  let num =1;
  var html = fs.readFileSync("./templates/comprovativo_pagamento.html", "utf8");
    // Read HTML Template
  const itens = await ItensPagamento.findAll({where:{pagamento_id},include:[Emolumento, EmolumentoPreco]})
  const pagamento = await Pagamento.findOne({where:{id:pagamento_id},include:[Estudante,AnoLectivo]})
  const estudante = await Estudante.findOne({where:{id:pagamento.estudante_id}});
  const utilizador = await User.findOne({where:{id:pagamento.user_id}});
  const matricula = await Matricula.findOne({where:{ano_id:pagamento.ano_id, estudante_id: pagamento.estudante_id},include:[Classe,Curso,Sala]})
  
  var dadosPDF = {
    header:{
      id:pagamento.id,
      ano:pagamento.AnoLectivo.nome,
      estudante:pagamento.Estudante.nome,
      data:formattedToday,
      logo:logo
    },
    footer:{
      subtotal:0,
      descontos:0,
      multas:0,
      total:0,
      funcionario:utilizador.nome
    },
    estudante:{
      nome:estudante.nome,
      identificacao:estudante.identificacao,
      numero:estudante.numero,
      curso:(matricula?matricula.Curso.nome:"N/Atribuido"),
      classe:(matricula?matricula.Classe.nome:"N/Atribuida"),
      turma:matricula.Sala.nome
    },  
    itens:itens.map(item => ({
      id:num++,
      emolumento:item.Emolumento.nome,
      preco:numberFormat(item.EmolumentoPreco.preco,2,',','.'),
      desconto:numberFormat(item.EmolumentoPreco.preco * item.desconto / 100,2,',','.'),
      multa:numberFormat(item.EmolumentoPreco.preco * item.multa / 100,2,',','.'),
      subtotal:numberFormat(item.EmolumentoPreco.preco - (item.EmolumentoPreco.preco * item.desconto / 100 ) + (item.EmolumentoPreco.preco * item.multa / 100),2,',','.'),
    }))
  }
  itens.map(item=>{
    dadosPDF.footer.subtotal += item.EmolumentoPreco.preco
    dadosPDF.footer.total += item.EmolumentoPreco.preco - (item.EmolumentoPreco.preco * item.desconto / 100 ) + (item.EmolumentoPreco.preco * item.multa / 100)
    dadosPDF.footer.descontos += item.EmolumentoPreco.preco * item.desconto / 100
    dadosPDF.footer.multas += item.EmolumentoPreco.preco * item.multa / 100
  })
  // Formatar valores finais no footer
  dadosPDF.footer.subtotal = numberFormat(dadosPDF.footer.subtotal, 2, ',', '.');
  dadosPDF.footer.total = numberFormat(dadosPDF.footer.total, 2, ',', '.');
  dadosPDF.footer.descontos = numberFormat(dadosPDF.footer.descontos, 2, ',', '.');
  dadosPDF.footer.multas = numberFormat(dadosPDF.footer.multas, 2, ',', '.');
  var document = {
    html: html,
    data: dadosPDF,
    path: './mediafiles/'+timestamp+'.pdf',
    type: "buffer",
  };
  pdf
    .create(document, options)
    .then((doc) => {
        res.setHeader("Content-Type", "application/pdf");
        res.setHeader("Content-Disposition", "inline; filename=comprovativo_pagamento.pdf");
        res.status(200).send(doc); 
    })
    .catch((error) => {
        console.error(error);
    });
}

async function createDeclaracaoFrequencia(req, res) {
  const { id } = req.params;

  // Carrega o template HTML
  const html = fs.readFileSync("./templates/declaracao_frequencia.html", "utf8");

  const matricula = await Matricula.findOne({
    where: { id },
    include: [
      { model: Estudante },
      { model: AnoLectivo },
      { model: Sala },
      { model: Periodo },
      { model: Classe },
      { model: User }
    ]
  });

  const curso = await Curso.findOne({ where: { id: matricula.curso_id } });

  // Mapear números de meses para seus nomes em português
  const meses = [
    "Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho",
    "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"
  ];

  // Obter a data de hoje
  const dataHoje = new Date();
  const dia = dataHoje.getDate();
  const mes = meses[dataHoje.getMonth()];
  const ano = dataHoje.getFullYear();

  // Formatar a data no formato desejado
  const dataFormatada = `Huambo aos ${dia} de ${mes} de ${ano}`;

  const dadosPDF = {
    header: {
      nome_curso: curso.nome,
      nome_ano: matricula.AnoLectivo.nome,
      ano: new Date().getFullYear(),
      logo:logo,
      insignia:logoRepublica
    },
    estudante: {
      id: matricula.id,
      data_matricula: matricula.createdAt,
      numero: matricula.Estudante.numero,
      numero_processual: matricula.Estudante.numero_processual,
      data_nascimento: moment(matricula.Estudante.data_de_nascimento).format("DD / MM / YYYY"),
      idade: new Date().getFullYear() - moment(matricula.Estudante.data_de_nascimento).format("YYYY"),
      nome: matricula.Estudante.nome,
      numero_processo: matricula.Estudante.numero_processo,
      nome_pai: matricula.Estudante.nome_pai,
      nome_mae: matricula.Estudante.nome_mae,
      identificacao: matricula.Estudante.identificacao,
      local_emissao_identificacao: matricula.Estudante.local_emissao_identificacao,
      data_emissao_bi: moment(matricula.Estudante.data_emissao_bi).format("DD / MM / YYYY"),
      telefone: matricula.Estudante.telefone,
      email: matricula.Estudante.email,
      nacionalidade: matricula.Estudante.nacionalidade,
      naturalidade: matricula.Estudante.naturalidade,
      municipio: matricula.Estudante.municipio,
      provincia: matricula.Estudante.provincia,
      bairro: matricula.Estudante.bairro,
      genero: matricula.Estudante.genero,
      estado_civil: matricula.Estudante.estado_civil,
      lingua_opcao: matricula.Estudante.lingua_opcao,
      escola_anterior: matricula.Estudante.escola_anterior,
      residencia: matricula.Estudante.residencia,
      necessidade_especial: matricula.Estudante.necessidade_especial,
      encarregado: matricula.Estudante.encarregado,
      contacto_encarregado: matricula.Estudante.contacto_encarregado,
      grau_parentesco: matricula.Estudante.grau_parentesco,
      sala: matricula.Sala.nome,
      periodo: matricula.Periodo.nome,
      classe: matricula.Classe.nome,
      operador: matricula.User.nome,
      data: moment(matricula.createdAt).format("DD-MM-YYYY"),
      today: dataFormatada // Passa a data formatada para o objeto de dados
    }
  };

  const document = {
    html: html,
    data: dadosPDF,
    type: "buffer", // Gera como buffer
  };

  pdf
    .create(document, options)
    .then((buffer) => {
      res.setHeader("Content-Type", "application/pdf");
      res.setHeader("Content-Disposition", "inline; filename=comprovativo_matricula.pdf");
      res.status(200).send(buffer); // Envia o buffer como resposta
    })
    .catch((error) => {
      console.error(error);
      res.status(500).send("Erro ao gerar o PDF");
    });
}

module.exports = {
  createComprovativoMatricula,
  createListaMatriculados,
  createComprovativoPagamento,
  createFluxoDeCaixa,
  createMapaDeFaltas,
  createDeclaracaoFrequencia
}