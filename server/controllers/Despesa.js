const { Sequelize } = require("sequelize");
const { Despesa } = require("../models/Model");

const create = (req, res) => {
    
    const form = req.body;

    Despesa.create(form)
        .then(data => {
            res.status(201).json({message:"Despesa criada com sucesso", data:data});
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const read = (req, res) => {
    const { id } = req.params;

    Despesa.findOne({ where: { id } })
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

    Despesa.update(form, { where: { id } })
        .then(() => {
            res.status(201).json({message:"Despesa atualizada com sucesso"});
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const remove = (req, res) => {
    const { id } = req.params;

    Despesa.destroy({ where: { id } })
        .then(() => {
            res.status(201).json({message:"Despesa excluída com sucesso"});
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const filterData = (req, res) => {
    const { start_date, end_date } = req.params;
    Despesa.findAll({
        where:{
            createdAt:{
                [Sequelize.Op.between]:[start_date, end_date]
            }
        },
    })
        .then(data => {
            res.status(200).json(data);
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const listAll = (req, res) => {
    const { start_date, end_date } = req.params;
    Despesa.findAll()
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
    filterData,
    listAll
};