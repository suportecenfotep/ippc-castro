const { Pagamento, ItensPagamento, Matricula, Emolumento, EmolumentoPreco, Despesa, User, Estudante } = require("../models/Model");
const Sequelize = require("sequelize");

const { Op } = require('sequelize');

async function filterData(req, res) {
    const { start_date, end_date } = req.params;

    try {
        // 1. Consulta Pagamentos
        const pagamentosData = await Pagamento.findAll({
            // REMOVIDA a coluna 'descricao' daqui, pois ela não existe na tabela Pagamento.
            // O campo 'descricao' no resultado final será gerado a partir dos itens pagos.
            attributes: ['id', 'createdAt', 'estudante_id'], 
            include: [
                {
                    model: ItensPagamento,
                    attributes: ['desconto', 'multa'],
                    include: [
                        {
                            model: EmolumentoPreco,
                            attributes: ['preco']
                        },
                        {
                            model: Emolumento,
                            attributes: ['nome'] 
                        }
                    ],
                    required: true // Garante que apenas pagamentos com itens sejam retornados
                },
                {
                    model: User,
                    attributes: ['id', 'nome', 'email', 'nivel']
                },
                {
                    model: Estudante,
                    attributes: ['id', 'nome', 'numero']
                }
            ],
            where: {
                createdAt: {
                    [Op.between]: [start_date, end_date]
                }
            },
        });
        
        // 2. Processamento dos dados no JavaScript
        const pagamentosFormatados = pagamentosData.map(pagamento => {
            let totalDocumento = 0;
            let itensPagosDescricao = 'Nenhum item pago';

            if (pagamento.ItensPagamentos && pagamento.ItensPagamentos.length > 0) {
                // a) Calcular o total do documento
                totalDocumento = pagamento.ItensPagamentos.reduce((total, item) => {
                    const preco = item.EmolumentoPreco ? item.EmolumentoPreco.preco : 0;
                    const desconto = item.desconto || 0;
                    const multa = item.multa || 0;
                    const valorLiquido = preco - (preco * desconto / 100) + (preco * multa / 100);
                    return total + valorLiquido;
                }, 0);

                // b) Criar a string de itens pagos (AGORA SUBSTITUI O CAMPO DESCRICAO)
                itensPagosDescricao = pagamento.ItensPagamentos
                    .map(item => item.Emolumento ? item.Emolumento.nome : 'Emolumento Desconhecido')
                    .join(', ');
            }

            return {
                id: pagamento.id,
                // NOVO: O campo 'descricao' no JSON de saída agora é a lista de itens pagos.
                descricao: itensPagosDescricao, 
                createdAt: pagamento.createdAt,
                totalPrice: parseFloat(totalDocumento.toFixed(2)),
                // Adicionamos os objetos de relacionamento
                User: pagamento.User ? pagamento.User.toJSON() : null,
                Estudante: pagamento.Estudante ? pagamento.Estudante.toJSON() : null,
                // Manter ItensPagamentos para depuração ou uso no front-end
                ItensPagamentos: pagamento.ItensPagamentos 
            };
        });

        // 3. Consulta Despesas (Mantida inalterada)
        const despesas = await Despesa.findAll({
            where: {
                createdAt: {
                    [Sequelize.Op.between]: [start_date, end_date]
                }
            },
            include: [User]
        });

        const data = {
            entradas: pagamentosFormatados, 
            saidas: despesas
        };

        res.status(200).json(data);
    } catch (error) {
        console.error("Erro ao filtrar dados:", error);
        // Garante que a mensagem de erro seja clara em caso de outros problemas
        res.status(500).json({ error: 'Erro ao filtrar dados: ' + error.message });
    }
};

// ... A função getDevedores permanece inalterada ...
async function getDevedores(req, res){
    const {ano_id, emolumento_id, sala_id} = req.params;
    try {
        const studentsInSala = await Matricula.findAll({
            attributes: ['estudante_id'],
            where: {
                sala_id: sala_id 
            }
        });

        const studentIdsInSala = studentsInSala.map(matricula => matricula.estudante_id);

        const studentsWithPayments = await Estudante.findAll({
            attributes: ['id'],
            include: [{
                model: Pagamento,
                attributes: [],
                where: {
                    ano_id: ano_id 
                },
                include: [{
                    model: ItensPagamento,
                    attributes: [],
                    where: {
                        emolumento_id: emolumento_id 
                    },
                    required: true 
                }],
                required: true 
            }],
            where: {
                id: {
                    [Op.in]: studentIdsInSala 
                }
            },
            group: ['Estudante.id'] 
        });

        const studentIdsWithPayments = studentsWithPayments.map(student => student.id);

        const nonPayingStudents = await Estudante.findAll({
            where: {
                id: {
                    [Op.in]: studentIdsInSala, 
                    [Op.notIn]: studentIdsWithPayments 
                }
            },
        });

        res.status(200).json(nonPayingStudents)
    } catch (error) {
        console.error('Erro ao encontrar estudantes que não pagaram:', error);
        res.status(500).json({ error: 'Erro ao encontrar devedores: ' + error.message });
    }
}

module.exports = {
    filterData,
    getDevedores
};