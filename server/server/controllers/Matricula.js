const { Matricula,AnoLectivo,Estudante,Curso,Periodo,Classe, Sala, User } = require("../models/Model");

const create = (req, res) => {
    
    const form = req.body;
    const {ano_id, estudante_id} = req.body;
    Matricula
    .findOne({where:{ano_id,estudante_id}})
    .then(dataEstudante => {
        if(dataEstudante){
            res.status(500).json({message:"Este estudante já está Matriculado"})
        }else{
            Matricula
            .create(form)
                .then(data => {
                    res.status(201).json({message:"Estudante Matriculado com sucesso", data:data});
                })
                .catch(err => {
                    res.status(500).json(err);
                });
        }
    })
    .catch(err => {
        console.log(err)
    })
};

const read = (req, res) => {
    const { id } = req.params;

    Matricula.findOne({ 
        where: { id } ,
        include:[AnoLectivo,Curso,Classe,Periodo,Sala,User,Estudante]
    })
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

    Matricula.update(form, { where: { id } })
        .then(() => {
            res.status(201).json({message:"Matricula atualizada com sucesso"});
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

const remove = (req, res) => {
    const { id } = req.params;

    Matricula.destroy({ where: { id } })
        .then(() => {
            res.status(201).json({message:"Matricula excluida com sucesso"});
        })
        .catch(err => {
            res.status(500).json(err);
        });
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
    const {estudante_id,estado} = req.params;
    Matricula.findOne({where:{estudante_id},include:[Curso,Classe,Estudante,Sala]})
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
    read,
    update,
    remove,
    listAll,
    filterData,
    listByStatus,
    listByEstudante,
    listAllByEstudante
};
