const { Sequelize } = require("sequelize");

const conn = new Sequelize('bfq8wtsefytinjkflkoj', 'u4dhnuitxfytovrs', 'fFHf0XoCDGxbZEUHaGbu', {
    host: 'bfq8wtsefytinjkflkoj-mysql.services.clever-cloud.com',
    dialect: 'mysql'
});

module.exports = conn;
