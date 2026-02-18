const { Pagamento, ItensPagamento, Matricula, Emolumento, EmolumentoPreco, Despesa, User, Estudante } = require("../models/Model");
const Sequelize = require("sequelize");

const { Op } = require('sequelize');

async function filterData(req, res) {
    const { start_date, end_date } = req.params;

    try {
        const pagamentos = await Pagamento.findAll({
            attributes: [
                'id',
                'descricao',
                'createdAt',
                [Sequelize.fn('SUM', Sequelize.literal('`ItensPagamentos->EmolumentoPreco`.`preco` - (`ItensPagamentos->EmolumentoPreco`.`preco` * `ItensPagamentos`.`desconto` / 100) + (`ItensPagamentos->EmolumentoPreco`.`preco` * `ItensPagamentos`.`multa` / 100)')), 'totalPrice'],
            ],
            include: [
                {
                    model: ItensPagamento,
                    attributes: [],
                    include: [
                        {
                            model: EmolumentoPreco,
                            attributes: []
                        }
                    ]
                },
                {
                    model: User,
                    attributes: ['id', 'foto', 'nome', 'telefone', 'email', 'nivel', 'senha', 'status', 'updatedAt']
                },
                {
                    model: Estudante,
                    attributes: ['id', 'numero', 'identificacao', 'nome', 'telefone', 'data_de_nascimento', 'genero', 'estado_civil', 'escola_anterior', 'residencia', 'necessidade_especial', 'curso_id', 'encarregado', 'contacto_encarregado', 'status', 'user_id', 'createdAt', 'updatedAt']
                }
            ],
            where: {
                createdAt: {
                    [Op.between]: ['2024-06-29 23:00:00', '2024-08-30 23:00:00']
                }
            },
            group: ['Pagamento.id']
        });
        
        console.log(pagamentos);
        const despesas = await Despesa.findAll({
            where: {
                createdAt: {
                    [Sequelize.Op.between]: [start_date, end_date]
                }
            },
            include: [User]
        });

        const data = {
            entradas: pagamentos,
            saidas: despesas
        };

        res.status(200).json(data);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Erro ao filtrar dados' });
    }
};

async function getDevedores(req, res){
    const {ano_id, emolumento_id, sala_id} = req.params;
    try {
        // 1. Encontrar IDs dos estudantes da sala específica
        const studentsInSala = await Matricula.findAll({
            attributes: ['estudante_id'],
            where: {
                sala_id: sala_id // Filtrar por sala_id
            }
        });

        const studentIdsInSala = studentsInSala.map(matricula => matricula.estudante_id);

        // 2. Encontrar IDs dos estudantes que têm registros de ItensPagamento com o ano e emolumento específicos
        const studentsWithPayments = await Estudante.findAll({
            attributes: ['id'],
            include: [{
                model: Pagamento,
                attributes: [],
                where: {
                    ano_id: ano_id // Filtrar por ano_id
                },
                include: [{
                    model: ItensPagamento,
                    attributes: [],
                    where: {
                        emolumento_id: emolumento_id // Filtrar por emolumento_id
                    }
                }]
            }],
            where: {
                id: {
                    [Op.in]: studentIdsInSala // Considerar apenas estudantes da sala específica
                }
            },
            distinct: true
        });

        // Obter IDs dos estudantes que pagaram o emolumento no ano específico
        const studentIdsWithPayments = studentsWithPayments.map(student => student.id);

        // 3. Encontrar estudantes da sala específica que não pagaram o emolumento para o ano específico
        const nonPayingStudents = await Estudante.findAll({
            where: {
                id: {
                    [Op.in]: studentIdsInSala,
                    [Op.notIn]: studentIdsWithPayments
                }
            }
        });

        res.status(200).json(nonPayingStudents)
    } catch (error) {
        console.error('Erro ao encontrar estudantes que não pagaram:', error);
        throw error;
    }
}

module.exports = {
    filterData,
    getDevedores
};
