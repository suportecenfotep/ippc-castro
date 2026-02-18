const { create } = require("xmlbuilder");
const fs = require("fs");
const crypto = require('crypto');
const jwt = require('jsonwebtoken');

const gerarNumero = () => {
    return Math.floor(100000 + Math.random() * 900000);
};

const verifyToken = (req, res, next) => {
    // Verifica se o header Authorization contém um token JWT
    const authHeader = req.headers.authorization;
    if (authHeader) {
      const token = authHeader.split(' ')[1]; 
      const secretKey = "angola";
      jwt.verify(token, secretKey, (err, user) => {
        if (err) {
          return res.sendStatus(403); 
        }
        req.user = user;
        next();
      });
    } else {
      res.sendStatus(401); 
    }
  }

  
const numberFormat = (number, decimals = 0, decimalSeparator = '.', thousandSeparator = ',') => {
number = parseFloat(number);

if (isNaN(number)) {
    return '';
}

const fixedNumber = number.toFixed(decimals);
const parts = fixedNumber.split('.');
const integerPart = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, thousandSeparator);

let formattedNumber = integerPart;

if (parts.length === 2) {
    formattedNumber += decimalSeparator + parts[1];
} else if (decimals > 0) {
    formattedNumber += decimalSeparator + '0'.repeat(decimals);
}

return formattedNumber;
}

function formatDate(date) {
    // Array de meses para usar na formatação
    const months = [
      "Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho",
      "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"
    ];
  
    // Obter o dia, mês e ano da data fornecida
    const day = date.getDate();
    const monthIndex = date.getMonth();
    const year = date.getFullYear();
  
    // Montar a string formatada
    const formattedDate = `${day} de ${months[monthIndex]} de ${year}`;
  
    return formattedDate;
}
  
  // Exemplo de uso:
  const today = new Date();
  const formattedToday = formatDate(today);


module.exports = {
    gerarNumero,
    verifyToken,
    numberFormat,
    formattedToday
};
