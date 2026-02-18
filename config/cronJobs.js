const cron = require('node-cron');
const { License } = require("../models/Model");
const moment = require('moment');

// Função para verificar e truncar licenças expiradas
const checkAndTruncateLicenses = async () => {
    try {
        const licenses = await License.findAll();

        for (let license of licenses) {
            if (moment().isAfter(license.expirationDate)) {
                console.log(`Licença expirada: ${license.licenseKey}`);
                await License.truncate();  // Truncate the License table
                console.log("Tabela de licenças truncada.");
                return;  // Saia do loop após truncar
            }
        }
    } catch (err) {
        console.error("Erro ao verificar licenças expiradas:", err);
    }
};

// Agendar a tarefa para rodar diariamente à meia-noite
cron.schedule('0 0 * * *', checkAndTruncateLicenses);

console.log("Cron job agendado para verificar licenças expiradas diariamente à meia-noite.");
