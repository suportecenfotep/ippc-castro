const { AnoLectivo } = require("../models/Model");

const create = (req, res) => {
    
    const form = req.body;

    AnoLectivo.create(form)
        .then(data => {
            res.status(201).json({message:"Ano Lectivo criado com sucesso", data:data});
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const read = (req, res) => {
    const { id } = req.params;

    AnoLectivo.findOne({ where: { id } })
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

    AnoLectivo.update(form, { where: { id } })
        .then(() => {
            res.status(201).json({message:"Ano Lectivo atualizado com sucesso"});
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const remove = (req, res) => {
    const { id } = req.params;

    AnoLectivo.destroy({ where: { id } })
        .then(() => {
            res.status(201).json({message:"Ano Lectivo exluido com sucesso"});
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const listAll = (req, res) => {
        AnoLectivo.findAll()
        .then(data => {
            res.status(200).json(data);
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const listByStatus = (req, res) => {
    const { status } = req.params;

    AnoLectivo.findAll({ where: { status } })
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
    listByStatus
};
