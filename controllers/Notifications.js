const { Notification } = require('../models/Model');

// 🔹 Listar todas as notificações (ordenadas por data decrescente)
const listNotifications = (req, res) => {
  Notification.findAll({
    order: [["createdAt", "DESC"]],
  })
    .then(data => {
      res.status(200).json(data);
    })
    .catch(err => {
      console.error("Erro ao listar notificações:", err);
      res.status(500).json({ error: "Erro ao listar notificações" });
    });
};

// 🔹 Listar apenas as notificações mais recentes (últimas 10)
const listRecentNotifications = (req, res) => {
  Notification.findAll({
    order: [["createdAt", "DESC"]],
    limit: 10, // Pode ajustar conforme a necessidade
  })
    .then(data => {
      res.status(200).json(data);
    })
    .catch(err => {
      console.error("Erro ao listar notificações recentes:", err);
      res.status(500).json({ error: "Erro ao listar notificações recentes" });
    });
};

module.exports = {
  listNotifications,
  listRecentNotifications,
};
