const express = require("express");
const router = express.Router();
const uploadFile = require("../config/upload");
const { verifyToken } = require("../config/utils");

// CONTROLLERS
const Ano = require("../controllers/Ano");
const EmolumentoNatureza = require("../controllers/EmolumentoNatureza");
const Emolumento = require("../controllers/Emolumento");
const Curso = require("../controllers/Curso");
const Utilizador = require("../controllers/Utilizador");
const Estudante = require("../controllers/Estudante");
const Sala = require("../controllers/Sala");
const Classe = require("../controllers/Classe");
const Periodo = require("../controllers/Periodo");
const Matricula = require("../controllers/Matricula");
const EmolumentoPreco = require("../controllers/EmolumentoPreco");
const Pagamento = require("../controllers/Pagamento");
const Despesa = require("../controllers/Despesa");
const FluxoDeCaixa = require("../controllers/FluxoDeCaixa");
const License = require("../controllers/License");
const Notifications = require("../controllers/Notifications");

// DOCS FILE
const pdf = require("./pdfs");

// UTILIZADORES
router.post("/utilizadores/", verifyToken, Utilizador.create);
router.get("/utilizadores/", verifyToken, Utilizador.listAll);
router.get("/utilizadores/nivel/:nivel/", verifyToken, Utilizador.listByLevel);
router.get("/utilizadores/status/:status/", verifyToken, Utilizador.listByStatus);
router.get("/utilizadores/:id/", verifyToken, Utilizador.read);
router.put("/utilizadores/:id/", verifyToken, Utilizador.update);
router.put("/utilizadores/status/:id/", Utilizador.updateStatus);
router.delete("/utilizadores/:id/", verifyToken, Utilizador.remove);
router.post("/utilizadores/login/", Utilizador.login);

// ANO
router.post("/anos", verifyToken, Ano.create);
router.put("/anos/:id/", verifyToken, Ano.update);
router.delete("/anos/:id/", verifyToken, Ano.remove);
router.get("/anos/", verifyToken, Ano.listAll);
router.get("/anos/status/:status/", verifyToken, Ano.listByStatus);

// CURSO
router.post("/cursos", verifyToken, uploadFile, Curso.create);
router.put("/cursos/:id/", verifyToken, uploadFile, Curso.update);
router.delete("/cursos/:id/", verifyToken, Curso.remove);
router.get("/cursos/", Curso.listAll);

// EMOLUMENTO NATUREZA
router.post("/emolumento-natureza", verifyToken, EmolumentoNatureza.create);
router.put("/emolumento-natureza/:id/", verifyToken, EmolumentoNatureza.update);
router.delete("/emolumento-natureza/:id/", verifyToken, EmolumentoNatureza.remove);
router.get("/emolumento-natureza/", verifyToken, EmolumentoNatureza.listAll);

// EMOLUMENTO
router.post("/emolumentos", verifyToken, Emolumento.create);
router.put("/emolumentos/:id/", verifyToken, Emolumento.update);
router.delete("/emolumentos/:id/", verifyToken, Emolumento.remove);
router.get("/emolumentos/natureza/:natureza_id", verifyToken, Emolumento.listByNature);
router.get("/emolumentos/", verifyToken, Emolumento.listAll);

// EMOLUMENTO PRECO
router.post("/emolumento-preco", verifyToken, EmolumentoPreco.create);
router.put("/emolumento-preco/:id/", verifyToken, EmolumentoPreco.update);
router.delete("/emolumento-preco/:id/", verifyToken, EmolumentoPreco.remove);
router.get("/emolumento-preco/", verifyToken, EmolumentoPreco.listAll);
router.get("/emolumento-preco/ano/:ano_id/curso/:curso_id/classe/:classe_id/natureza/:emolumento_natureza_id/", verifyToken, EmolumentoPreco.filterData);
router.get("/emolumento-preco/ano/:ano_id/curso/:curso_id/classe/:classe_id/natureza/:emolumento_natureza_id/emolumento/:emolumento_id", verifyToken, EmolumentoPreco.filterByEmolument);

// ESTUDANTES
router.post("/estudantes", verifyToken, Estudante.create);
router.put("/estudantes/:id/", verifyToken, Estudante.update);
router.delete("/estudantes/:id/", verifyToken, Estudante.remove);
router.get("/estudantes/", verifyToken, Estudante.listAll);
router.get("/estudantes/curso/:curso_id", verifyToken, Estudante.listByCourse);
router.get("/estudantes/:id", verifyToken, Estudante.read);
router.get("/estudantes/numero/:numero", verifyToken, Estudante.searchByNumber);

// PAGAMENTOS
router.post("/pagamentos", verifyToken, Pagamento.create);
router.put("/pagamentos/:id/", verifyToken, Pagamento.update);
router.get("/pagamentos/:id/", verifyToken, Pagamento.read);
router.delete("/pagamentos/:id/", verifyToken, Pagamento.remove);
router.get("/pagamentos/", verifyToken, Pagamento.listAll);
router.get("/pagamentos/ano/:ano_id/estudante/:estudante_id", verifyToken, Pagamento.listByEstudante);
router.get("/pagamentos/estudante/:estudante_id", verifyToken, Pagamento.listByStudentOrUser );
router.get("/pagamentos/balancos/getAll/:ano_id", verifyToken, Pagamento.getBalances);
router.get("/pagamentos/list/mensais", verifyToken, Pagamento.getMonthlyTotals);
router.get("/pagamentos/list/anuais", verifyToken, Pagamento.getAnnualTotals);
router.get("/pagamentos/export/saft", verifyToken, Pagamento.generateSaftXML)
router.post("/pagamentos/admin/repair-history", verifyToken, Pagamento.repairPaymentHistory);

// ITENS PAGAMENTO
router.get("/fluxo-de-caixa/start/:start_date/end/:end_date", verifyToken, FluxoDeCaixa.filterData);
router.get("/fluxo-de-caixa/devedores/ano/:ano_id/turma/:sala_id/emolumento/:emolumento_id", FluxoDeCaixa.getDevedores);

// DESPESAS
router.post("/despesas", verifyToken, Despesa.create);
router.put("/despesas/:id/", verifyToken, Despesa.update);
router.delete("/despesas/:id/", verifyToken, Despesa.remove);
router.get("/despesas/start/:start_date/end/:end_date", verifyToken, Despesa.filterData);
router.get("/despesas/", verifyToken, Despesa.listAll);

// SALAS     
router.post("/salas", verifyToken, Sala.create);
router.put("/salas/:id/", verifyToken, Sala.update);
router.delete("/salas/:id/", verifyToken, Sala.remove);
router.get("/salas/", verifyToken, Sala.listAll);
router.get("/salas/status/:status/", verifyToken, Sala.listByStatus);
router.get("/salas/curso/:curso_id/classe/:classe_id/periodo/:periodo_id/", verifyToken, Sala.filterData);
router.get("/salas/curso/:curso_id/classe/:classe_id/", verifyToken, Sala.listByCursoClasse);
router.get("/salas/num-estudantes/ano/:ano_id/curso/:curso_id/classe/:classe_id/periodo/:periodo_id", Sala.listWithStudentCount);

// CLASSES     
router.post("/classes", verifyToken, Classe.create);
router.put("/classes/:id/", verifyToken, Classe.update);
router.delete("/classes/:id/", verifyToken, Classe.remove);
router.get("/classes/", verifyToken, Classe.listAll);

// PERÍODOS
router.post("/periodos", verifyToken, Periodo.create);
router.put("/periodos/:id/", verifyToken, Periodo.update);
router.delete("/periodos/:id/", verifyToken, Periodo.remove);
router.get("/periodos/", verifyToken, Periodo.listAll);

// MATRICULA
router.post("/matricula", verifyToken, Matricula.create);
router.put("/matricula/:id/", verifyToken, Matricula.update);
router.delete("/matricula/:id/", verifyToken, Matricula.remove);
router.get("/matricula/ano/:ano_id/turma/:sala_id/", verifyToken, Matricula.filterData);
router.get("/matricula/", verifyToken, Matricula.listAll);
router.get("/matricula/:id/", verifyToken, Matricula.read);
router.get("/matricula/estado/:estado", verifyToken, Matricula.listByStatus);
router.get("/matricula/estudante/:estudante_id/estado/:estado", Matricula.listByEstudante);
router.get("/matricula/estudante/:estudante_id/", Matricula.listAllByEstudante);
router.post("/matricula/multiple", verifyToken, Matricula.createMultiple);

// LICENÇAS
router.post("/license/create/", License.create);
router.get("/license/read/", License.read);
router.get("/license/check-expiration/", License.checkExpiration);
router.get("/license/verify/", License.verifyLicense);

// NOTIFICAÇÕES
router.get("/notifications/", verifyToken, Notifications.listNotifications);
router.get("/notifications/recent", verifyToken, Notifications.listRecentNotifications);

// DOCS
router.get("/documentos/boletim-matricula/:id", pdf.createComprovativoMatricula);
router.get("/documentos/lista-matriculados/ano/:ano_id/curso/:curso_id/periodo/:periodo_id/classe/:classe_id/sala/:sala_id", pdf.createListaMatriculados);
router.get("/documentos/fluxo-de-caixa/start/:start_date/end/:end_date", pdf.createFluxoDeCaixa);

module.exports = router;