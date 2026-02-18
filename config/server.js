const express = require("express");
const app = express();
const http = require("http").Server(app);

const Io = require("socket.io")(http, {
    cors:{
        origin:"*",
        methods:["GET","POST", "DELETE", "PUT", "PATCH"]
    }
})

// Manipulador de eventos para quando um cliente se conecta
Io.on("connection", (socket) => {
    socket.on("disconnect", () => {
        console.log("Um cliente se desconectou.");
    });
});

const PORT = process.env.PORT || 9000;


module.exports = {app, Io, PORT, http};