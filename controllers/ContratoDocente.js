const { ContratoDocente, Funcionario, AnoLectivo } = require("../models/Model"); // Ajuste o caminho conforme necessário
const { gerarNumero } = require("../config/utils"); // Supondo que você tenha uma função para gerar números

// Método para criar um novo contrato docente
async function create(req, res) {
    try {
        const form = {
            numero: gerarNumero(), // Supondo que você queira gerar um número para o contrato
            ...req.body
        };

        const data = await ContratoDocente.create(form);
        res.status(201).json({ message: "Contrato docente criado com sucesso", data: data });
    } catch (err) {
        console.log(err);
        res.status(500).json(err);
    }
}

// Método para ler um contrato docente pelo ID
const read = (req, res) => {
    const { id } = req.params;

    ContratoDocente.findOne({ where: { id } })
        .then(data => {
            if (data) {
                res.status(200).json(data);
            } else {
                res.status(404).json({ message: "Contrato docente não encontrado" });
            }
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

// Método para atualizar um contrato docente
const update = (req, res) => {
    const { id } = req.params;
    const form = req.body;

    ContratoDocente.update(form, { where: { id } })
        .then(([updated]) => {
            if (updated) {
                res.status(200).json({ message: "Contrato docente atualizado com sucesso" });
            } else {
                res.status(404).json({ message: "Contrato docente não encontrado" });
            }
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

// Método para remover um contrato docente
const remove = (req, res) => {
    const { id } = req.params;

    ContratoDocente.destroy({ where: { id } })
        .then(deleted => {
            if (deleted) {
                res.status(200).json({ message: "Contrato docente excluído com sucesso" });
            } else {
                res.status(404).json({ message: "Contrato docente não encontrado" });
            }
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

// Método para listar todos os contratos docentes
const listAll = (req, res) => {
    ContratoDocente.findAll({include:[Funcionario,AnoLectivo]})
        .then(data => {
            res.status(200).json(data);
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

// Método para listar contratos docentes por ano letivo
const listByAno = (req, res) => {
    const { ano_lectivo_id } = req.params;

    ContratoDocente.findAll({ where: { ano_lectivo_id }, include:[Funcionario,AnoLectivo] })
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