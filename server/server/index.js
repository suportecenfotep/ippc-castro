const { app, PORT, http } = require("./config/server");
const bodyParser = require("body-parser");
const cors = require("cors");
const express = require("express")
const path = require("path");
const conn = require("./config/db");
const cronJobs = require("./config/cronJobs");

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({extended:true}))

app.use(cors())

app.use("/api",require("./routes/api"));
app.use("/api/mediafiles", express.static(path.join(__dirname, "mediafiles")))
app.use("/static", express.static(path.join(__dirname, "static")))

app.use("/css", express.static(path.join(__dirname, "dist/css/")))
app.use("/", express.static(path.join(__dirname, "dist")))

app.get("/", (req, res) => {
    res.json("Servidor Rodando Perfeitamente");
})

http.listen(PORT, () => {
    conn.sync()
    console.log(`Server running at: http://localhost:${PORT}/"`);
})
