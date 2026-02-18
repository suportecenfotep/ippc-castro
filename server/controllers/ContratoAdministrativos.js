const { ContratoAdministrativo, Funcionario } = require("../models/Model");

const create = (req, res) => {
    
    const form = req.body;

    ContratoAdministrativo
    .findOne({
        where:{
            ano_id:form.ano_id,
            funcionario_id:form.funcionario_id,
        }
    })
    .then(contrato => {
        if(contrato){
            res.status(500).json("Já existe um contrato para esse funcionário na base de dados")
        }else{
            ContratoAdministrativo.create(form)
            .then(data => {
                res.status(201).json({message:"Contrato criado com sucesso", data:data});
            })
            .catch(err => {
                res.status(500).json(err);
            });
        }
    })
};

const read = (req, res) => {
    const { id } = req.params;

    ContratoAdministrativo.findOne({ where: { id } })
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

    ContratoAdministrativo.update(form, { where: { id } })
        .then(() => {
            res.status(201).json({message:"Contrato atualizado com sucesso"});
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const remove = (req, res) => {
    const { id } = req.params;

    ContratoAdministrativo.destroy({ where: { id } })
        .then(() => {
            res.status(201).json({message:"Contrato excluído com sucesso"});
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const listAll = (req, res) => {
    ContratoAdministrativo.findAll()
        .then(data => {
            res.status(200).json(data);
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const listByStatus = (req, res) => {
    const { status } = req.params;

    ContratoAdministrativo.findAll({ where: { status } })
        .then(data => {
            res.status(200).json(data);
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const filterData = (req, res) => {
    const { ano_id } = req.params;

    ContratoAdministrativo.findAll(
        { 
            where: { ano_id },
            include:[
                {
                    model:Funcionario,
                    attributes:["id","nome","identificacao"]
                }
            ]
        }
        )
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
    filterData
};
