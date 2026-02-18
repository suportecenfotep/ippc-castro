const { Trimestre, AvaliacaoTipo } = require("../models/Model");

const create = (req, res) => {
    
    const form = req.body;

    Trimestre.create(form)
        .then(data => {
            res.status(201).json({message:"Trimestre criado com sucesso", data:data});
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const read = (req, res) => {
    const { id } = req.params;

    Trimestre.findOne({ where: { id } })
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

    Trimestre.update(form, { where: { id } })
        .then(() => {
            res.status(201).json({message:"Trimestre atualizado com sucesso"});
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const remove = (req, res) => {
    const { id } = req.params;

    Trimestre.destroy({ where: { id } })
        .then(() => {
            res.status(201).json({message:"Trimestre excluído com sucesso"});
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const listAll = (req, res) => {
    Trimestre.findAll({include:[AvaliacaoTipo]})
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
    listAll
};
