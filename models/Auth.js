const { DataTypes } = require("sequelize");
const conn = require("../config/db");

const User = conn.define("User", {
    id:{
        type:DataTypes.INTEGER,
        allowNull:false,
        primaryKey:true,
        autoIncrement:true,
        unique:true
    },
    foto:{
        type:DataTypes.STRING,
        allowNull:false,
        defaultValue:"avatar.svg"
    },
    nome:{
        type:DataTypes.STRING,
        allowNull:false
    },
    telefone:{
        type:DataTypes.INTEGER,
        allowNull:false
    },
    email:{
        type:DataTypes.STRING,
        allowNull:false,
        validate:{
            isEmail:true
        }
    },
    nivel:{
        type:DataTypes.ENUM("IT","Administrador","Secretaria","Tesouraria","Professor","D.Pedagógico","D.Geral","PCA"),
        allowNull:false
    },
    senha:{
        type:DataTypes.STRING,
        allowNull:false
    },
    status:{
        type:DataTypes.BOOLEAN,
        allowNull:false
    }
},{
    tableName:"users",
    timestamps: true, 
    createdAt: false, 
    updatedAt: 'updatedAt'
})

const License = conn.define('License', {
    id: {
        type: DataTypes.INTEGER,
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        unique: true
    },
    licenseKey: {
        type: DataTypes.STRING,
        allowNull: false,
        unique: true
    },
    expirationDate: {
        type: DataTypes.DATE,
        allowNull: false
    },
    code: {
        type: DataTypes.STRING,
        allowNull: false
    }
}, {
    tableName: 'licenses',
    timestamps: false
});

const Notification = conn.define("Notification", {
    id:{
        type:DataTypes.INTEGER,
        allowNull:false,
        primaryKey:true,
        autoIncrement:true,
        unique:true
    },
    title:{
        type:DataTypes.STRING,
        allowNull:false
    },
    text:{
        type:DataTypes.TEXT,
        allowNull:false
    }
},{
    tableName:"notificacoes",
    timestamps:true
})

module.exports = {
    User,
    License,
    Notification
}