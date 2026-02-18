const { Funcionario } = require("../models/Model"); // Ajuste o caminho conforme necessário
const { gerarNumero } = require("../config/utils"); // Supondo que você tenha uma função para gerar números

// Método para criar um novo funcionário
async function create(req, res) {
    try {
        const form = req.body;
        
        const existingFuncionario = await Funcionario.findOne({
            where: {
                identificacao: form.identificacao
            }
        });

        if (existingFuncionario) {
            return res.status(500).json("Este funcionário já existe na base de dados");
        }

        const data = await Funcionario.create(form);
        res.status(201).json({ message: "Funcionário inscrito com sucesso", data: data });
    } catch (err) {
        console.log(err);
        res.status(500).json(err);
    }
}

// Método para ler um funcionário pelo ID
const read = (req, res) => {
    const { id } = req.params;

    Funcionario.findOne({ where: { id } })
        .then(data => {
            res.status(200).json(data);
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

// Método para atualizar um funcionário
const update = (req, res) => {
    const { id } = req.params;
    const form = req.body;

    Funcionario.update(form, { where: { id } })
        .then(() => {
            res.status(201).json({ message: "Funcionário atualizado com sucesso" });
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

// Método para remover um funcionário
const remove = (req, res) => {
    const { id } = req.params;

    Funcionario.destroy({ where: { id } })
        .then(() => {
            res.status(201).json({ message: "Funcionário excluído com sucesso" });
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

// Método para listar todos os funcionários
const listAll = (req, res) => {
    Funcionario.findAll()
        .then(data => {
            res.status(200).json(data);
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

// Método para listar funcionários por grupo
const listByGrupo = (req, res) => {
    const { grupo } = req.params;

    Funcionario.findAll({ where: { grupo } })
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
    listByGrupo
};