const { Funcionario } = require("../models/Model");

const create = (req, res) => {
    
    const form = req.body;

    Funcionario
    .findOne({
        where:{
            identificacao:form.identificacao
        }
    })
    .then(funcionario => {
        if(funcionario){
            res.status(500).json("Este Funcionario já existe na base de dados")
        }else{
            Funcionario.create(form)
            .then(data => {
                res.status(201).json({message:"Funcionario inscrito com sucesso", data:data});
            })
            .catch(err => {
                res.status(500).json(err);
            });
        }
    })
};

const read = (req, res) => {
    const { id } = req.params;

    Funcionario.findOne({ where: { id } })
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

    Funcionario.update(form, { where: { id } })
        .then(() => {
            res.status(201).json({message:"Funcionario atualizado com sucesso"});
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const remove = (req, res) => {
    const { id } = req.params;

    Funcionario.destroy({ where: { id } })
        .then(() => {
            res.status(201).json({message:"Funcionario excluído com sucesso"});
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const listAll = (req, res) => {
    Funcionario.findAll()
        .then(data => {
            res.status(200).json(data);
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const listByStatus = (req, res) => {
    const { status } = req.params;

    Funcionario.findAll({ where: { status } })
        .then(data => {
            res.status(200).json(data);
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const filterData = (req, res) => {
    const { grupo } = req.params;

    Funcionario.findAll({ where: { grupo } })
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
    filterData
};
