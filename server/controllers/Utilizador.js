const { User, Notification } = require("../models/Model")
const { Io } = require("../config/server")
const jwt = require('jsonwebtoken');
const secretKey = "angola";

const create = (req, res) => {

    const usuarioData = req.body;

    User
    .create(usuarioData)
    .then(data => res.status(201).json({message:"User cadastrado com sucesso", data:data}))
    .catch(error => res.status(400).json({ error: error.message }));

}

const read = (req, res) => {

    const { id } = req.params;

    User
    .findOne({where:{id}})
    .then(data => {
        res.status(201).json(data)
    })
    .catch(err => {
        res.status(500).json(err)
    })

}

const update = (req, res) => {

    const { id } = req.params;

    const usuarioData = req.body;

    User
    .update(usuarioData,{where:{id}})
    .then(novoUsuario => res.status(201).json({message:"User atualizado com sucesso"}))
    .catch(error => res.status(400).json({ error: error.message }));

}

const updateStatus = (req, res) => {

    const { id } = req.params;

    const usuarioData = req.body;

    User
    .update(usuarioData,{where:{id}})
    .then(novoUsuario => {
        Io.emit("userChange", novoUsuario)
        res.status(201).json({message:"Success"})
    })
    .catch(error => res.status(400).json({ error: error.message }));

}

const remove = (req, res) => {
    
    const { id } = req.params;

    User
    .destroy({where:{id}})
    .then(data => {
        res.status(201).json({message:"User excluído!"})
    })
    .catch(err => {
        res.status(500).json(err)
    })
    
}

 const login = (req, res) => {

    const { email, senha } = req.body;

    User
    .findOne({ where: { email,senha } })
        .then(usuario => {
                
                const form = {
                    status:1
                }
                User.update(form,{where:{id:usuario.id}})
                
                Io.emit("userChange", usuario)

                const push = {
                    title:"Novo início de sessão",
                    text:`O utilizador ${usuario.nome}, iniciou sessão no SGI`
                }
            
                Notification.create(push)

                Io.emit("notificationChange", push)
                
                jwt.sign({id:usuario.id,nome:usuario.nome}, secretKey, { expiresIn: '365d' }, (err, token) => {
                    if (err) {
                      res.sendStatus(500); 
                    }
                    res.json({ token:token, data:usuario });
                });

                
        })
        .catch(error => res.status({ error: error }));
}


const listAll = (req, res) => {
    User
    .findAll()
    .then(data => {
        res.status(201).json(data)
    })
    .catch(err => {
        res.status(500).json(err)
    })
}

const listByLevel = (req, res) => {
    const {nivel} = req.params;
    User
    .findAll({where:{nivel}})
    .then(data => {
        res.status(201).json(data)
    })
    .catch(err => {
        res.status(500).json(err)
    })
}

const listByStatus = (req, res) => {
    const {status} = req.params;
    User
    .findAll({where:{status}})
    .then(data => {
        res.status(201).json(data)
    })
    .catch(err => {
        res.status(500).json(err)
    })
}

module.exports = {
    create,
    read,
    update,
    updateStatus,
    remove,
    login,
    listAll,
    listByLevel,
    listByStatus,
}