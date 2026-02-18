
const { 
          DistribuicaoExame, 
          AnoLectivo, 
          Candidato, 
          CandidatoInscricao, 
          Curso, 
          Sala,
          Matricula,
          Classe, 
          Periodo,
          Pagamento,
          ItensPagamento,
          Emolumento,
          EmolumentoPreco,
          Utilizador,
          Disciplina,
          DisciplinaDistribuicao,
          DisciplinaProfessor,
          Despesa,
          FolhaSalarial, 
          ItensFolhaSalarial, 
          TabelaSalarial, 
          Contrato, 
          Funcionario
      } = require("../models/Model");
var pdf = require("pdf-creator-node")
const moment = require("moment")
const Sequelize = require("sequelize")
const {numberFormat,formattedToday} = require('../config/utils');
var fs = require("fs")
const timestamp = Date.now().toString();

var options = {
    format: "A4",
    orientation: "portrait",
    border: "10mm",
    /*header: {
        height: "45mm",
        contents: '<div style="text-align: center;">Author: Shyam Hajare</div>'
    },
    footer: {
        height: "28mm",
        contents: {
            first: 'Cover page',
            2: 'Second page', // Any page number is working. 1-based index
            default: '<span style="color: #444;">{{page}}</span>/<span>{{pages}}</span>', // fallback value
            last: 'Last Page'
        }
    }*/
};

async function createListaDistribuicaoExameAcesso(req, res){
  const {ano_id, curso_id, sala_id} = req.body;
  let num =1;
  var html = fs.readFileSync("./templates/lista_distribuicao_exame_acesso.html", "utf8");
    // Read HTML Template
  const candidatos = await DistribuicaoExame.findAll({where:{ano_id, curso_id, sala_id},include:[{
          model:Candidato,
      },{
          model:Curso
      },{
          model:Sala
      }],
      order:[[Candidato, 'nome', 'ASC']],
  })
  const curso = await Curso.findOne({where:{id:curso_id}})
  const ano = await AnoLectivo.findOne({where:{id:ano_id}})
  const sala = await Sala.findOne({where:{id:sala_id}})
  const dadosPDF = {
    header:{
      nome_curso:curso.nome,
      nome_ano:ano.nome,
      nome_sala:sala.nome,
      horario_sala:sala.horario,
    },
    candidatos:candidatos.map(item => ({
      id:num++,
      nome:item.Candidato.nome,
      identificacao:item.Candidato.identificacao,
      genero:item.Candidato.genero,
    }))
  }
  var document = {
    html: html,
    data: dadosPDF,
    path: './mediafiles/'+timestamp+'.pdf',
    type: "",
  };
  pdf
    .create(document, options)
    .then((doc) => {
        res.status(201).json({url:timestamp+'.pdf'})
    })
    .catch((error) => {
        console.error(error);
    });
}

async function createResultadoExameAcesso(req, res){
  const {ano_id, curso_id, sala_id} = req.body;
  let num =1;
  var html = fs.readFileSync("./templates/resultado_exame_acesso.html", "utf8");
    // Read HTML Template
  const candidatos = await DistribuicaoExame.findAll({where:{ano_id, curso_id, sala_id},include:[{
          model:Candidato,
      },{
          model:Curso
      },{
          model:Sala
      }],
      order:[['nota', 'DESC']],
  })
  const curso = await Curso.findOne({where:{id:curso_id}})
  const ano = await AnoLectivo.findOne({where:{id:ano_id}})
  const sala = await Sala.findOne({where:{id:sala_id}})
  const dadosPDF = {
    header:{
      nome_curso:curso.nome,
      nome_ano:ano.nome,
      nome_sala:sala.nome,
      horario_sala:sala.horario,
    },
    candidatos:candidatos.map(item => ({
      id:num++,
      nome:item.Candidato.nome,
      identificacao:item.Candidato.identificacao,
      genero:item.Candidato.genero,
      nota:item.nota,
      obs:item.obs,
    }))
  }
  var document = {
    html: html,
    data: dadosPDF,
    path: './mediafiles/'+timestamp+'.pdf',
    type: "",
  };
  pdf
    .create(document, options)
    .then((doc) => {
        res.status(201).json({url:timestamp+'.pdf'})
    })
    .catch((error) => {
        console.error(error);
    });
}

async function createCriptografiaExameAcesso(req, res){
  const {ano_id, curso_id, sala_id} = req.body;
  let num =1;
  var html = fs.readFileSync("./templates/encriptar_prova_exame_acesso.html", "utf8");
    // Read HTML Template
  const candidatos = await DistribuicaoExame.findAll({where:{ano_id, curso_id, sala_id},include:[{
          model:Candidato,
      },{
          model:Curso
      },{
          model:Sala
      }],
      order:[[Candidato, 'nome', 'ASC']],
  })
  const curso = await Curso.findOne({where:{id:curso_id}})
  const ano = await AnoLectivo.findOne({where:{id:ano_id}})
  const sala = await Sala.findOne({where:{id:sala_id}})
  const dadosPDF = {
    candidatos:candidatos.map(item => ({
      id:num++,
      nome:item.Candidato.nome,
      identificacao:item.Candidato.identificacao,
      genero:item.Candidato.genero,
      nota:item.nota,
      obs:item.obs,
      nome_ano:ano.nome,
      nome_curso:curso.nome,
      nome_sala:sala.nome,
      nome_horario:sala.nome,
    }))
  }
  var document = {
    html: html,
    data: dadosPDF,
    path: './mediafiles/'+timestamp+'.pdf',
    type: "",
  };
  pdf
    .create(document, options)
    .then((doc) => {
        res.status(201).json({url:timestamp+'.pdf'})
    })
    .catch((error) => {
        console.error(error);
    });
}

async function createListaGeralExameAcesso(req, res){
  const {ano_id, curso_id} = req.body;
  let num =1;
  var html = fs.readFileSync("./templates/lista_geral_exame_acesso.html", "utf8");
    // Read HTML Template
  const candidatos = await CandidatoInscricao.findAll({where:{ano_id, curso_id},include:[{
          model:Candidato,
      },{
          model:Curso
      }],
      order:[[Candidato, 'nome', 'ASC']],
  })
  const curso = await Curso.findOne({where:{id:curso_id}})
  const ano = await AnoLectivo.findOne({where:{id:ano_id}})
  const dadosPDF = {
    header:{
      nome_curso:curso.nome,
      nome_ano:ano.nome,
    },
    candidatos:candidatos.map(item => ({
      id:num++,
      nome:item.Candidato.nome,
      identificacao:item.Candidato.identificacao,
      genero:item.Candidato.genero,
    }))
  }
  var document = {
    html: html,
    data: dadosPDF,
    path: './mediafiles/'+timestamp+'.pdf',
    type: "",
  };
  pdf
    .create(document, options)
    .then((doc) => {
        res.status(201).json({url:timestamp+'.pdf'})
    })
    .catch((error) => {
        console.error(error);
    });
}

async function createComprovativoExameAcesso(req, res){
  const {id} = req.params;
  // Read HTML Template
  var html = fs.readFileSync("./templates/ficha_inscricao_exame_acesso.html", "utf8");
  const candidato = await CandidatoInscricao.findOne({
    where:{id},
    include:[
      {
          model:Candidato,
      },
      {
          model:Curso
      },
      {
          model:AnoLectivo
      }
    ]
  })
  const dadosPDF = {
    header:{
      nome_curso:candidato.Curso.nome,
      nome_ano:candidato.AnoLectivo.nome,
    },
    candidato:{
      numero:candidato.Candidato.numero,
      nome:candidato.Candidato.nome,
      nome_pai:candidato.Candidato.nome_pai,
      nome_mae:candidato.Candidato.nome_mae,
      identificacao:candidato.Candidato.identificacao,
      telefone:candidato.Candidato.telefone,
      email:candidato.Candidato.email,
      nacionalidade:candidato.Candidato.nacionalidade,
      naturalidade:candidato.Candidato.naturalidade,
      municipio:candidato.Candidato.municipio,
      comuna:candidato.Candidato.comuna,
      bairro:candidato.Candidato.bairro,
      genero:candidato.Candidato.genero,
      estado_civil:candidato.Candidato.estado_civil,
      escola_anterior:candidato.Candidato.escola_anterior,
      residencia:candidato.Candidato.residencia,
      necessidade_especial:candidato.Candidato.necessidade_especial,
    }
  }
  var document = {
    html: html,
    data: dadosPDF,
    path: './mediafiles/'+timestamp+'.pdf',
    type: "",
  };
  pdf
    .create(document, options)
    .then((doc) => {
        res.status(201).json({url:timestamp+'.pdf'})
    })
    .catch((error) => {
        console.error(error);
    });
}

async function createComprovativoMatricula(req, res){
  const {id,curso_id} = req.params;
  // Read HTML Template
  var html = fs.readFileSync("./templates/boletim_matricula.html", "utf8");
  const curso = await Curso.findOne({where:{id:curso_id}})
  const matricula = await Matricula.findOne({
    where:{id},
    include:[
      {
          model:Candidato,
      },
      {
          model:AnoLectivo
      },
      {
          model:Sala
      },
      {
          model:Periodo
      },
      {
          model:Classe
      },
      {
          model:Utilizador
      }
    ]
  })
  console.log(matricula)
  const dadosPDF = {
    header:{
      nome_curso:curso.nome,
      nome_ano:matricula.AnoLectivo.nome,
    },
    candidato:{
      id:candidato.id,
      data_matricula:matricula.createdAt,
      numero:matricula.Candidato.numero,
      nome:matricula.Candidato.nome,
      nome_pai:matricula.Candidato.nome_pai,
      nome_mae:matricula.Candidato.nome_mae,
      identificacao:matricula.Candidato.identificacao,
      telefone:matricula.Candidato.telefone,
      email:matricula.Candidato.email,
      nacionalidade:matricula.Candidato.nacionalidade,
      naturalidade:matricula.Candidato.naturalidade,
      municipio:matricula.Candidato.municipio,
      comuna:matricula.Candidato.comuna,
      bairro:matricula.Candidato.bairro,
      genero:matricula.Candidato.genero,
      estado_civil:matricula.Candidato.estado_civil,
      escola_anterior:matricula.Candidato.escola_anterior,
      residencia:matricula.Candidato.residencia,
      necessidade_especial:matricula.Candidato.necessidade_especial,
      sala:matricula.Sala.nome,
      periodo:matricula.Periodo.nome,
      classe:matricula.Classe.nome,
      operador:matricula.Utilizador.nome,
      data:moment(matricula.createdAt).format("DD-MM-YYYY")
    }
  }
  var document = {
    html: html,
    data: dadosPDF,
    path: './mediafiles/'+timestamp+'.pdf',
    type: "",
  };
  pdf
    .create(document, options)
    .then((doc) => {
        res.status(201).json({url:timestamp+'.pdf'})
    })
    .catch((error) => {
        console.error(error);
    });
}

async function createListaMatriculados(req, res){
  const {ano_id, curso_id, periodo_id, classe_id, sala_id} = req.params;
  let num =1;
  var html = fs.readFileSync("./templates/lista_estudantes_matriculados.html", "utf8");
    // Read HTML Template
  const candidatos = await Matricula.findAll({where:{ano_id, sala_id},include:[{
          model:Candidato,
      },
      {
          model:Curso
      }
    ],
      order:[[Candidato, 'nome', 'ASC']],
  })
  const curso = await Curso.findOne({where:{id:curso_id}})
  const ano = await AnoLectivo.findOne({where:{id:ano_id}})
  const periodo = await Periodo.findOne({where:{id:periodo_id}})
  const classe = await Classe.findOne({where:{id:classe_id}})
  const sala = await Sala.findOne({where:{id:sala_id}})
  const dadosPDF = {
    header:{
      nome_curso:curso.nome,
      nome_ano:ano.nome,
      nome_periodo:periodo.nome,
      nome_classe:classe.nome,
      nome_sala:sala.nome,
    },
    candidatos:candidatos.map(item => ({
      id:num++,
      nome:item.Candidato.nome,
      identificacao:item.Candidato.identificacao,
      numero:item.Candidato.numero,
    }))
  }
  var document = {
    html: html,
    data: dadosPDF,
    path: './mediafiles/'+timestamp+'.pdf',
    type: "",
  };
  pdf
    .create(document, options)
    .then((doc) => {
        res.status(201).json({url:timestamp+'.pdf'})
    })
    .catch((error) => {
        console.error(error);
    });
}

async function createFluxoDeCaixa(req, res){
  var options = {
    format: "A4",
    orientation: "portrait",
    border: "10mm",
  }
  const {start_date, end_date} = req.body;
  let num =1;
  var html = fs.readFileSync("./templates/fluxo_de_caixa.html", "utf8");
  
  const pagamentos = await Pagamento.findAll({
      where:{
        createdAt:{
          [Sequelize.Op.between]:[start_date, end_date]
        }
      },
      include: [
          {
              model: ItensPagamento,
              include: [
                  
                  {
                      model: EmolumentoPreco,
                      attributes: ['id', 'preco'],
                      include:[
                          {
                              model:Emolumento,
                              attributes:['id','nome']
                          }
                      ]
                  }
              ]
          },
          {
            model:Utilizador,
            attributes:['id','nome']
          },
          {
            model:Candidato,
            attributes:['nome']
          }
      ],
      attributes: [
          'id',
          'descricao',
          'createdAt',
          [Sequelize.fn('SUM', Sequelize.literal('preco - (preco * desconto / 100) + (preco * multa / 100)')), 'totalPrice']
      ],
      group: ['Pagamento.id'] 
  })

  const despesas = await Despesa.findAll({
      where:{
          createdAt:{
              [Sequelize.Op.between]:[start_date, end_date]
          }
      },
      include:[Utilizador]
  })

  var dadosPDF = {
    header:{
      start_date:start_date,
      end_date:end_date
    },
    pagamentos:pagamentos.map(item => ({
      id:num++,
      descricao:item.descricao,
      estudante:item.Candidato.nome,
      valor:numberFormat(item.dataValues.totalPrice,2,',','.'),
      utilizador:item.Utilizador.nome,
      data:moment(item.createdAt).format("DD-MM-YYYY"),
    })),
    despesas:despesas.map(item => ({
      id:num++,
      descricao:item.descricao,
      valor:numberFormat(item.valor,2,',','.'),
      referencia:item.referencia,
      utilizador:item.Utilizador.nome,
      data:moment(item.createdAt).format("DD-MM-YYYY"),
    }))
  }
  var document = {
    html: html,
    data: dadosPDF,
    path: './mediafiles/'+timestamp+'.pdf',
    type: "",
  };
  pdf
    .create(document, options)
    .then((doc) => {
        res.status(201).json({url:timestamp+'.pdf'})
    })
    .catch((error) => {
        console.error(error);
    });
}

async function createComprovativoPagamento(req, res){
  var options = {
    format: "A4",
    orientation: "landscape",
    border: "5mm",
  }
  const {pagamento_id} = req.params;
  let num =1;
  var html = fs.readFileSync("./templates/comprovativo_pagamento.html", "utf8");
    // Read HTML Template
  const itens = await ItensPagamento.findAll({where:{pagamento_id},include:[Emolumento, EmolumentoPreco]})
  const pagamento = await Pagamento.findOne({where:{id:pagamento_id},include:[Candidato,AnoLectivo]})
  const estudante = await Candidato.findOne({where:{id:pagamento.estudante_id}});
  const utilizador = await Utilizador.findOne({where:{id:pagamento.user_id}});
  const matricula = await Matricula.findOne({where:{ano_id:pagamento.ano_id, estudante_id: pagamento.estudante_id},include:[Classe,Curso,Sala]})
  
  var dadosPDF = {
    header:{
      id:pagamento.id,
      ano:pagamento.AnoLectivo.nome,
      estudante:pagamento.Candidato.nome,
      data:formattedToday
    },
    footer:{
      subtotal:0,
      descontos:0,
      multas:0,
      total:0,
      funcionario:utilizador.nome
    },
    estudante:{
      nome:estudante.nome,
      identificacao:estudante.identificacao,
      numero:estudante.numero,
      curso:(matricula?matricula.Curso.nome:"N/Atribuido"),
      classe:(matricula?matricula.Classe.nome:"N/Atribuida"),
      turma:matricula.Sala.nome
    },  
    itens:itens.map(item => ({
      id:num++,
      emolumento:item.Emolumento.nome,
      preco:numberFormat(item.EmolumentoPreco.preco,2,',','.'),
      desconto:numberFormat(item.EmolumentoPreco.preco * item.desconto / 100,2,',','.'),
      multa:numberFormat(item.EmolumentoPreco.preco * item.multa / 100,2,',','.'),
      subtotal:numberFormat(item.EmolumentoPreco.preco - (item.EmolumentoPreco.preco * item.desconto / 100 ) + (item.EmolumentoPreco.preco * item.multa / 100),2,',','.'),
    }))
  }
  itens.map(item=>{
    dadosPDF.footer.subtotal += item.EmolumentoPreco.preco
    dadosPDF.footer.total += item.EmolumentoPreco.preco - (item.EmolumentoPreco.preco * item.desconto / 100 ) + (item.EmolumentoPreco.preco * item.multa / 100)
    dadosPDF.footer.descontos += item.EmolumentoPreco.preco * item.desconto / 100
    dadosPDF.footer.multas += item.EmolumentoPreco.preco * item.multa / 100
  })
  // Formatar valores finais no footer
  dadosPDF.footer.subtotal = numberFormat(dadosPDF.footer.subtotal, 2, ',', '.');
  dadosPDF.footer.total = numberFormat(dadosPDF.footer.total, 2, ',', '.');
  dadosPDF.footer.descontos = numberFormat(dadosPDF.footer.descontos, 2, ',', '.');
  dadosPDF.footer.multas = numberFormat(dadosPDF.footer.multas, 2, ',', '.');
  var document = {
    html: html,
    data: dadosPDF,
    path: './mediafiles/'+timestamp+'.pdf',
    type: "",
  };
  pdf
    .create(document, options)
    .then((doc) => {
        res.status(201).json({url:timestamp+'.pdf'})
    })
    .catch((error) => {
        console.error(error);
    });
}

async function createPautaTrimestral(req, res){

  const {ano_id, curso_id, sala_id,  classe_id, trimestre_id} = req.body;

  var options = {
    format: "A3",
    orientation: "landscape",
    border: "1mm",
  }

  let num =1;

  const html = fs.readFileSync("./templates/pauta_trimestral.html", "utf8");
 
  const matriculados = await Matricula.findAll({where:{ano_id, classe_id, sala_id}, include:[Candidato], order:[[Candidato, 'nome', 'ASC']]});
  const disciplinas = await DisciplinaDistribuicao.findAll({where:{ano_id, curso_id, classe_id},include:[
    {
      model:Disciplina
    }
  ]})
  const dadosPDF = {
    estudantes:matriculados.map(item => ({
      id:num++,
      nome:item.Candidato.nome,
      disciplinas:disciplinas.map(item => ({
        id:item.Disciplina.id,
        nome:item.Disciplina.codigo
      }))
    })),

    disciplinas:disciplinas.map(item => ({
      id:item.Disciplina.id,
      nome:item.Disciplina.codigo
    }))
  }

  var document = {
    html: html,
    data: dadosPDF,
    path: './mediafiles/'+timestamp+'.pdf',
    type: "",
  };
  pdf
    .create(document, options)
    .then((doc) => {
        res.status(201).json({url:timestamp+'.pdf'})
    })
    .catch((error) => {
        console.error(error);
    });
}

async function createFolhaSalarial(req, res){

  const {id} = req.params;

  var options = {
    format: "A4",
    orientation: "landscape",
    border: "5mm",
  }

  let num =1;

  const html = fs.readFileSync("./templates/folha_salarial.html", "utf8");

  const folhaSalarial = await FolhaSalarial.findOne({ 
    where: { id },
    include:[
        {
            model:ItensFolhaSalarial,
            include:[
                {
                    model:TabelaSalarial,
                    attributes:['valor']
                },
                {
                    model:Contrato,
                    include:[
                        {
                            model:Funcionario,
                        }
                    ]
                },
            ]
        },
        {
            model:Utilizador,
            attributes:['id','nome']
        },
        {
            model:AnoLectivo
        }
    ]
    })
 
  
  const dadosPDF = {
    folha_salarial:{
      mes:folhaSalarial.mes,
      totalDocumento:0
    },
    itens:folhaSalarial.ItensFolhaSalarials.map(item => ({
      id:num++,
      funcionario:item.Contrato.Funcionario.nome,
      identificacao:item.Contrato.Funcionario.identificacao,
      iban:item.Contrato.Funcionario.iban,
      salario_base:numberFormat(item.TabelaSalarial.valor,2,',','.'),
      inss:numberFormat(item.ss*item.TabelaSalarial.valor/100,2,',','.'),
      irt:numberFormat(item.irt*item.TabelaSalarial.valor/100,2,',','.'),
      faltas:numberFormat(item.faltas,2,',','.'),
      carga_diaria:item.carga_horaria_diaria,
      carga_mensal:item.carga_horaria_mensal,
      bonus:numberFormat(item.bonus,2,',','.'),
      subsidios:numberFormat(item.subsidios,2,',','.'),
      horas_extras:numberFormat(item.horas_extras,2,',','.'),
      outros_descontos:numberFormat(item.outros_descontos,2,',','.'),
      saldo_liquido:numberFormat(item.TabelaSalarial.valor - (folhaSalarial.descontos_globais * item.TabelaSalarial.valor / 100) - (item.ss * item.TabelaSalarial.valor / 100) - (item.irt * item.TabelaSalarial.valor / 100) - item.faltas + item.bonus + item.horas_extras - item.outros_descontos,2,',','.'),
    }))
  }

  folhaSalarial.ItensFolhaSalarials.map(item => {
    dadosPDF.folha_salarial.totalDocumento += (item.TabelaSalarial.valor - (folhaSalarial.descontos_globais * item.TabelaSalarial.valor / 100) - (item.ss * item.TabelaSalarial.valor / 100) - (item.irt * item.TabelaSalarial.valor / 100) - item.faltas + item.bonus + item.horas_extras - item.outros_descontos)
  })

  dadosPDF.folha_salarial.totalDocumento = numberFormat(dadosPDF.folha_salarial.totalDocumento,2,',','.')

  var document = {
    html: html,
    data: dadosPDF,
    path: './mediafiles/'+timestamp+'.pdf',
    type: "",
  };
  pdf
    .create(document, options)
    .then((doc) => {
        res.status(201).json({url:timestamp+'.pdf'})
    })
    .catch((error) => {
        console.error(error);
    });
}

module.exports = {
  createListaDistribuicaoExameAcesso,
  createResultadoExameAcesso,
  createCriptografiaExameAcesso,
  createListaGeralExameAcesso,
  createComprovativoExameAcesso,
  createComprovativoMatricula,
  createListaMatriculados,
  createComprovativoPagamento,
  createFluxoDeCaixa,
  createPautaTrimestral,
  createFolhaSalarial
}