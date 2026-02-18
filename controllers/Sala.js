const { Sequelize } = require("sequelize");
const { Sala, Matricula, Estudante } = require("../models/Model");

const create = (req, res) => {
    
    const form = req.body;

    Sala.create(form)
        .then(data => {
            res.status(201).json({message:"Turma criada com sucesso", data:data});
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const read = (req, res) => {
    const { id } = req.params;

    Sala.findOne({ where: { id } })
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

    Sala.update(form, { where: { id } })
        .then(() => {
            res.status(201).json({message:"Turma atualizada com sucesso"});
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const remove = (req, res) => {
    const { id } = req.params;

    Sala.destroy({ where: { id } })
        .then(() => {
            res.status(201).json({message:"Turma excluída com sucesso"});
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const listAll = (req, res) => {
    Sala.findAll()
        .then(data => {
            res.status(200).json(data);
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const listByStatus = (req, res) => {
    const { status } = req.params;

    Sala.findAll({ where: { status } })
        .then(data => {
            res.status(200).json(data);
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const filterData = (req, res) => {
    const { curso_id, periodo_id, classe_id } = req.params;

    Sala.findAll({ where: { curso_id, periodo_id, classe_id } })
        .then(data => {
            res.status(200).json(data);
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const listByCursoClasse = (req, res) => {
    const { curso_id, classe_id } = req.params;

    Sala.findAll({ where: { curso_id, classe_id } })
        .then(data => {
            res.status(200).json(data);
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const listWithStudentCount = (req, res) => {
    const { ano_id, curso_id, classe_id, periodo_id } = req.params;

    Sala.findAll({
        where: { curso_id, classe_id, periodo_id },
        include: [{
            model: Matricula,
            required: false,
            where: { ano_id },
            include: [{
                model: Estudante,
                attributes: []
            }],
            attributes: []
        }],
        attributes: {
            include: [
                [Sequelize.fn("COUNT", Sequelize.col("Matriculas.id")), "num_estudantes"],
                [Sequelize.fn("SUM", Sequelize.literal(`CASE WHEN \`Matriculas->Estudante\`.\`genero\` = 'Masculino' THEN 1 ELSE 0 END`)), "num_masculino"],
                [Sequelize.fn("SUM", Sequelize.literal(`CASE WHEN \`Matriculas->Estudante\`.\`genero\` = 'Femenino' THEN 1 ELSE 0 END`)), "num_feminino"]
            ]
        },
        group: ['Sala.id']
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
    listByStatus,
    filterData,
    listByCursoClasse,
    listWithStudentCount
};
