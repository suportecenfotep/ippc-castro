const { DataTypes } = require("sequelize");
const conn = require("../config/db");

const AnoLectivo = conn.define("AnoLectivo", {
    id:{
        type:DataTypes.INTEGER,
        allowNull:false,
        primaryKey:true,
        autoIncrement:true,
        unique:true
    },
    nome:{
        type:DataTypes.STRING,
        allowNull:false
    },
    status:{
        type:DataTypes.BOOLEAN,
        allowNull:false
    }
},{
    tableName:"anos",
    timestamps:false
})

const Curso = conn.define("Curso", {
    id:{
        type:DataTypes.INTEGER,
        allowNull:false,
        primaryKey:true,
        autoIncrement:true,
        unique:true
    },
    nome:{
        type:DataTypes.STRING,
        allowNull:false
    },
    status:{
        type:DataTypes.BOOLEAN,
        allowNull:false
    }
},{
    tableName:"cursos",
    timestamps:false
})

const Classe = conn.define("Classe", {
    id:{
        type:DataTypes.INTEGER,
        allowNull:false,
        primaryKey:true,
        autoIncrement:true,
        unique:true
    },
    nome:{
        type:DataTypes.STRING,
        allowNull:false
    },
    codigo:{
        type:DataTypes.STRING,
        allowNull:false
    },
    status:{
        type:DataTypes.BOOLEAN,
        allowNull:false
    }
},{
    tableName:"classes",
    timestamps:false
})

const Periodo = conn.define("Periodo", {
    id:{
        type:DataTypes.INTEGER,
        allowNull:false,
        primaryKey:true,
        autoIncrement:true,
        unique:true
    },
    nome:{
        type:DataTypes.STRING,
        allowNull:false
    },
    status:{
        type:DataTypes.BOOLEAN,
        allowNull:false
    }
},{
    tableName:"periodos",
    timestamps:false
})

const Sala = conn.define("Sala", {
    id:{
        type:DataTypes.INTEGER,
        allowNull:false,
        primaryKey:true,
        autoIncrement:true,
        unique:true
    },
    curso_id:{
        type:DataTypes.INTEGER,
        allowNull:false
    },
    classe_id:{
        type:DataTypes.INTEGER,
        allowNull:false
    },
    periodo_id:{
        type:DataTypes.INTEGER,
        allowNull:false
    },
    nome:{
        type:DataTypes.STRING,
        allowNull:false
    },
    numero_sala:{
        type:DataTypes.INTEGER,
        allowNull:false,
        defaultValue:0
    },
    status:{
        type:DataTypes.BOOLEAN,
        allowNull:false
    }
},{
    tableName:"salas",
    timestamps:false
})

const EmolumentoNatureza = conn.define("EmolumentoNatureza", {
    id:{
        type:DataTypes.INTEGER,
        allowNull:false,
        primaryKey:true,
        autoIncrement:true,
        unique:true
    },
    nome:{
        type:DataTypes.STRING,
        allowNull:false
    },
    status:{
        type:DataTypes.BOOLEAN,
        allowNull:false
    }
},{
    tableName:"emolumentos_natureza",
    timestamps:false
})

const Emolumento = conn.define("Emolumento", {
    id:{
        type:DataTypes.INTEGER,
        allowNull:false,
        primaryKey:true,
        autoIncrement:true,
        unique:true
    },
    natureza_id:{
        type:DataTypes.INTEGER,
        allowNull:false
    },
    nome:{
        type:DataTypes.STRING,
        allowNull:false
    },
    status:{
        type:DataTypes.BOOLEAN,
        allowNull:false
    }
},{
    tableName:"emolumentos",
    timestamps:false
})

const EmolumentoPreco = conn.define("EmolumentoPreco", {
    id:{
        type:DataTypes.INTEGER,
        allowNull:false,
        primaryKey:true,
        autoIncrement:true,
        unique:true
    },
    ano_id:{
        type:DataTypes.INTEGER,
        allowNull:false
    },
    curso_id:{
        type:DataTypes.INTEGER,
        allowNull:false
    },
    classe_id:{
        type:DataTypes.INTEGER,
        allowNull:false
    },
    emolumento_natureza_id:{
        type:DataTypes.INTEGER,
        allowNull:false
    },
    emolumento_id:{
        type:DataTypes.INTEGER,
        allowNull:false
    },
    preco:{
        type:DataTypes.DOUBLE,
        allowNull:false
    },
    status:{
        type:DataTypes.BOOLEAN,
        allowNull:false
    }
},{
    tableName:"emolumento_precos",
    timestamps:false
})

Emolumento.belongsTo(EmolumentoNatureza, {foreignKey:"natureza_id"});
EmolumentoPreco.belongsTo(AnoLectivo, {foreignKey:"ano_id"});
EmolumentoPreco.belongsTo(Curso, {foreignKey:"curso_id"});
EmolumentoPreco.belongsTo(Classe, {foreignKey:"classe_id"});
EmolumentoPreco.belongsTo(EmolumentoNatureza, {foreignKey:"emolumento_natureza_id"});
EmolumentoPreco.belongsTo(Emolumento, {foreignKey:"emolumento_id"});
Sala.belongsTo(Curso,{foreignKey:"curso_id"});
Sala.belongsTo(Classe,{foreignKey:"classe_id"});
Sala.belongsTo(Periodo,{foreignKey:"periodo_id"});

module.exports = {
    Curso,
    Sala,
    Classe,
    Periodo,
    AnoLectivo,
    EmolumentoNatureza,
    Emolumento,
    EmolumentoPreco,
}