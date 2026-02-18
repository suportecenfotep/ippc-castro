const { Periodo } = require("../models/Model");

const create = (req, res) => {
    
    const form = req.body;

    Periodo.create(form)
        .then(data => {
            res.status(201).json({message:"Periodo criado com sucesso", data:data});
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const read = (req, res) => {
    const { id } = req.params;

    Periodo.findOne({ where: { id } })
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

    Periodo.update(form, { where: { id } })
        .then(() => {
            res.status(201).json({message:"Periodo atualizado com sucesso"});
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const remove = (req, res) => {
    const { id } = req.params;

    Periodo.destroy({ where: { id } })
        .then(() => {
            res.status(201).json({message:"Periodo excluído com sucesso"});
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const listAll = (req, res) => {
    Periodo.findAll()
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
