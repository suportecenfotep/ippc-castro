const { Pagamento, ItensPagamento, Emolumento, EmolumentoPreco, User, Estudante } = require("../models/Model");
const Sequelize = require('sequelize')
const { Io } = require("../config/server")

const create = (req, res) => {
    
    const form = req.body;

    Pagamento.create(form)
        .then(data => {
            form.itens.map(item => {
                const itemPagamento = {
                    pagamento_id:data.id,
                    ...form,
                    ...item
                }
                ItensPagamento
                .create(itemPagamento)
                .then(() => {
                    console.log(`+1 Registro Inserido`)
                })
                .catch(err => {
                    console.log(err)
                })
            })
            Io.emit("paymentChange", data)
            res.status(201).json({message:"Pagamento Efectuado com sucesso", data:data});
        })
        .catch(err => {
            res.status(500).json(err);
        });
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
            res.status(200).json(data);
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const update = (req, res) => {
    const { id } = req.params;
    const form = req.body;

    Pagamento.update(form, { where: { id } })
        .then(() => {
            res.status(201).json({message:"Pagamento atualizado com sucesso"});
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const remove = (req, res) => {
    const { id } = req.params;

    Pagamento.destroy({ where: { id } })
        .then(() => {
            res.status(201).json({message:"Pagamento anulado com sucesso"});
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const listAll = (req, res) => {
    Pagamento.findAll()
        .then(data => {
            res.status(200).json(data);
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const listByEstudante = (req, res) => {
    const { ano_id, estudante_id } = req.params;

    Pagamento.findAll({
        where: { ano_id, estudante_id },
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
        group: ['Pagamento.id'] 
    })
    .then(data => {
        res.status(200).json(data);
    })
    .catch(err => {
        res.status(500).json(err);
    });
};


async function listByStudentOrUser(req, res){
    const { estudante_id } = req.params;

    const pagamentos = await Pagamento.findAll({
        where: { estudante_id },
        include: [
            {
                model: ItensPagamento,
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
                ]
            },
            {
                model:User,
                attributes:['id','nome']
            }
        ],
        attributes: [
            'id',
            'descricao',
            [Sequelize.fn('SUM', Sequelize.literal('preco - (preco * desconto / 100) + (preco * multa / 100)')), 'totalPrice']
        ],
        group: ['Pagamento.id'] 
    })

    res.status(201).json(pagamentos)
};


module.exports = {
    create,
    read,
    update,
    remove,
    listAll,
    listByEstudante,
    listByStudentOrUser
};
