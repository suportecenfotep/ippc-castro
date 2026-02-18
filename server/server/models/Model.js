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
        type:DataTypes.ENUM("IT","Administrador","Secretaria","Tesouraria"),
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
    numero:{
        type:DataTypes.INTEGER,
        allowNull:false
    },
    identificacao:{
        type:DataTypes.STRING,
        allowNull:false
    },
    nome:{
        type:DataTypes.STRING,
        allowNull:false
    },
    telefone:{
        type:DataTypes.INTEGER,
        allowNull:false
    },
    data_de_nascimento:{
        type:DataTypes.DATE,
        allowNull:false
    },
    genero:{
        type:DataTypes.ENUM("Masculino","Femenino"),
        allowNull:false,
    },
    estado_civil:{
        type:DataTypes.ENUM("Solteiro","Solteira","Casado","Casada","Divorciado","Divorciada","Viuvo","Viuva"),
        allowNull:false
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
    encarregado:{
        type:DataTypes.STRING,
        allowNull:false
    },
    contacto_encarregado:{
        type:DataTypes.INTEGER,
        allowNull:false
    },
    status:{
        type:DataTypes.BOOLEAN,
        allowNull:false
    },
    user_id:{
        type:DataTypes.INTEGER,
        allowNull:false
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
    descricao:{
        type:DataTypes.STRING,
        alloNull:false,
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
    tableName:"itens_pagamentos",
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

const Funcionario = conn.define("Funcionario", {
    id:{
        type:DataTypes.INTEGER,
        allowNull:false,
        primaryKey:true,
        autoIncrement:true,
        unique:true
    },
    identificacao:{
        type:DataTypes.STRING,
        allowNull:false,
        unique:true
    },
    nome:{
        type:DataTypes.STRING,
        allowNull:false
    },
    nome_pai:{
        type:DataTypes.STRING,
        allowNull:false
    },
    nome_mae:{
        type:DataTypes.STRING,
        allowNull:false
    },
    data_de_nascimento:{
        type:DataTypes.DATEONLY,
        allowNull:false
    },
    nacionalidade:{
        type:DataTypes.STRING,
        allowNull:false
    },
    provincia:{
        type:DataTypes.STRING,
        allowNull:false
    },
    municipio:{
        type:DataTypes.STRING,
        allowNull:false
    },
    telefone:{
        type:DataTypes.STRING,
        allowNull:false
    },
    email:{
        type:DataTypes.STRING,
        validate:{
            isEmail:true
        }
    },
    genero:{
        type:DataTypes.STRING,
        allowNull:false
    },
    estado_civil:{
        type:DataTypes.STRING,
        allowNull:false
    },
    residencia:{
        type:DataTypes.STRING,
        allowNull:false
    },
    escola_formacao:{
        type:DataTypes.STRING,
        allowNull:false
    },
    nivel_academico:{
        type:DataTypes.STRING,
        allowNull:false
    },
    area_formacao:{
        type:DataTypes.STRING,
        allowNull:false
    },
    grupo:{
        type:DataTypes.ENUM("Docente","Administrativo"),
        allowNull:false
    },
    status:{
        type:DataTypes.BOOLEAN,
        allowNull:false
    },
    user_id:{
        type:DataTypes.INTEGER,
        allowNull:false
    }
},{
    tableName:"funcionarios",
    timestamps:false
})

const ContratoDocente = conn.define("ContratoDocente",{
    id:{
        type:DataTypes.INTEGER,
        allowNull:false,
        primaryKey:true,
        autoIncrement:true,
        unique:true
    },
    funcionario_id:{
        type:DataTypes.INTEGER,
        allowNull:false
    },
    valor_tempo:{
        type:DataTypes.DOUBLE,
        allowNull:false
    },
    total_tempos:{
        type:DataTypes.INTEGER,
        allowNull:false
    },
    ano_id:{
        type:DataTypes.INTEGER,
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
    tableName:"contrato_docentes",
    timestamps:true
})

const ContratoAdministrativo = conn.define("ContratoAdministrativo",{
    id:{
        type:DataTypes.INTEGER,
        allowNull:false,
        primaryKey:true,
        autoIncrement:true,
        unique:true
    },
    funcionario_id:{
        type:DataTypes.INTEGER,
        allowNull:false
    },
    funcao:{
        type:DataTypes.STRING,
        allowNull:false
    },
    salario_base:{
        type:DataTypes.DOUBLE,
        allowNull:false
    },
    ano_id:{
        type:DataTypes.INTEGER,
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
    tableName:"contrato_administrativos",
    timestamps:true
})

const Feria = conn.define("Feria",{
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
    mes:{
        type:DataTypes.STRING,
        allowNull:false
    },
    funcionario_id:{
        type:DataTypes.INTEGER,
        allowNull:false
    },
    duracao:{
        type:DataTypes.INTEGER,
        allowNull:false
    },
    inicio:{
        type:DataTypes.DATEONLY,
        allowNull:false
    },
    termino:{
        type:DataTypes.DATEONLY,
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
    tableName:"ferias",
    timestamps:true
})

const FolhaSalarialDocentes = conn.define("FolhaSalarialDocentes",{
    id:{
        type:DataTypes.INTEGER,
        allowNull:false,
        primaryKey:true,
        autoIncrement:true,
        unique:true
    },
    qrcode:{
        type:DataTypes.INTEGER,
        allowNull:false
    },
    ano_id:{
        type:DataTypes.INTEGER,
        allowNull:false
    },
    mes:{
        type:DataTypes.STRING,
        allowNull:false
    },
    estado:{
        type:DataTypes.ENUM("Agendada","Processada","Cancelada"),
        allowNull:false
    },
    user_id:{
        type:DataTypes.INTEGER,
        allowNull:false
    },
    status:{
        type:DataTypes.BOOLEAN,
        allowNull:false,
        defaultValue:true
    }
},{
    tableName:"folha_salarial_docentes",
    timestamps:true
})

const ItensFolhaSalarialDocentes = conn.define("ItensFolhaSalarialDocentes",{
    id:{
        type:DataTypes.INTEGER,
        allowNull:false,
        primaryKey:true,
        autoIncrement:true,
        unique:true
    },
    folha_salarial_id:{
        type:DataTypes.INTEGER,
        allowNull:false
    },
    contrato_id:{
        type:DataTypes.INTEGER,
        allowNull:false
    },
    total_tempos:{
        type:DataTypes.INTEGER,
        allowNull:false
    },
    ss:{
        type:DataTypes.DOUBLE,
        allowNull:false
    },
    irt:{
        type:DataTypes.INTEGER,
        allowNull:false
    },
    horas_extras:{
        type:DataTypes.INTEGER,
        allowNull:false
    },
    subsidios:{
        type:DataTypes.INTEGER,
        allowNull:false
    },
    salario_liquido:{
        type:DataTypes.INTEGER,
        allowNull:false
    },
    detalhes:{
        type:DataTypes.TEXT,
        allowNull:false
    },
},{
    tableName:"folha_salarial_docentes_itens",
    timestamps:false
})

Estudante.belongsTo(Curso,{foreignKey:"curso_id"});
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
Sala.belongsTo(Curso,{foreignKey:"curso_id"});
Sala.belongsTo(Classe,{foreignKey:"classe_id"});
Sala.belongsTo(Periodo,{foreignKey:"periodo_id"});
Funcionario.belongsTo(User, {foreignKey:"user_id"})
ContratoDocente.belongsTo(AnoLectivo,{foreignKey:"ano_id"})
ContratoDocente.belongsTo(Funcionario,{foreignKey:"funcionario_id"})
ContratoDocente.belongsTo(User,{foreignKey:"user_id"})
ContratoAdministrativo.belongsTo(AnoLectivo,{foreignKey:"ano_id"})
ContratoAdministrativo.belongsTo(Funcionario,{foreignKey:"funcionario_id"})
ContratoAdministrativo.belongsTo(User,{foreignKey:"user_id"})
Feria.belongsTo(AnoLectivo,{foreignKey:"ano_id"})
Feria.belongsTo(Funcionario,{foreignKey:"funcionario_id"})
Feria.belongsTo(User,{foreignKey:"user_id"})
FolhaSalarialDocentes.belongsTo(AnoLectivo,{foreignKey:"ano_id"})
FolhaSalarialDocentes.belongsTo(User,{foreignKey:"user_id"})
ItensFolhaSalarialDocentes.belongsTo(FolhaSalarialDocentes, {foreignKey:"folha_salarial_id"})
ItensFolhaSalarialDocentes.belongsTo(ContratoDocente, {foreignKey:"contrato_id"})

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
    Funcionario,
    ContratoDocente,
    ContratoAdministrativo,
    Feria,
    FolhaSalarialDocentes,
    ItensFolhaSalarialDocentes
}