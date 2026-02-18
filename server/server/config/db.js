const { Sequelize } = require("sequelize");

const conn = new Sequelize('db_castro', 'root', '', {
    host: 'localhost',
    dialect: 'mysql'
});

module.exports = conn;