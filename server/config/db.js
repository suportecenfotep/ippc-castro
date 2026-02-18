const { Sequelize } = require("sequelize");

const conn = new Sequelize('cenfolite_escolar', 'root', '', {
    host: 'localhost',
    dialect: 'mysql'
});

module.exports = conn;