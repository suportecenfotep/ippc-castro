const { ContratoAuxiliar, Funcionario, AnoLectivo } = require("../models/Model");

// Método para criar um novo contrato administrativo
async function create(req, res) {
    try {
        const form = req.body;

        const data = await ContratoAuxiliar.create(form);
        res.status(201).json({ message: "Contrato administrativo criado com sucesso", data: data });
    } catch (err) {
        console.log(err);
        res.status(500).json(err);
    }
}

// Método para ler um contrato administrativo pelo ID
const read = (req, res) => {
    const { id } = req.params;

    ContratoAuxiliar.findOne({ where: { id }, include: [Funcionario, AnoLectivo] })
        .then(data => {
            if (data) {
                res.status(200).json(data);
            } else {
                res.status(404).json({ message: "Contrato administrativo não encontrado" });
            }
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

// Método para atualizar um contrato administrativo
const update = (req, res) => {
    const { id } = req.params;
    const form = req.body;

    ContratoAuxiliar.update(form, { where: { id } })
        .then(([updated]) => {
            if (updated) {
                res.status(200).json({ message: "Contrato administrativo atualizado com sucesso" });
            } else {
                res.status(404).json({ message: "Contrato administrativo não encontrado" });
            }
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

// Método para remover um contrato administrativo
const remove = (req, res) => {
    const { id } = req.params;

    ContratoAuxiliar.destroy({ where: { id } })
        .then(deleted => {
            if (deleted) {
                res.status(200).json({ message: "Contrato administrativo excluído com sucesso" });
            } else {
                res.status(404).json({ message: "Contrato administrativo não encontrado" });
            }
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

// Método para listar todos os contratos administrativos
const listAll = (req, res) => {
    ContratoAuxiliar.findAll({ include: [Funcionario, AnoLectivo] })
        .then(data => {
            res.status(200).json(data);
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

// Método para listar contratos administrativos por ano letivo
const listByAno = (req, res) => {
    const { ano_lectivo_id } = req.params;

    ContratoAuxiliar.findAll({ where: { ano_lectivo_id }, include: [Funcionario, AnoLectivo] })
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
    listByAno
};