const { Sequelize } = require("sequelize");

const conn = new Sequelize('cenfolite_escolar', 'root', '', {
    host: 'bfq8wtsefytinjkflkoj-mysql.services.clever-cloud.com',
    dialect: 'mysql'
});

module.exports = conn;