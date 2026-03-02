const express = require("express");
const router = express.Router();
const { verifyToken } = require("../config/utils");

// CONTROLLERS
const Estudante = require("../controllers/app/Estudante");
const Matricula = require("../controllers/app/Matricula");
const Pagamento = require("../controllers/app/Pagamento");
const Despesa = require("../controllers/app/Despesa");
const Dashboard = require("../controllers/app/Dashboard"); // Importado
const FluxoDeCaixa = require("../controllers/app/FluxoDeCaixa");

// DOCS FILE
const pdf = require("./pdfs");

// ===============================
// 📊 DASHBOARD & RELATÓRIOS
// ===============================
router.get("/dashboard/academic", verifyToken, Dashboard.getAcademicDashboard);

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

// ITENS PAGAMENTO / FLUXO DE CAIXA
router.get("/fluxo-de-caixa/start/:start_date/end/:end_date", verifyToken, FluxoDeCaixa.filterData);
router.get("/fluxo-de-caixa/devedores/ano/:ano_id/turma/:sala_id/emolumento/:emolumento_id", FluxoDeCaixa.getDevedores);

// DESPESAS
router.post("/despesas", verifyToken, Despesa.create);
router.put("/despesas/:id/", verifyToken, Despesa.update);
router.delete("/despesas/:id/", verifyToken, Despesa.remove);
router.get("/despesas/start/:start_date/end/:end_date", verifyToken, Despesa.filterData);
router.get("/despesas/", verifyToken, Despesa.listAll);

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

// DOCS
router.get("/documentos/boletim-matricula/:id", pdf.createComprovativoMatricula);
router.get("/documentos/lista-matriculados/ano/:ano_id/curso/:curso_id/periodo/:periodo_id/classe/:classe_id/sala/:sala_id", pdf.createListaMatriculados);
router.get("/documentos/fluxo-de-caixa/start/:start_date/end/:end_date", pdf.createFluxoDeCaixa);

module.exports = router; 