const { create } = require("xmlbuilder");
const fs = require("fs");
const crypto = require('crypto');
const jwt = require('jsonwebtoken');

const gerarNumero = () => {
    return Math.floor(100000 + Math.random() * 900000);
};

const generateSAFT = () => {
    // Dados fictícios da empresa e transações
    const saftData = {
        Header: {
            CompanyName: "Empresa Exemplo Lda",
            CompanyID: "123456789",
            TaxRegistrationNumber: "123456789",
            TaxAccountingBasis: "1",
            CompanyAddress: {
                AddressDetail: "Rua Exemplo, 123",
                City: "Exemplo",
                PostalCode: "1234-567",
                Country: "PT"
            },
            FiscalYear: "2024",
            StartDate: "2024-01-01",
            EndDate: "2024-12-31",
            CurrencyCode: "EUR",
            DateCreated: new Date().toISOString(),
            TaxEntity: "Global",
            ProductCompanyTaxID: "123456789",
            SoftwareCertificateNumber: "123456789",
            ProductID: "MyAccountingSoftware",
            ProductVersion: "1.0",
            HeaderComment: "Exemplo de ficheiro SAFT"
        },
        MasterFiles: {
            Customers: [
                // Dados dos clientes
                { CustomerID: "1", CustomerTaxID: "123456789", CustomerName: "Cliente Exemplo 1" },
                { CustomerID: "2", CustomerTaxID: "987654321", CustomerName: "Cliente Exemplo 2" }
            ],
            Suppliers: [
                // Dados dos fornecedores
                { SupplierID: "1", SupplierTaxID: "987654321", SupplierName: "Fornecedor Exemplo 1" },
                { SupplierID: "2", SupplierTaxID: "123456789", SupplierName: "Fornecedor Exemplo 2" }
            ]
        },
        GeneralLedgerEntries: {
            // Entradas do livro-razão
            Journal: [
                // Exemplo de uma entrada do livro-razão
                {
                    TransactionID: "1",
                    TransactionDate: "2024-03-15",
                    TransactionType: "SAFT_PT",
                    TransactionDescription: "Exemplo de transação SAFT",
                    GLAccount: "1234",
                    DebitAmount: "100.00",
                    CreditAmount: "0.00",
                    SourceID: "1",
                    SystemEntryDate: new Date().toISOString()
                }
            ]
        },
        SourceDocuments: {
            // Documentos de origem (faturas, recibos, etc.)
            Invoices: [
                // Exemplo de uma fatura
                {
                    InvoiceNo: "123",
                    InvoiceDate: "2024-03-15",
                    CustomerID: "1",
                    Line: [
                        // Linhas da fatura
                        { ProductCode: "P1", Quantity: "1", UnitPrice: "50.00", Tax: "23%" },
                        { ProductCode: "P2", Quantity: "2", UnitPrice: "25.00", Tax: "23%" }
                    ]
                }
            ]
        }
    };

    // Criar o XML SAFT
    const xml = create(saftData, { encoding: 'utf-8', noDoubleEncoding: true }).end({ prettyPrint: true });

    return xml;
};

// Função para criptografar os dados com uma chave simétrica AES
function encryptDataWithAES(data, key) {
    const iv = crypto.randomBytes(16); // IV de 16 bytes
    const cipher = crypto.createCipheriv('aes-256-cbc', key, iv);
    let encryptedData = cipher.update(data, 'utf-8', 'base64');
    encryptedData += cipher.final('base64');
    return encryptedData;
}

// Função para criptografar a chave AES com a chave pública RSA
function encryptAESKeyWithRSA(aesKey, publicKeyPath) {
    const publicKey = fs.readFileSync(publicKeyPath, 'utf8');
    const encryptedKey = crypto.publicEncrypt({ key: publicKey, padding: crypto.constants.RSA_PKCS1_OAEP_PADDING }, aesKey);
    return encryptedKey.toString('base64');
}

// Função para escrever o arquivo criptografado no disco
function writeEncryptedSAFTFile(encryptedSAFT, fileName) {
    fs.writeFile(fileName, encryptedSAFT, function(err) {
        if (err) {
            console.error(`Erro ao gravar o arquivo ${fileName}:`, err);
        } else {
            console.log(`Arquivo ${fileName} gravado com sucesso!`);
        }
    });
}

// Geração do par de chaves PEM
const { privateKey, publicKey } = crypto.generateKeyPairSync('rsa', {
    modulusLength: 4096, // Tamanho da chave
    publicKeyEncoding: {
        type: 'spki',
        format: 'pem'
    },
    privateKeyEncoding: {
        type: 'pkcs8',
        format: 'pem'
    }
});

// Escrever as chaves no disco
//fs.writeFileSync('privateKey.pem', privateKey);
//fs.writeFileSync('publicKey.pem', publicKey);

// Função para exportar o arquivo SAFT criptografado
function exportEncryptedSaft() {
    // Geração do arquivo SAFT
    const xmlSAFT = generateSAFT();

    // Gerar uma chave simétrica AES
    const aesKey = crypto.randomBytes(32); // 256 bits

    // Criptografar o conteúdo do arquivo SAFT com a chave AES
    const encryptedSAFT = encryptDataWithAES(xmlSAFT, aesKey);

    // Criptografar a chave AES com a chave pública RSA
    const encryptedAESKey = encryptAESKeyWithRSA(aesKey, 'publicKey.pem');

    // Escrever o arquivo criptografado no disco
    writeEncryptedSAFTFile(encryptedSAFT, 'saft_encrypted.xml');
}

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
    exportEncryptedSaft,
    verifyToken,
    numberFormat,
    formattedToday
};
