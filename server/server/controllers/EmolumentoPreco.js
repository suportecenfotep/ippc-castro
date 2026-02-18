const { EmolumentoPreco, EmolumentoNatureza, Emolumento } = require("../models/Model");

const create = (req, res) => {
    
    const form = req.body;

    EmolumentoPreco.create(form)
        .then(data => {
            res.status(201).json({message:"Emolumento Preço criado com sucesso", data:data});
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const read = (req, res) => {
    const { id } = req.params;

    EmolumentoPreco.findOne({ where: { id } })
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

    EmolumentoPreco.update(form, { where: { id } })
        .then(() => {
            res.status(201).json({message:"Emolumento Preço atualizado com sucesso"});
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const remove = (req, res) => {
    const { id } = req.params;

    EmolumentoPreco.destroy({ where: { id } })
        .then(() => {
            res.status(201).json({message:"Emolumento Preço excluído com sucesso"});
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const listAll = (req, res) => {
    EmolumentoPreco.findAll()
        .then(data => {
            res.status(200).json(data);
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const filterData = (req, res) => {
    const { ano_id, curso_id, classe_id, emolumento_natureza_id } = req.params;

    EmolumentoPreco.findAll({ where: { ano_id, curso_id, classe_id, emolumento_natureza_id }, include:[Emolumento] })
        .then(data => {
            res.status(200).json(data);
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const filterByEmolument = (req, res) => {
    const { ano_id, curso_id, classe_id, emolumento_natureza_id, emolumento_id } = req.params;

    EmolumentoPreco.findAll({ where: { ano_id, curso_id, classe_id, emolumento_natureza_id, emolumento_id }, include:[Emolumento] })
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
    filterData,
    filterByEmolument
};
