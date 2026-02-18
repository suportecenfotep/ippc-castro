const { ContratoAdministrativo, Funcionario, AnoLectivo } = require("../models/Model"); // Ajuste o caminho conforme necessário
const { gerarNumero } = require("../config/utils"); // Supondo que você tenha uma função para gerar números

// Método para criar um novo contrato administrativo
async function create(req, res) {
    try {
        const form = {
            numero: gerarNumero(), // Supondo que você queira gerar um número para o contrato
            ...req.body
        };

        const data = await ContratoAdministrativo.create(form);
        res.status(201).json({ message: "Contrato administrativo criado com sucesso", data: data });
    } catch (err) {
        console.log(err);
        res.status(500).json(err);
    }
}

// Método para ler um contrato administrativo pelo ID
const read = (req, res) => {
    const { id } = req.params;

    ContratoAdministrativo.findOne({ where: { id }, include: [Funcionario, AnoLectivo] })
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

    ContratoAdministrativo.update(form, { where: { id } })
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

    ContratoAdministrativo.destroy({ where: { id } })
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
    ContratoAdministrativo.findAll({ include: [Funcionario, AnoLectivo] })
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

    ContratoAdministrativo.findAll({ where: { ano_lectivo_id }, include: [Funcionario, AnoLectivo] })
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