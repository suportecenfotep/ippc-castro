const { Estudante } = require("../models/Model");
const {gerarNumero} = require("../config/utils")

const create = (req, res) => {
    
    const form = {
        numero:gerarNumero(),
        ...req.body
    };

    Estudante
    .findOne({
        where:{
            identificacao:form.identificacao
        }
    })
    .then(student => {
        if(student){
            res.status(500).json("Este estudante já existe na base de dados")
        }else{
            Estudante.create(form)
            .then(data => {
                res.status(201).json({message:"Estudante inscrito com sucesso", data:data});
            })
            .catch(err => {
                res.status(500).json(err);
            });
        }
    })
};

const read = (req, res) => {
    const { id } = req.params;

    Estudante.findOne({ where: { id } })
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

    Estudante.update(form, { where: { id } })
        .then(() => {
            res.status(201).json({message:"Estudante atualizado com sucesso"});
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const remove = (req, res) => {
    const { id } = req.params;

    Estudante.destroy({ where: { id } })
        .then(() => {
            res.status(201).json({message:"Estudante excluído com sucesso"});
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const listAll = (req, res) => {
    Estudante.findAll()
        .then(data => {
            res.status(200).json(data);
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const listByStatus = (req, res) => {
    const { status } = req.params;

    Estudante.findAll({ where: { status } })
        .then(data => {
            res.status(200).json(data);
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const listByCourse = (req, res) => {
    const { curso_id } = req.params;

    Estudante.findAll({ where: { curso_id } })
        .then(data => {
            res.status(200).json(data);
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const searchByNumber = (req, res) => {
    const { numero } = req.params;

    Estudante.findOne({ where: { numero } })
        .then(data => {
            res.status(200).json(data);
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

module.exports = {
    create,
    read,
    update,
    remove,
    listAll,
    listByStatus,
    listByCourse,
    searchByNumber
};
