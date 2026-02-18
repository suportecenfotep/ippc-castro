const { gerarNumero } = require("../config/utils");
const { FolhaSalarial, Funcionario } = require("../models/Model");

const create = (req, res) => {
    
    const form = {
        ...req.body,
        qrcode:gerarNumero(),
        barcode:gerarNumero()
    };

    FolhaSalarial
    .findOne({
        where:{
            ano_id:form.ano_id,
            mes:form.mes,
        }
    })
    .then(folha_salarial => {
        if(folha_salarial){
            res.status(500).json("Esta Folha salarial já foi criada")
        }else{
            FolhaSalarial.create(form)
            .then(data => {
                res.status(201).json({message:"Folha salarial criado com sucesso", data:data});
            })
            .catch(err => {
                res.status(500).json(err);
            });
        }
    })
};

const read = (req, res) => {
    const { id } = req.params;

    FolhaSalarial.findOne({ where: { id } })
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

    FolhaSalarial.update(form, { where: { id } })
        .then(() => {
            res.status(201).json({message:"Folha salarial atualizado com sucesso"});
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const remove = (req, res) => {
    const { id } = req.params;

    FolhaSalarial.destroy({ where: { id } })
        .then(() => {
            res.status(201).json({message:"Folha salarial excluído com sucesso"});
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const listAll = (req, res) => {
    FolhaSalarial.findAll()
        .then(data => {
            res.status(200).json(data);
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const listByStatus = (req, res) => {
    const { status } = req.params;

    FolhaSalarial.findAll({ where: { status } })
        .then(data => {
            res.status(200).json(data);
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const filterData = (req, res) => {
    const { ano_id, mes } = req.params;

    FolhaSalarial.findAll(
        { 
            where: { ano_id, mes },
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
