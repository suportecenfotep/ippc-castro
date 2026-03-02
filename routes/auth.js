const express = require("express");
const router = express.Router();
const { verifyToken } = require("../config/utils");

// CONTROLLERS
const Utilizador = require("../controllers/auth/Utilizador");
const License = require("../controllers/auth/License");
const Notifications = require("../controllers/auth/Notifications");


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

// LICENÇAS
router.post("/license/create/", License.create);
router.get("/license/read/", License.read);
router.get("/license/check-expiration/", License.checkExpiration);
router.get("/license/verify/", License.verifyLicense);

// NOTIFICAÇÕES
router.get("/notifications/", verifyToken, Notifications.listNotifications);
router.get("/notifications/recent", verifyToken, Notifications.listRecentNotifications);

module.exports = router;