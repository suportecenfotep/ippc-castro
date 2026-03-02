const express = require("express");
const router = express.Router();
const uploadFile = require("../config/upload");
const { verifyToken } = require("../config/utils");

// CONTROLLERS
const Ano = require("../controllers/config/Ano");
const EmolumentoNatureza = require("../controllers/config/EmolumentoNatureza");
const Emolumento = require("../controllers/config/Emolumento");
const EmolumentoPreco = require("../controllers/config/EmolumentoPreco");
const Curso = require("../controllers/config/Curso");
const Sala = require("../controllers/config/Sala");
const Classe = require("../controllers/config/Classe");
const Periodo = require("../controllers/config/Periodo");

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

module.exports = router;