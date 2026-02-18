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
    user_id:{
        type:DataTypes.INTEGER,
        allowNull:true,
        defaultValue:1
    },
},{
    tableName:"estudantes",
    timestamps:true
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

Estudante.belongsTo(Curso,{foreignKey:"curso_id"});
Estudante.hasMany(Matricula,{foreignKey:"estudante_id"});
Estudante.belongsTo(User,{foreignKey:"user_id"});
Estudante.hasMany(Pagamento, {foreignKey:"estudante_id"});
Emolumento.belongsTo(EmolumentoNatureza, {foreignKey:"natureza_id"});
Emolumento.hasMany(ItensPagamento, {foreignKey:"emolumento_id"});
EmolumentoPreco.belongsTo(AnoLectivo, {foreignKey:"ano_id"});
EmolumentoPreco.belongsTo(Curso, {foreignKey:"curso_id"});
EmolumentoPreco.belongsTo(Classe, {foreignKey:"classe_id"});
EmolumentoPreco.belongsTo(EmolumentoNatureza, {foreignKey:"emolumento_natureza_id"});
EmolumentoPreco.belongsTo(Emolumento, {foreignKey:"emolumento_id"});
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
    User,
    Curso,
    Sala,
    Classe,
    Periodo,
    AnoLectivo,
    EmolumentoNatureza,
    Emolumento,
    EmolumentoPreco,
    Estudante,
    Pagamento,
    ItensPagamento,
    Despesa,
    Matricula,
    License,
    Notification
}