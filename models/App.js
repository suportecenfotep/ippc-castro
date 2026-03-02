const { DataTypes } = require("sequelize");
const conn = require("../config/db");
const { Curso, Emolumento, AnoLectivo, EmolumentoPreco, Sala, Classe, Periodo } = require("./Config");
const { User } = require("./Auth");

const Estudante = conn.define("Estudante", {
    id:{
        type:DataTypes.INTEGER,
        allowNull:false,
        primaryKey:true,
        autoIncrement:true,
        unique:true
    },
    numero_processual:{
        type:DataTypes.STRING,
        allowNull:false,
        validate:{
            notEmpty:true
        },
        defaultValue:0
    },
    numero:{
        type:DataTypes.INTEGER,
        allowNull:false
    },
    identificacao:{
        type:DataTypes.STRING,
        allowNull:true
    },
    local_emissao_identificacao:{
        type:DataTypes.STRING,
        allowNull:true
    },
    data_emissao_bi:{
        type:DataTypes.STRING,
        allowNull:true
    },
    nome:{
        type:DataTypes.STRING,
        allowNull:false,
        validate:{
            notEmpty:true
        }
    },
    telefone:{
        type:DataTypes.INTEGER,
        allowNull:true
    },
    data_de_nascimento:{
        type:DataTypes.DATE,
        allowNull:false,
        validate:{
            notEmpty:true
        }
    },
    nacionalidade:{
        type:DataTypes.STRING,
        allowNull:true
    },
    naturalidade:{
        type:DataTypes.STRING,
        allowNull:true
    },
    municipio:{
        type:DataTypes.STRING,
        allowNull:true
    },
    provincia:{
        type:DataTypes.STRING,
        allowNull:false
    },
    genero:{
        type:DataTypes.STRING,
        allowNull:true,
    },
    estado_civil:{
        type:DataTypes.STRING,
        allowNull:true
    },
    nome_pai:{
        type:DataTypes.STRING,
        allowNull:true
    },
    nome_mae:{
        type:DataTypes.STRING,
        allowNull:true
    },
    escola_anterior:{
        type:DataTypes.STRING,
        allowNull:false,
        defaultValue:"ND"
    },
    residencia:{
        type:DataTypes.STRING,
        allowNull:false,
        defaultValue:"Huambo"
    },
    necessidade_especial:{
        type:DataTypes.STRING,
        allowNull:false,
        defaultValue:"Nenhuma"
    },
    curso_id:{
        type:DataTypes.INTEGER,
        allowNull:false
    },
    lingua_opcao:{
        type:DataTypes.STRING,
        allowNull:true
    },
    encarregado:{
        type:DataTypes.STRING,
        allowNull:true
    },
    grau_parentesco:{
        type:DataTypes.STRING,
        allowNull:true
    },
    contacto_encarregado:{
        type:DataTypes.INTEGER,
        allowNull:true
    },
    senha:{
        type:DataTypes.STRING,
        allowNull:true
    },
    user_id:{
        type:DataTypes.INTEGER,
        allowNull:true,
        defaultValue:1
    },
},{
    tableName:"estudantes",
    timestamps:true
})

const Pagamento = conn.define("Pagamento", {
    id:{
        type:DataTypes.INTEGER,
        allowNull:false,
        primaryKey:true,
        autoIncrement:true,
        unique:true
    },
    doc_type:{
        type:DataTypes.STRING,
        allowNull:false,
        defaultValue:"FR"
    },
    numero:{
        type:DataTypes.STRING,
        allowNull:false
    },
    ano_id:{
        type:DataTypes.INTEGER,
        allowNull:false
    },
    estudante_id:{
        type:DataTypes.INTEGER,
        allowNull:false
    },
    user_id:{
        type:DataTypes.INTEGER,
        allowNull:false
    },
    hash:{
        type:DataTypes.TEXT,
        allowNull:false
    },
    estado:{
        type:DataTypes.ENUM("Pago","Anulado"),
        allowNull:false,
        defaultValue:"Pago"
    }
},{
    tableName:"pagamentos",
    timestamps:true
})

const ItensPagamento = conn.define("ItensPagamento", {
    id:{
        type:DataTypes.INTEGER,
        allowNull:false,
        primaryKey:true,
        autoIncrement:true,
        unique:true
    },
    metodo_pagamento:{
        type:DataTypes.ENUM("Depósito","TPA","Transferência Bancária", "Internet Banking"),
        allowNull:false
    },
    pagamento_id:{
        type:DataTypes.INTEGER,
        allowNull:false
    },
    emolumento_id:{
        type:DataTypes.INTEGER,
        allowNull:false
    },
    preco_id:{
        type:DataTypes.INTEGER,
        allowNull:false
    },
    desconto:{
        type:DataTypes.DOUBLE,
        allowNull:false
    },
    multa:{
        type:DataTypes.DOUBLE,
        allowNull:false
    }
},{
    tableName:"pagamentos_itens",
    timestamps:false
})

const Despesa = conn.define("Despesa", {
    id:{
        type:DataTypes.INTEGER,
        allowNull:false,
        primaryKey:true,
        autoIncrement:true,
        unique:true
    },
    descricao:{
        type:DataTypes.STRING,
        allowNull:false
    },
    valor:{
        type:DataTypes.DOUBLE,
        allowNull:false
    },
    referencia:{
        type:DataTypes.STRING,
        allowNull:false
    },
    user_id:{
        type:DataTypes.INTEGER,
        allowNull:false
    },
    status:{
        type:DataTypes.BOOLEAN,
        allowNull:false
    }
},{
    tableName:"despesas",
    timestamps:true
})

const Matricula = conn.define("Matricula", {
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
    sala_id:{
        type:DataTypes.INTEGER,
        allowNull:false
    },
    estudante_id:{
        type:DataTypes.INTEGER,
        allowNull:false
    },
    periodo_id:{
        type:DataTypes.INTEGER,
        allowNull:false
    },
    classe_id:{
        type:DataTypes.INTEGER,
        allowNull:false
    },
    user_id:{
        type:DataTypes.INTEGER,
        allowNull:false
    },
    estado:{
        type:DataTypes.ENUM("Estudando","Cancelada","Transita","Não Transita","Recurso"),
        allowNull:false
    }
},{ 
    tableName:"matriculas",
    timestamps:true
})

Estudante.belongsTo(Curso,{foreignKey:"curso_id"});
Estudante.hasMany(Matricula,{foreignKey:"estudante_id"});
Estudante.belongsTo(User,{foreignKey:"user_id"});
Estudante.hasMany(Pagamento, {foreignKey:"estudante_id"});
Emolumento.hasMany(ItensPagamento, {foreignKey:"emolumento_id"});
Pagamento.hasMany(ItensPagamento, {foreignKey:"pagamento_id"});
Pagamento.belongsTo(User, {foreignKey:"user_id"});
Pagamento.belongsTo(AnoLectivo, {foreignKey:"ano_id"});
Pagamento.belongsTo(Estudante, {foreignKey:"estudante_id"});
ItensPagamento.belongsTo(AnoLectivo, {foreignKey:"ano_id"});
ItensPagamento.belongsTo(Pagamento, {foreignKey:"pagamento_id", onDelete:"cascade"});
ItensPagamento.belongsTo(Emolumento, {foreignKey:"emolumento_id"});
ItensPagamento.belongsTo(EmolumentoPreco, {foreignKey:"preco_id"});
Despesa.belongsTo(User, {foreignKey:"user_id"});
Matricula.belongsTo(AnoLectivo, {foreignKey:"ano_id"});
Matricula.belongsTo(Sala, {foreignKey:"sala_id"});
Matricula.belongsTo(Estudante, {foreignKey:"estudante_id"});
Matricula.belongsTo(Classe, {foreignKey:"classe_id"});
Matricula.belongsTo(Periodo, {foreignKey:"periodo_id"});
Matricula.belongsTo(Estudante, {foreignKey:"estudante_id"});
Matricula.belongsTo(Curso, {foreignKey:"curso_id"});
Matricula.belongsTo(Periodo, {foreignKey:"periodo_id"});
Matricula.belongsTo(User, {foreignKey:"user_id"});
Sala.hasMany(Matricula,{foreignKey:"sala_id"});
Sala.belongsTo(Curso,{foreignKey:"curso_id"});
Sala.belongsTo(Classe,{foreignKey:"classe_id"});
Sala.belongsTo(Periodo,{foreignKey:"periodo_id"});

module.exports = {
    Estudante,
    Pagamento,
    ItensPagamento,
    Despesa,
    Matricula,
}