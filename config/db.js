const { Sequelize } = require("sequelize");

// const conn = new Sequelize('bfq8wtsefytinjkflkoj', 'u4dhnuitxfytovrs', 'fFHf0XoCDGxbZEUHaGbu', {
//     host: 'bfq8wtsefytinjkflkoj-mysql.services.clever-cloud.com',
//     dialect: 'mysql'
// });

const conn = new Sequelize('cenfolite_escolar', 'root', '', {
    host: 'localhost',
    dialect: 'mysql'
});

module.exports = conn;
