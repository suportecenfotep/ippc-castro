const { Curso } = require("../models/Model");

const create = (req, res) => {
    
    const form = {
        foto:req.fileName,
        ...req.body
    };

    Curso.create(form)
        .then(data => {
            res.status(201).json({message:"Curso criado com sucesso", data:data});
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const read = (req, res) => {
    const { id } = req.params;

    Curso.findOne({ where: { id } })
        .then(data => {
            res.status(200).json(data);
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const update = (req, res) => {
    const { id } = req.params;
    const form = {
        foto:req.fileName,
        ...req.body
    };

    Curso.update(form, { where: { id } })
        .then(() => {
            res.status(201).json({message:"Curso atualizado com sucesso"});
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const remove = (req, res) => {
    const { id } = req.params;

    Curso.destroy({ where: { id } })
        .then(() => {
            res.status(201).json({message:"Curso excluído com sucesso"});
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const listAll = (req, res) => {
    Curso.findAll()
        .then(data => {
            res.status(200).json(data);
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const listByStatus = (req, res) => {
    const { status } = req.params;

    Curso.findAll({ where: { status } })
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
