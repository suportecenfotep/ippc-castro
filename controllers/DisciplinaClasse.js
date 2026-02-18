const { DisciplinaClasse, Disciplina } = require("../models/Model");

const create = (req, res) => {
    const form = req.body;

    DisciplinaClasse.create(form)
        .then(data => {
            res.status(201).json({ message: "Atribuição criada com sucesso", data });
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const read = (req, res) => {
    const { id } = req.params;

    DisciplinaClasse.findOne({ where: { id } })
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

    DisciplinaClasse.update(form, { where: { id } })
        .then(() => {
            res.status(200).json({ message: "Atribuição atualizada com sucesso" });
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const remove = (req, res) => {
    const { id } = req.params;

    DisciplinaClasse.destroy({ where: { id } })
        .then(() => {
            res.status(200).json({ message: "Atribuição excluída com sucesso" });
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const listAll = (req, res) => {
    DisciplinaClasse.findAll()
        .then(data => {
            res.status(200).json(data);
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const listByCursoClasse = (req, res) => {
    const { curso_id, classe_id } = req.params;

    DisciplinaClasse.findAll({ 
            where: { curso_id, classe_id },
            include:[Disciplina]
        })
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
    listByCursoClasse
};
