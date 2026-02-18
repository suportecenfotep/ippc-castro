const { gerarNumero } = require("../config/utils");
const { Feria, Funcionario } = require("../models/Model");

const create = (req, res) => {
    
    const form = {
        ...req.body,
        qrcode:gerarNumero(),
        barcode:gerarNumero()
    };

    Feria
    .findOne({
        where:{
            ano_id:form.ano_id,
            funcionario_id:form.funcionario_id,
            mes:form.mes,
        }
    })
    .then(folha_salarial => {
        if(folha_salarial){
            res.status(500).json("Esta previsão de ferias já foi agendada")
        }else{
            Feria.create(form)
            .then(data => {
                res.status(201).json({message:"Previsão de férias agendada com sucesso", data:data});
            })
            .catch(err => {
                res.status(500).json(err);
            });
        }
    })
};

const read = (req, res) => {
    const { id } = req.params;

    Feria.findOne({ where: { id } })
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

    Feria.update(form, { where: { id } })
        .then(() => {
            res.status(201).json({message:"Previsão de férias atualizada com sucesso"});
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const remove = (req, res) => {
    const { id } = req.params;

    Feria.destroy({ where: { id } })
        .then(() => {
            res.status(201).json({message:"Previsão de férias excluída com sucesso"});
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const listAll = (req, res) => {
    Feria.findAll()
        .then(data => {
            res.status(200).json(data);
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const listByStatus = (req, res) => {
    const { status } = req.params;

    Feria.findAll({ where: { status } })
        .then(data => {
            res.status(200).json(data);
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const filterData = (req, res) => {
    const { ano_id } = req.params;

    Feria.findAll(
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
