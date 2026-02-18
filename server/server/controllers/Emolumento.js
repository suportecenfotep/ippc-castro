const { Emolumento } = require("../models/Model");

const create = (req, res) => {
    
    const form = req.body;

    Emolumento.create(form)
        .then(data => {
            res.status(201).json({message:"Emolumento criado com sucesso", data:data});
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const read = (req, res) => {
    const { id } = req.params;

    Emolumento.findOne({ where: { id } })
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

    Emolumento.update(form, { where: { id } })
        .then(() => {
            res.status(201).json({message:"Emolumento atualizado com sucesso"});
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const remove = (req, res) => {
    const { id } = req.params;

    Emolumento.destroy({ where: { id } })
        .then(() => {
            res.status(201).json({message:"Emolumento excluído com sucesso"});
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const listAll = (req, res) => {
    Emolumento.findAll()
        .then(data => {
            res.status(200).json(data);
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const listByNature = (req, res) => {
    const { natureza_id } = req.params;

    Emolumento.findAll({ where: { natureza_id } })
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
    listByNature,
};
