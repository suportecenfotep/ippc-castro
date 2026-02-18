const { Io } = require("../config/server");
const { Matricula, AnoLectivo, Estudante, Curso, Periodo, Classe, Sala, User, Notification } = require("../models/Model");
const Sequelize = require('sequelize'); // Importar para usar funções do Sequelize, se necessário.

// --- Método para Matricular um único Estudante ---
const create = async (req, res) => {
    const form = req.body;
    const { ano_id, estudante_id, user_id, nome } = req.body; // user_id e nome são necessários para a notificação

    try {
        const dataEstudante = await Matricula.findOne({ where: { ano_id, estudante_id } });
        
        if (dataEstudante) {
            return res.status(500).json({ message: "Este estudante já está matriculado neste ano letivo." });
        }

        const data = await Matricula.create(form);
        
        // 🔔 Notificação
        const push = {
            title: "Nova Matrícula",
            text: `O utilizador ${nome || 'desconhecido'} matriculou um estudante (ID: ${estudante_id}).`,
            user_id: user_id // Opcional: para notificar um usuário específico
        };
        Notification.create(push);
        Io.emit("notificationChange", push);
        
        res.status(201).json({ message: "Estudante matriculado com sucesso", data });
        
    } catch (err) {
        console.error(err);
        res.status(500).json(err);
    }
};

// --- Novo Método para Matrícula Múltipla ---
const createMultiple = async (req, res) => {
    // Espera-se que o corpo da requisição seja um array de objetos de matrícula
    const matriculas = req.body.matriculas; 
    const { user_id, nome } = req.body; // user_id e nome (do usuário que está matriculando) devem vir no body

    if (!Array.isArray(matriculas) || matriculas.length === 0) {
        return res.status(400).json({ message: "Dados inválidos. Esperava-se um array de matrículas." });
    }

    try {
        // 1. Verificar Duplicatas
        const estudanteIds = matriculas.map(m => m.estudante_id);
        const anoId = matriculas[0].ano_id; // Assume que todas as matrículas são para o mesmo ano

        const existingRegistrations = await Matricula.findAll({
            where: {
                ano_id: anoId,
                estudante_id: estudanteIds
            },
            attributes: ['estudante_id']
        });

        if (existingRegistrations.length > 0) {
            const alreadyMatriculatedIds = existingRegistrations.map(r => r.estudante_id);
            return res.status(400).json({ 
                message: "Alguns estudantes já estão matriculados neste ano letivo.",
                alreadyMatriculatedIds 
            });
        }
        
        // 2. Criação Múltipla em Massa
        const data = await Matricula.bulkCreate(matriculas);

        // 🔔 Notificação
        const push = {
            title: "Matrículas em Lote",
            text: `O utilizador ${nome || 'desconhecido'} matriculou ${data.length} estudantes.`,
            user_id: user_id
        };
        Notification.create(push);
        Io.emit("notificationChange", push);

        res.status(201).json({ 
            message: `${data.length} estudantes matriculados com sucesso.`, 
            data 
        });

    } catch (err) {
        console.error(err);
        res.status(500).json(err);
    }
};

// --- Método para Ler uma Matrícula (Sem Alteração) ---
const read = (req, res) => {
    const { id } = req.params;

    Matricula.findOne({ 
        where: { id } ,
        include:[AnoLectivo,Curso,Classe,Periodo,Sala,User,Estudante]
    })
        .then(data => {
            if (!data) {
                return res.status(404).json({ message: "Matrícula não encontrada" });
            }
            res.status(200).json(data);
        })
        .catch(err => {
            console.error(err);
            res.status(500).json(err);
        });
};

// --- Método para Atualizar o Estado da Matrícula (com Notificação) ---
const update = async (req, res) => {
    const { id } = req.params;
    const form = req.body;

    try {
        // 1. Buscar a matrícula antes da atualização
        const oldMatricula = await Matricula.findOne({ 
            where: { id },
            attributes: ['estado'] // Apenas precisamos do estado antigo
        });

        const [rowsUpdated] = await Matricula.update(form, { where: { id } });

        if (rowsUpdated === 0) {
            return res.status(404).json({ message: "Matrícula não encontrada ou nenhum dado para atualizar" });
        }

        // 2. Verificar se o estado foi alterado
        if (form.estado && oldMatricula && oldMatricula.estado !== form.estado) {
            const push = {
                title: "Estado da Matrícula Atualizado",
                text: `O estado da Matrícula ${id} foi alterado de "${oldMatricula.estado}" para "${form.estado}".`,
                user_id: form.user_id || null // Quem fez a alteração
            };
            Notification.create(push);
            Io.emit("notificationChange", push);
        }

        res.status(200).json({message:"Matricula atualizada com sucesso"});
    } catch (err) {
        console.error(err);
        res.status(500).json(err);
    }
};

// --- Método para Remover uma Matrícula (com Notificação) ---
const remove = async (req, res) => {
    const { id } = req.params;
    const { user_id, nome } = req.body; // Adicione user_id e nome no corpo da requisição para notificação

    try {
        const matriculaParaRemover = await Matricula.findOne({ where: { id } });

        if (!matriculaParaRemover) {
            return res.status(404).json({ message: "Matrícula não encontrada" });
        }

        await Matricula.destroy({ where: { id } });

        // 🔔 Notificação
        const push = {
            title: "Matrícula Removida",
            text: `O utilizador ${nome || 'desconhecido'} removeu a Matrícula ID: ${id}.`,
            user_id: user_id
        };
        Notification.create(push);
        Io.emit("notificationChange", push);

        res.status(200).json({message:"Matricula excluida com sucesso"});
    } catch (err) {
        console.error(err);
        res.status(500).json(err);
    }
};

const listAll = (req, res) => {
    Matricula.findAll()
        .then(data => {
            res.status(200).json(data);
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const filterData = (req, res) => {
    const {ano_id, sala_id} = req.params;
    Matricula.findAll({
        where:{ano_id, sala_id},
        include:[AnoLectivo,Curso,Classe,Periodo,Sala,User,Estudante],
        order:[[Estudante, 'nome', 'ASC']]
    })
        .then(data => {
            res.status(200).json(data);
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const listByStatus = (req, res) => {
    const {estado} = req.params;
    Matricula.findAll({where:{estado}})
        .then(data => {
            res.status(200).json(data);
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const listByEstudante = (req, res) => {
    const {estudante_id} = req.params; // Removi o 'estado' pois o findOne buscará a mais recente, se for o caso
    Matricula.findOne({
        where:{estudante_id},
        include:[Curso,Classe,Estudante,Sala],
        order:[['createdAt', 'DESC']] // Buscar a mais recente, se houver muitas
    })
        .then(data => {
            res.status(200).json(data);
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const listAllByEstudante = (req, res) => {
    const {estudante_id} = req.params;
    Matricula.findAll({
        where:{estudante_id},
        include:[Curso,Classe,Estudante,Sala],
        order:[[Classe, 'nome', 'ASC']]
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
    createMultiple, 
    read,
    update,
    remove,
    listAll,
    filterData,
    listByStatus,
    listByEstudante,
    listAllByEstudante
};