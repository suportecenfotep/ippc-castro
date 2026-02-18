const { Pagamento, ItensPagamento, Emolumento, EmolumentoPreco, User, Estudante, Notification } = require("../models/Model");
const Sequelize = require('sequelize')
const { Io } = require("../config/server")
const fs = require("fs")
const path = require("path")
const crypto = require("crypto");
const xml2js = require('xml2js');
const moment = require("moment");
const conn = require("../config/db")
const {Op} = require("sequelize")

function generateSAFTAOInvoiceHash(previousHash, invoiceDate, invoiceNo, grossTotal, taxPayable) {
  const prevHash = previousHash || '0';
  const dateStr = (typeof invoiceDate === 'string') 
    ? invoiceDate 
    : invoiceDate.toISOString().split('T')[0];
  const dataToHash = `${invoiceNo};${dateStr};${grossTotal.toFixed(2)};${taxPayable.toFixed(2)};${prevHash}`;
  return crypto.createHash('sha1').update(dataToHash).digest('hex').toUpperCase();
}

const create = async (req, res) => {
  const t = await conn.transaction();
  try {
    const form = req.body;
    const { estudante_id, ano_id, itens = [], doc_type = 'FR' } = form;
    const anoAtual = new Date().getFullYear();

    // 1. Validações iniciais
    if (!estudante_id || !ano_id || itens.length === 0) {
      throw new Error("Dados incompletos para efetuar o pagamento.");
    }

    // 2. Cálculo do Valor Total (GrossTotal)
    const valorTotalDocumento = itens.reduce((acc, item) => {
      const preco = parseFloat(item.preco_venda || item.preco) || 0;
      const multa = parseFloat(item.multa) || 0;
      const desconto = parseFloat(item.desconto) || 0;
      return acc + (preco + multa - desconto);
    }, 0);

    // 3. Gestão de Numeração Padrão: FR 2025/1
    const ultimoDoc = await Pagamento.findOne({
      where: { 
        // Filtra pelo tipo de documento e pelo ano atual na string do número
        numero: { [Op.like]: `${doc_type} ${anoAtual}/%` }
      },
      order: [['createdAt', 'DESC']],
      transaction: t
    });

    let proximoNumero = 1;
    if (ultimoDoc && ultimoDoc.numero) {
      // Extrai o número após a barra (ex: de "FR 2025/15" pega "15")
      const partes = ultimoDoc.numero.split('/');
      if (partes.length > 1) {
        proximoNumero = parseInt(partes[1]) + 1;
      }
    }

    // Define o número no formato oficial: Tipo Ano/Sequencia
    const saftNo = `${doc_type} ${anoAtual}/${proximoNumero}`;
    form.numero = saftNo; 

    // 4. Geração de Hash SAFT e Assinatura Digital
    const hashAnterior = ultimoDoc?.hash || '0';
    const saftDate = moment().format('YYYY-MM-DD');
    
    // Gerar Hash SAFT
    form.hash = generateSAFTAOInvoiceHash(hashAnterior, saftDate, saftNo, valorTotalDocumento, 0);

    // Assinatura Digital RSA
    const privateKeyPath = path.join(__dirname, '../keys/private.txt');
    const privateKey = fs.readFileSync(privateKeyPath, 'utf8');
    
    // Payload: Data|Data_Criacao|No_Doc|GrossTotal|HashAnterior
    const signPayload = `${saftDate}|${moment().format('YYYY-MM-DDTHH:mm:ss')}|${saftNo}|${valorTotalDocumento.toFixed(2)}|${hashAnterior}`;
    
    const signature = crypto.sign('sha256', Buffer.from(signPayload), {
      key: privateKey,
      passphrase: 'centro123',
      padding: crypto.constants.RSA_PKCS1_PSS_PADDING
    }).toString('base64');

    form.assinatura = signature; // Salva a assinatura no banco se tiver o campo

    // 5. Persistência
    const novoPagamento = await Pagamento.create(form, { transaction: t });

    const itensPayload = itens.map(item => ({
      ...item,
      pagamento_id: novoPagamento.id,
      metodo_pagamento: form.metodo_pagamento || 'TPA'
    }));

    await ItensPagamento.bulkCreate(itensPayload, { transaction: t });

    await t.commit();

    return res.status(201).json({
      message: "Pagamento efetuado com sucesso",
      data: novoPagamento,
      valorTotal: valorTotalDocumento,
      signature: signature
    });

  } catch (error) {
    if (t) await t.rollback();
    console.error("Erro:", error);
    return res.status(400).json({ message: error.message });
  }
};

const read = (req, res) => {
    const { id } = req.params;

    Pagamento.findOne({ 
        where: { id },
        include:[
            {
                model:ItensPagamento,
                include:[
                    {
                        model:Emolumento,
                        attributes:['nome']
                    },
                    {
                        model:EmolumentoPreco,
                        attributes:['preco']
                    }
                ]
            },
            {
                model:User
            }
        ]
    })
        .then(data => {
            if (!data) {
                return res.status(404).json({ message: "Pagamento não encontrado" });
            }

            // Cálculo e agregação da lista de itens pagos (corrigido e mantido)
            let totalDocumento = 0;
            if (data.ItensPagamentos) {
                totalDocumento = data.ItensPagamentos.reduce((total, item) => {
                    const preco = item.EmolumentoPreco ? item.EmolumentoPreco.preco : 0;
                    const desconto = item.desconto || 0;
                    const multa = item.multa || 0;
                    const valorLiquido = preco - (preco * desconto / 100) + (preco * multa / 100);
                    return total + valorLiquido;
                }, 0);
            }
            
            const itensPagos = data.ItensPagamentos
                ? data.ItensPagamentos.map(item => item.Emolumento ? item.Emolumento.nome : 'Emolumento Desconhecido').join(', ') 
                : 'Nenhum item pago';

            const resultado = {
                ...data.toJSON(),
                totalDocumento: parseFloat(totalDocumento.toFixed(2)),
                itensPagos // Retorna os itens pagos
            };

            res.status(200).json(resultado);
        })
        .catch(err => {
            console.error("Erro ao ler pagamento:", err);
            res.status(500).json(err);
        });
};

const update = (req, res) => {
    const { id } = req.params;
    const form = req.body;

    Pagamento.update(form, { where: { id } })
        .then(() => {
            res.status(200).json({message:"Pagamento atualizado com sucesso"});
        })
        .catch(err => {
            console.error("Erro ao atualizar pagamento:", err);
            res.status(500).json(err);
        });
};

const remove = async (req, res) => {
    const { id } = req.params;
    const t = await conn.transaction();

    try {
        // 1. Busca o pagamento original
        const pagamentoOriginal = await Pagamento.findByPk(id, {
            include: [{ 
                model: ItensPagamento, 
                include: [{ model: EmolumentoPreco }] 
            }],
            transaction: t
        });

        if (!pagamentoOriginal || pagamentoOriginal.estado === 'Anulado') {
            throw new Error("Pagamento não encontrado ou já anulado.");
        }

        // 2. Calcula o total para a Nota de Crédito (NC)
        const totalOriginal = pagamentoOriginal.ItensPagamentos.reduce((acc, item) => {
            const preco = parseFloat(item.EmolumentoPreco?.preco) || 0;
            const desc = item.desconto || 0;
            const multa = item.multa || 0;
            return acc + (preco - (preco * desc / 100) + (preco * multa / 100));
        }, 0);

        // 3. Muda estado do original
        await pagamentoOriginal.update({ estado: 'Anulado' }, { transaction: t });

        // 4. Busca o último hash para a corrente SAFT
        const ultimoDocGeral = await Pagamento.findOne({
            order: [['createdAt', 'DESC']],
            transaction: t
        });

        const hashAnterior = ultimoDocGeral?.hash || '0';
        const dataNC = moment().format('YYYY-MM-DD');
        const numeroNC = `NC ${pagamentoOriginal.numero}`; // Nota de Crédito referente à FR

        // 5. Gera o Hash SAFT usando sua função
        const novoHashNC = generateSAFTAOInvoiceHash(
            hashAnterior, 
            dataNC, 
            numeroNC, 
            totalOriginal, 
            0 // taxPayable
        );

        // 6. Cria a Nota de Crédito no Banco
        const nc = await Pagamento.create({
            doc_type: 'NC',
            numero: numeroNC,
            estudante_id: pagamentoOriginal.estudante_id,
            ano_id: pagamentoOriginal.ano_id,
            user_id: req.user.id,
            hash: novoHashNC,
            estado: 'Anulado' // NC de estorno não deve somar no balanço de vendas
        }, { transaction: t });

        // 7. Replica os itens para a NC
        const itensNC = pagamentoOriginal.ItensPagamentos.map(item => ({
            ...item.toJSON(),
            id: undefined,
            pagamento_id: nc.id
        }));
        await ItensPagamento.bulkCreate(itensNC, { transaction: t });

        await t.commit();

        Io.emit("paymentChange");
        return res.status(200).json({ message: "Documento anulado e estornado (NC) com sucesso" });

    } catch (error) {
        if (t) await t.rollback();
        res.status(400).json({ error: error.message });
    }
};

const listAll = (req, res) => {
    Pagamento.findAll({
        include: [
            {
                model: ItensPagamento,
                attributes: ['id', 'desconto', 'multa'],
                include: [
                    { model: Emolumento, attributes: ['nome'] },
                    { model: EmolumentoPreco, attributes: ['preco'] }
                ]
            },
            { model: User, attributes: ['id', 'nome'] }, 
            { model: Estudante, attributes: ['id', 'nome'] } 
        ]
    })
    .then(data => {
        const resultadosFormatados = data.map(pagamento => {
            let totalDocumento = 0;
            if (pagamento.ItensPagamentos) {
                totalDocumento = pagamento.ItensPagamentos.reduce((total, item) => {
                    const preco = item.EmolumentoPreco ? item.EmolumentoPreco.preco : 0;
                    const desconto = item.desconto || 0;
                    const multa = item.multa || 0;
                    const valorLiquido = preco - (preco * desconto / 100) + (preco * multa / 100);
                    return total + valorLiquido;
                }, 0);
            }

            // Cálculo e agregação da lista de itens pagos (corrigido e mantido)
            const itensPagos = pagamento.ItensPagamentos
                ? pagamento.ItensPagamentos.map(item => item.Emolumento ? item.Emolumento.nome : 'Emolumento Desconhecido').join(', ')
                : 'Nenhum item pago';

            return {
                ...pagamento.toJSON(),
                totalPrice: parseFloat(totalDocumento.toFixed(2)), 
                itensPagos // Retorna os itens pagos
            };
        });
        res.status(200).json(resultadosFormatados);
    })
    .catch(err => {
        console.error("Erro ao listar todos os pagamentos:", err);
        res.status(500).json(err);
    });
};

const listByEstudante = async (req, res) => {
    const { ano_id, estudante_id } = req.params;

    try {
        const pagamentos = await Pagamento.findAll({
            where: { ano_id, estudante_id },
            include: [
                {
                    model: ItensPagamento,
                    include: [
                        { model: Emolumento, attributes: ['nome'] },
                        { model: EmolumentoPreco, attributes: ['preco'] }
                    ]
                },
                { model: User, attributes: ['id', 'nome', 'email'] },
                { model: Estudante, attributes: ['id', 'nome', 'numero'] }
            ],
        });
        
        const resultadosFormatados = pagamentos.map(pagamento => {
            let totalDocumento = 0;
            if (pagamento.ItensPagamentos) {
                totalDocumento = pagamento.ItensPagamentos.reduce((total, item) => {
                    const preco = item.EmolumentoPreco ? item.EmolumentoPreco.preco : 0;
                    const desconto = item.desconto || 0;
                    const multa = item.multa || 0;
                    const valorLiquido = preco - (preco * desconto / 100) + (preco * multa / 100);
                    return total + valorLiquido;
                }, 0);
            }

            // Cálculo e agregação da lista de itens pagos (corrigido e mantido)
            const itensPagos = pagamento.ItensPagamentos
                ? pagamento.ItensPagamentos.map(item => item.Emolumento ? item.Emolumento.nome : 'Emolumento Desconhecido').join(', ')
                : 'Nenhum item pago';

            return {
                ...pagamento.toJSON(),
                totalPrice: parseFloat(totalDocumento.toFixed(2)),
                itensPagos // Retorna os itens pagos
            };
        });

        res.status(200).json(resultadosFormatados);
    } catch (err) {
        console.error("Erro ao listar pagamentos por estudante:", err);
        res.status(500).json(err);
    }
};


async function listByStudentOrUser(req, res){
    const { estudante_id } = req.params;

    try {
        const pagamentos = await Pagamento.findAll({
            where: { estudante_id },
            include: [
                {
                    model: ItensPagamento,
                    include: [
                        { model: Emolumento, attributes: ['nome'] },
                        { model: EmolumentoPreco, attributes: ['id', 'preco'] }
                    ]
                },
                { model:User, attributes:['id','nome'] }
            ],
            attributes: [
                'id',
                'descricao',
                'createdAt',
            ],
        });
        
        const resultadosFormatados = pagamentos.map(pagamento => {
            let totalDocumento = 0;
            if (pagamento.ItensPagamentos) {
                totalDocumento = pagamento.ItensPagamentos.reduce((total, item) => {
                    const preco = item.EmolumentoPreco ? item.EmolumentoPreco.preco : 0;
                    const desconto = item.desconto || 0;
                    const multa = item.multa || 0;
                    const valorLiquido = preco - (preco * desconto / 100) + (preco * multa / 100);
                    return total + valorLiquido;
                }, 0);
            }

            // Cálculo e agregação da lista de itens pagos (corrigido e mantido)
            const itensPagos = pagamento.ItensPagamentos
                ? pagamento.ItensPagamentos.map(item => item.Emolumento ? item.Emolumento.nome : 'Emolumento Desconhecido').join(', ')
                : 'Nenhum item pago';

            return {
                ...pagamento.toJSON(),
                totalPrice: parseFloat(totalDocumento.toFixed(2)),
                itensPagos: itensPagos, // Retorna os itens pagos
            };
        });

        res.status(200).json(resultadosFormatados);
    } catch (err) {
        console.error("Erro ao listar pagamentos por estudante ou usuário:", err);
        res.status(500).json(err);
    }
}

const getBalances = async (req, res) => {
    const { ano_id } = req.params;
    const { Op } = Sequelize;

    try {
        // Filtro base: Apenas pagamentos confirmados
        const baseWhere = { estado: 'Pago' };

        const [dailyBalance, weeklyBalance, monthlyBalance, yearlyBalance] = await Promise.all([
            // Diário
            Pagamento.findAll({
                attributes: [
                    [Sequelize.fn('SUM', Sequelize.literal('`ItensPagamentos->EmolumentoPreco`.`preco` - (`ItensPagamentos->EmolumentoPreco`.`preco` * `ItensPagamentos`.`desconto` / 100) + (`ItensPagamentos->EmolumentoPreco`.`preco` * `ItensPagamentos`.`multa` / 100)')), 'total'],
                ],
                where: {
                    ...baseWhere,
                    createdAt: { [Op.gte]: Sequelize.fn('CURDATE') }
                },
                include: [{ model: ItensPagamento, attributes: [], include: [{ model: EmolumentoPreco, attributes: [] }] }],
                subQuery: false, group: ['Pagamento.id']
            }),
            // Semanal
            Pagamento.findAll({
                attributes: [
                    [Sequelize.fn('SUM', Sequelize.literal('`ItensPagamentos->EmolumentoPreco`.`preco` - (`ItensPagamentos->EmolumentoPreco`.`preco` * `ItensPagamentos`.`desconto` / 100) + (`ItensPagamentos->EmolumentoPreco`.`preco` * `ItensPagamentos`.`multa` / 100)')), 'total'],
                ],
                where: {
                    ...baseWhere,
                    [Op.and]: [
                        Sequelize.where(Sequelize.fn('YEARWEEK', Sequelize.col('Pagamento.createdAt'), 1), Sequelize.fn('YEARWEEK', Sequelize.fn('CURDATE'), 1))
                    ]
                },
                include: [{ model: ItensPagamento, attributes: [], include: [{ model: EmolumentoPreco, attributes: [] }] }],
                subQuery: false, group: ['Pagamento.id']
            }),
            // Mensal
            Pagamento.findAll({
                attributes: [
                    [Sequelize.fn('SUM', Sequelize.literal('`ItensPagamentos->EmolumentoPreco`.`preco` - (`ItensPagamentos->EmolumentoPreco`.`preco` * `ItensPagamentos`.`desconto` / 100) + (`ItensPagamentos->EmolumentoPreco`.`preco` * `ItensPagamentos`.`multa` / 100)')), 'total'],
                ],
                where: {
                    ...baseWhere,
                    [Op.and]: [
                        Sequelize.where(Sequelize.fn('MONTH', Sequelize.col('Pagamento.createdAt')), Sequelize.fn('MONTH', Sequelize.fn('CURDATE'))),
                        Sequelize.where(Sequelize.fn('YEAR', Sequelize.col('Pagamento.createdAt')), Sequelize.fn('YEAR', Sequelize.fn('CURDATE')))
                    ]
                },
                include: [{ model: ItensPagamento, attributes: [], include: [{ model: EmolumentoPreco, attributes: [] }] }],
                subQuery: false, group: ['Pagamento.id']
            }),
            // Anual (por ano_id)
            Pagamento.findAll({
                attributes: [
                    [Sequelize.fn('SUM', Sequelize.literal('`ItensPagamentos->EmolumentoPreco`.`preco` - (`ItensPagamentos->EmolumentoPreco`.`preco` * `ItensPagamentos`.`desconto` / 100) + (`ItensPagamentos->EmolumentoPreco`.`preco` * `ItensPagamentos`.`multa` / 100)')), 'total'],
                ],
                where: { ...baseWhere, ano_id },
                include: [{ model: ItensPagamento, attributes: [], include: [{ model: EmolumentoPreco, attributes: [] }] }],
                subQuery: false, group: ['Pagamento.id']
            })
        ]);

        const totalReduce = (arr) => arr.length > 0 
            ? parseFloat(arr.reduce((acc, curr) => acc + parseFloat(curr.dataValues.total || 0), 0).toFixed(2)) 
            : 0;

        res.status(200).json({
            daily: totalReduce(dailyBalance),
            weekly: totalReduce(weeklyBalance),
            monthly: totalReduce(monthlyBalance),
            yearly: totalReduce(yearlyBalance),
        });
    } catch (err) {
        console.error("Erro ao calcular saldos:", err);
        res.status(500).json({ message: "Erro ao calcular os saldos", error: err.message });
    }
};

const getMonthlyTotals = async (req, res) => {
    try {
        const pagamentosMensais = await Pagamento.findAll({
            attributes: [
                [Sequelize.fn('MONTH', Sequelize.col('Pagamento.createdAt')), 'mes'],
                [Sequelize.fn('YEAR', Sequelize.col('Pagamento.createdAt')), 'ano'],
                [Sequelize.fn('SUM', Sequelize.literal('`ItensPagamentos->EmolumentoPreco`.`preco` - (`ItensPagamentos->EmolumentoPreco`.`preco` * `ItensPagamentos`.`desconto` / 100) + (`ItensPagamentos->EmolumentoPreco`.`preco` * `ItensPagamentos`.`multa` / 100)')), 'totalPagamentos'],
            ],
            include: [
                { model: ItensPagamento, attributes: [], include: [{ model: EmolumentoPreco, attributes: [] }] },
            ],
            where: {
                estado: 'Pago',
                [Sequelize.Op.and]: [
                    Sequelize.where(Sequelize.fn('MONTH', Sequelize.col('Pagamento.createdAt')), { [Sequelize.Op.in]: [9, 10, 11, 12, 1, 2, 3, 4, 5, 6, 7] })
                ]
            },
            subQuery: false,
            group: [Sequelize.fn('YEAR', Sequelize.col('Pagamento.createdAt')), Sequelize.fn('MONTH', Sequelize.col('Pagamento.createdAt'))],
            order: [
                [Sequelize.fn('YEAR', Sequelize.col('Pagamento.createdAt')), 'ASC'],
                [Sequelize.fn('MONTH', Sequelize.col('Pagamento.createdAt')), 'ASC'],
            ],
        });

        const resultados = pagamentosMensais.map((item) => ({
            ano: item.dataValues.ano,
            mes: item.dataValues.mes,
            totalPagamentos: parseFloat(parseFloat(item.dataValues.totalPagamentos || 0).toFixed(2))
        }));

        res.status(200).json(resultados);
    } catch (err) {
        console.error("Erro ao calcular totais mensais:", err);
        res.status(500).json({ message: 'Erro ao calcular os totais mensais', error: err.message });
    }
};

const getAnnualTotals = async (req, res) => {
    try {
        const pagamentosAnuais = await Pagamento.findAll({
            attributes: [
                [Sequelize.fn('YEAR', Sequelize.col('Pagamento.createdAt')), 'ano'],
                [Sequelize.fn('SUM', Sequelize.literal('`ItensPagamentos->EmolumentoPreco`.`preco` - (`ItensPagamentos->EmolumentoPreco`.`preco` * `ItensPagamentos`.`desconto` / 100) + (`ItensPagamentos->EmolumentoPreco`.`preco` * `ItensPagamentos`.`multa` / 100)')), 'totalPagamentos'],
            ],
            include: [
                { model: ItensPagamento, attributes: [], include: [{ model: EmolumentoPreco, attributes: [] }] },
            ],
            where: {
                estado: 'Pago',
                createdAt: {
                    [Sequelize.Op.between]: [new Date('2021-01-01'), new Date('2027-12-31')],
                },
            },
            subQuery: false,
            group: [Sequelize.fn('YEAR', Sequelize.col('Pagamento.createdAt'))],
            order: [[Sequelize.fn('YEAR', Sequelize.col('Pagamento.createdAt')), 'ASC']],
        });

        const resultados = pagamentosAnuais.map((item) => ({
            ano: item.dataValues.ano,
            totalPagamentos: parseFloat(parseFloat(item.dataValues.totalPagamentos || 0).toFixed(2)),
        }));

        res.status(200).json(resultados);
    } catch (err) {
        console.error("Erro ao calcular totais anuais:", err);
        res.status(500).json({ message: 'Erro ao calcular os totais anuais', error: err.message });
    }
};

const generateSaftXML = async (req, res) => {
  try {
    const { start_date, end_date } = req.query; // Ou params, conforme sua rota
    const taxAccountingBasis = 'P'; // P para faturação de pagamentos

    const formatNumber = (value) => Number(value || 0).toFixed(2);

    // 1. Buscar dados da Instituição (Empresa)
    // Aqui você pode buscar de uma tabela Config ou Empresa
    const empresa = {
      nif: '50002047',
      nome: 'INSTITUTO POLITÉCNICO PRIVADO CASTRO',
      endereco: 'Huambo, estrada nacional 260, bairro da Bomba Baixa',
      cidade: 'Huambo'
    };

    // 2. Buscar Pagamentos no período
    const documentos = await Pagamento.findAll({
      where: {
        createdAt: { [Op.between]: [start_date, end_date] }
      },
      include: [
        { model: Estudante },
        { 
          model: ItensPagamento, 
          include: [
            { model: Emolumento },
            { model: EmolumentoPreco }
          ] 
        }
      ],
      order: [['createdAt', 'ASC']]
    });

    if (documentos.length === 0) {
      return res.status(404).json({ error: 'Nenhum pagamento encontrado no período' });
    }

    // 3. Preparar Mapas de Estudantes e Emolumentos (MasterFiles)
    const estudantesMap = new Map();
    const emolumentosMap = new Map();

    documentos.forEach(doc => {
      if (doc.Estudante) estudantesMap.set(doc.Estudante.id, doc.Estudante);
      (doc.ItensPagamentos || []).forEach(item => {
        if (item.Emolumento) emolumentosMap.set(item.Emolumento.id, item.Emolumento);
      });
    });

    let totalDebit = 0;
    let totalCredit = 0;
    const invoices = [];

    // 4. Processar Documentos
    for (const doc of documentos) {
      const isAnulado = doc.estado === 'Anulado';
      const invoiceNo = `${doc.numero}`;
      const invoiceDateStr = moment(doc.createdAt).format('YYYY-MM-DD');
      const systemEntryDateStr = moment(doc.createdAt).format('YYYY-MM-DDTHH:mm:ss');

      let netTotal = 0;
      
      const lines = (doc.ItensPagamentos || []).map((item, idx) => {
        const precoBase = parseFloat(item.EmolumentoPreco?.preco) || 0;
        const multa = parseFloat(item.multa) || 0;
        const desconto = parseFloat(item.desconto) || 0;
        
        // Cálculo: (Preço + Multa) - Desconto
        const totalLinha = precoBase + multa - desconto;
        netTotal += totalLinha;

        if (doc.doc_type === 'NC') totalDebit += totalLinha;
        else totalCredit += totalLinha;

        return {
          LineNumber: (idx + 1).toString(),
          ProductCode: item.emolumento_id.toString(),
          ProductDescription: item.Emolumento?.nome || 'Emolumento',
          Quantity: '1',
          UnitOfMeasure: 'un',
          UnitPrice: formatNumber(precoBase),
          TaxPointDate: invoiceDateStr,
          Description: item.Emolumento?.nome || '',
          ...(doc.doc_type === 'NC' ? { DebitAmount: formatNumber(totalLinha) } : { CreditAmount: formatNumber(totalLinha) }),
          Tax: {
            TaxType: 'IVA',
            TaxCountryRegion: 'AO',
            TaxCode: 'ISE',
            TaxPercentage: '0.00'
          },
          TaxExemptionReason: 'Isento nos termos da Lei (Educação)',
          TaxExemptionCode: 'M00' 
        };
      });

      invoices.push({
        InvoiceNo: invoiceNo,
        DocumentStatus: {
          InvoiceStatus: isAnulado ? 'A' : 'N',
          InvoiceStatusDate: systemEntryDateStr,
          SourceID: doc.user_id?.toString() || '1',
          SourceBilling: 'P'
        },
        Hash: doc.hash,
        HashControl: '1',
        Period: moment(doc.createdAt).format('MM'),
        InvoiceDate: invoiceDateStr,
        InvoiceType: doc.doc_type,
        SpecialRegimes: { SelfBillingIndicator: 0, CashVATSchemeIndicator: 0, ThirdPartiesBillingIndicator: 0 },
        SourceID: doc.user_id?.toString() || '1',
        SystemEntryDate: systemEntryDateStr,
        CustomerID: doc.estudante_id.toString(),
        Line: lines,
        DocumentTotals: {
          TaxPayable: '0.00',
          NetTotal: formatNumber(netTotal),
          GrossTotal: formatNumber(netTotal)
        }
      });
    }

    // 5. Estrutura Final do XML
    const xmlObj = {
      AuditFile: {
        $: {
          xmlns: 'urn:OECD:StandardAuditFile-Tax:AO_1.01_01',
          'xmlns:xsi': 'http://www.w3.org/2001/XMLSchema-instance'
        },
        Header: {
          AuditFileVersion: '1.01_01',
          CompanyID: empresa.nif,
          TaxRegistrationNumber: empresa.nif,
          TaxAccountingBasis: taxAccountingBasis,
          CompanyName: empresa.nome,
          CompanyAddress: { AddressDetail: empresa.endereco, City: empresa.cidade, Country: 'AO' },
          FiscalYear: moment(start_date).year(),
          StartDate: start_date,
          EndDate: end_date,
          CurrencyCode: 'AOA',
          DateCreated: moment().format('YYYY-MM-DD'),
          TaxEntity: 'Global',
          ProductCompanyTaxID: empresa.nif,
          SoftwareValidationNumber: '330/AGT/2021',
          ProductID: 'CENFOLITE',
          ProductVersion: '1.0'
        },
        MasterFiles: {
          Customer: Array.from(estudantesMap.values()).map(est => ({
            CustomerID: est.id.toString(),
            AccountID: 'Desconhecido',
            CustomerTaxID: '999999999',
            CompanyName: est.nome,
            BillingAddress: { AddressDetail: 'Huambo', City: 'Huambo', Country: 'AO' },
            SelfBillingIndicator: 0
          })),
          Product: Array.from(emolumentosMap.values()).map(emo => ({
            ProductType: 'S', 
            ProductCode: emo.id.toString(),
            ProductDescription: emo.nome,
            ProductNumberCode: emo.id.toString()
          })),
          TaxTable: {
            TaxTableEntry: {
              TaxType: 'IVA',
              TaxCountryRegion: 'AO',
              TaxCode: 'ISE',
              Description: 'Isento',
              TaxPercentage: '0.00'
            }
          }
        },
        SourceDocuments: {
          SalesInvoices: {
            NumberOfEntries: documentos.length.toString(),
            TotalDebit: formatNumber(totalDebit),
            TotalCredit: formatNumber(totalCredit),
            Invoice: invoices
          }
        }
      }
    };

    const builder = new xml2js.Builder({ headless: false, renderOpts: { pretty: true } });
    const xml = builder.buildObject(xmlObj);

    res.set('Content-Type', 'application/xml');
    return res.send(xml);

  } catch (err) {
    console.error('Erro ao gerar SAF-T:', err);
    return res.status(500).json({ error: 'Erro interno ao gerar SAF-T' });
  }
};

const repairPaymentHistory = async (req, res) => {
    const t = await conn.transaction();
    try {
        // 1. Buscar todos os pagamentos que não têm número ou hash
        // Ordenamos por ID ou createdAt para não quebrar a corrente
        const pagamentosPendentes = await Pagamento.findAll({
            where: {
                [Op.or]: [
                    { numero: null },
                    { hash: null },
                    { hash: '' }
                ]
            },
            order: [['createdAt', 'ASC']],
            transaction: t
        });

        if (pagamentosPendentes.length === 0) {
            return res.status(200).json({ message: "Nenhum documento pendente de assinatura." });
        }

        let totalReparados = 0;

        for (const doc of pagamentosPendentes) {
            // 2. Buscar o Hash do documento imediatamente anterior no banco (mesmo que já exista)
            const ultimoDocHash = await Pagamento.findOne({
                where: {
                    createdAt: { [Op.lt]: doc.createdAt },
                    hash: { [Op.ne]: null }
                },
                order: [['createdAt', 'DESC']],
                transaction: t
            });

            const prevHash = ultimoDocHash ? ultimoDocHash.hash : '0';

            // 3. Gerar número de documento se não existir
            // Exemplo: FR 2024/1, FR 2024/2...
            let numeroDoc = doc.numero;
            if (!numeroDoc) {
                const anoAtual = moment(doc.createdAt).format('YYYY');
                const count = await Pagamento.count({
                    where: {
                        createdAt: {
                            [Op.between]: [
                                moment(doc.createdAt).startOf('year').toDate(),
                                doc.createdAt
                            ]
                        }
                    },
                    transaction: t
                });
                numeroDoc = `${doc.doc_type || 'FR'} ${anoAtual}/${count}`;
            }

            // 4. Calcular o Total (GrossTotal) para o Hash
            // Usando a mesma lógica das suas outras funções
            const itens = await ItensPagamento.findAll({
                where: { pagamento_id: doc.id },
                include: [EmolumentoPreco],
                transaction: t
            });

            const grossTotal = itens.reduce((acc, item) => {
                const preco = parseFloat(item.EmolumentoPreco?.preco) || 0;
                const desc = item.desconto || 0;
                const multa = item.multa || 0;
                return acc + (preco - (preco * desc / 100) + (preco * multa / 100));
            }, 0);

            // 5. Gerar o Hash usando sua função original
            const novoHash = generateSAFTAOInvoiceHash(
                prevHash,
                moment(doc.createdAt).format('YYYY-MM-DD'),
                numeroDoc,
                grossTotal,
                0 // taxPayable (ajuste se houver IVA)
            );

            // 6. Atualizar o registro
            await doc.update({
                numero: numeroDoc,
                hash: novoHash,
                estado: doc.estado || 'Pago'
            }, { transaction: t });

            totalReparados++;
        }

        await t.commit();
        res.status(200).json({ 
            message: `Sucesso! ${totalReparados} documentos foram numerados e assinados.`,
            detalhes: "A corrente de integridade SAFT foi restabelecida."
        });

    } catch (error) {
        if (t) await t.rollback();
        console.error(error);
        res.status(500).json({ error: "Erro na reparação: " + error.message });
    }
};

module.exports = {
    create,
    read,
    update,
    remove,
    listAll,
    listByEstudante,
    listByStudentOrUser,
    getBalances,
    getMonthlyTotals,
    getAnnualTotals, 
    generateSaftXML,
    repairPaymentHistory
};