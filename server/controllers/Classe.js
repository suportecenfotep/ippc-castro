const { Classe } = require("../models/Model");

const create = (req, res) => {
    
    const form = req.body;

    Classe.create(form)
        .then(data => {
            res.status(201).json({message:"Classe criada com sucesso", data:data});
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const read = (req, res) => {
    const { id } = req.params;

    Classe.findOne({ where: { id } })
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

    Classe.update(form, { where: { id } })
        .then(() => {
            res.status(201).json({message:"Classe atualizada com sucesso"});
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const remove = (req, res) => {
    const { id } = req.params;

    Classe.destroy({ where: { id } })
        .then(() => {
            res.status(201).json({message:"Classe excluída com sucesso"});
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const listAll = (req, res) => {
   
    Classe.findAll()
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
