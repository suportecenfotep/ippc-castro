const { Salario, User, AnoLectivo, ContratoDocente, ContratoAdministrativo, ContratoAuxiliar, FolhaSalarial, Funcionario } = require("../models/Model");

// Método para criar um novo salário
const create = async (req, res) => {
    try {
        const anoLetivoId = req.body.ano_lectivo_id;

        // Cria a folha salarial e obtém o salário_id
        const createFolhaSalarial = await Salario.create(req.body);
        const salarioId = createFolhaSalarial.id; // Extrai o salario_id

        // Busca contratos ativos para o ano letivo especificado
        const [contratoDocente, contratoAdministrativo, contratoAuxiliar] = await Promise.all([
            ContratoDocente.findAll({
                where: { ano_lectivo_id: anoLetivoId, estado: "Ativo" },
                include: [{ model: Funcionario, attributes: ['nome'] }] // Inclui o modelo Funcionario
            }),
            ContratoAdministrativo.findAll({
                where: { ano_lectivo_id: anoLetivoId, estado: "Ativo" },
                include: [{ model: Funcionario, attributes: ['nome'] }] // Inclui o modelo Funcionario
            }),
            ContratoAuxiliar.findAll({
                where: { ano_lectivo_id: anoLetivoId, estado: "Ativo" },
                include: [{ model: Funcionario, attributes: ['nome'] }] // Inclui o modelo Funcionario
            })
        ]);

        // Organiza os dados em um único array
        const salarios = [];

        // Processar contratos docentes
        contratoDocente.forEach(contrato => {
            const salario = contrato.total_tempos * contrato.preco_tempo; 
            salarios.push({
                funcionario_id: contrato.funcionario_id,
                nome: contrato.Funcionario.nome,
                salario_base: salario,
                salario_id: salarioId, // Adiciona o salario_id aqui
            });
        });

        // Processar contratos administrativos
        contratoAdministrativo.forEach(contrato => {
            salarios.push({
                funcionario_id: contrato.funcionario_id,
                nome: contrato.Funcionario.nome,
                salario_base: contrato.salario_base,
                salario_id: salarioId, 
            });
        });

        // Processar contratos auxiliares
        contratoAuxiliar.forEach(contrato => {
            salarios.push({
                funcionario_id: contrato.funcionario_id,
                nome: contrato.Funcionario.nome,
                salario_base: contrato.salario_base,
                salario_id: salarioId,
            });
        });

        // Cria os registros de folha salarial em massa
        const createSalarios = await FolhaSalarial.bulkCreate(salarios);

        if (createSalarios) {
            res.status(200).json({ title: true, message: "Folha Salarial criada com sucesso", data: salarios });
        } else {
            res.status(200).json({ title: "Erro", message: "Não foi possível criar" });
        }
    } catch (err) {
        console.log(err);
        res.status(500).json(err);
    }
}

// Método para ler um salário pelo ID
const read = (req, res) => {
    const { id } = req.params;

    Salario.findOne({ where: { id }, include: [User, AnoLectivo] })
        .then(data => {
            if (data) {
                res.status(200).json(data);
            } else {
                res.status(404).json({ message: "Salários não encontrados" });
            }
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

// Método para atualizar um salário
const update = (req, res) => {
    const { id } = req.params;
    const form = req.body;

    Salario.update(form, { where: { id } })
        .then(([updated]) => {
            if (updated) {
                res.status(200).json({ message: "Salários atualizados com sucesso" });
            } else {
                res.status(404).json({ message: "Salário não encontrado" });
            }
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

// Método para remover um salário
const remove = (req, res) => {
    const { id } = req.params;

    Salario.destroy({ where: { id } })
        .then(deleted => {
            if (deleted) {
                res.status(200).json({ message: "Salário excluído com sucesso" });
            } else {
                res.status(404).json({ message: "Salário não encontrado" });
            }
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

// Método para listar todos os salários
const listAll = (req, res) => {
    Salario.findAll({ include: [User, AnoLectivo] })
        .then(data => {
            res.status(200).json(data);
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

// Método para listar salários por ano letivo
const listByAno = (req, res) => {
    const { ano_lectivo_id } = req.params;

    Salario.findAll({ where: { ano_lectivo_id }, include: [User, AnoLectivo] })
        .then(data => {
            res.status(200).json(data);
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

// Método para listar salários por ano letivo
const getSalarios = (req, res) => {
    const { salario_id } = req.params;

    FolhaSalarial.findAll({ where: { salario_id }, include: [Funcionario] })
        .then(data => {
            res.status(200).json(data);
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const updateSalarios = (req, res) => {
    const {itens} = req.body;

    itens.map (item => {
        FolhaSalarial.update(item, {where:{id:item.id}})
    })

    res.status(200).json({title:true, message:"Folha Salarial Atualizada com Sucesso"})
}

// Método para remover um salário
const removeFolhaSalarial = (req, res) => {
    const { id } = req.params;

    FolhaSalarial.destroy({ where: { id } })
        .then(deleted => {
            if (deleted) {
                res.status(200).json({title:true, message: "Folha de remuneração excluída com sucesso" });
            } else {
                res.status(404).json({ message: "Salário não encontrado" });
            }
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
    listByAno,
    getSalarios,
    removeFolhaSalarial,
    updateSalarios
};