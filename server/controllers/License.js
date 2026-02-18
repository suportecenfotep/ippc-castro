const { License } = require("../models/Model");
const fs = require('fs');
const path = require('path');
const moment = require('moment');

// Função para criar licença
const create = (req, res) => {
    const licenseKey = `LICENSE-${Date.now()}-${Math.random().toString(36).substring(2)}`;

    // Define a data de expiração
    const expirationDate = moment().add(1, 'year').toDate();

    const form = {
        licenseKey: licenseKey,
        expirationDate: expirationDate,
        code: req.body.activation_code
    };

    if (req.body.activation_code !== 'laidy') {
        return res.status(400).json({ message: "Código inválido" });
    }

    License.create(form)
        .then(data => {
            const licenseContent = `User: IPPC\nLicense Key: ${licenseKey}\nExpiration Date: ${expirationDate}`;
            const extension = '.eloise';
            const licensesDir = path.join(__dirname, '../licenses'); // Ajuste o caminho conforme necessário

            // Verifica se o diretório 'licenses' existe, caso contrário, cria-o
            if (!fs.existsSync(licensesDir)) {
                fs.mkdirSync(licensesDir);
            }

            const filePath = path.join(licensesDir, `IPPC${extension}`);
            fs.writeFileSync(filePath, licenseContent);

            res.status(201).json({ message: "Success", data, filePath });
        })
        .catch(err => {
            console.log(err);
            res.status(500).json(err);
        });
};

// Função para ler a licença
const  read = (req, res) => {

    License.findOne()
        .then(data => {
            if (!data) {
                return res.status(404).json({ message: "Licença não encontrada" });
            }

            const extension = '.eloise';
            const filePath = path.join(__dirname, '../licenses', `IPPC${extension}`); // Ajuste o caminho conforme necessário

            if (fs.existsSync(filePath)) {
                const licenseContent = fs.readFileSync(filePath, 'utf-8');
                res.status(200).json({ data, licenseContent, activationCode: data.code });
            } else {
                res.status(404).json({ message: "Arquivo de licença não encontrado" });
            }
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

// Função para verificar expiração
const checkExpiration = (req, res) => {
    const { id } = req.params;

    License.findOne({ where: { id } })
        .then(data => {
            if (!data) {
                return res.status(404).json({ message: "Licença não encontrada" });
            }

            const currentDate = new Date();
            if (currentDate > data.expirationDate) {
                res.status(200).json({ message: "Licença expirada" });
            } else {
                res.status(200).json({ message: "Licença ainda é válida" });
            }
        })
        .catch(err => {
            res.status(500).json(err);
        });
};

// Função para verificar a licença a partir de um arquivo
const verifyLicense = (req, res) => {
    const { user } = req.body;
    const extension = '.eloise';
    const filePath = path.join(__dirname, '../licenses', `${user}${extension}`); // Ajuste o caminho conforme necessário

    if (fs.existsSync(filePath)) {
        const licenseContent = fs.readFileSync(filePath, 'utf-8');
        const lines = licenseContent.split('\n');
        const licenseKey = lines[1].split(': ')[1];
        const expirationDate = new Date(lines[2].split(': ')[1]);

        const currentDate = new Date();
        if (currentDate > expirationDate) {
            res.status(200).json({ message: "Licença expirada" });
        } else {
            res.status(200).json({ message: "Licença ainda é válida", licenseKey });
        }
    } else {
        res.status(404).json({ message: "Arquivo de licença não encontrado" });
    }
};

module.exports = {
    create,
    read,
    checkExpiration,
    verifyLicense
};
