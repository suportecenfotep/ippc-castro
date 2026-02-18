import axios from 'axios';
import io from "socket.io-client";
import store from '@/store';
//const url = "http://192.168.8.73:9000";
const url = "https://app-7b9316ca-5f5b-46f1-b88e-7f3b291c1eb2.cleverapps.io";

const fd = new FormData();

const parsedData = JSON.parse(localStorage.getItem("usuario"));
const userData = parsedData;

const api = axios.create({
  baseURL: url+"/api",
});

api.interceptors.request.use((config) => {
  const token = store.state.token;
  
  if (token) {
    config.headers.Authorization = `Bearer ${token}`
  }
  return config
}, (err) => {
  return Promise.reject(err)
})

api.interceptors.response.use((response) => {
  return response
}, (error) => {
  if (error.response.status === 401) {
    window.location = '#/dashboard'
  }

  return Promise.reject(error)
})

const checkLicence = () => {
  api
  .get("/license/read/")
  .then(res => {
    console.log(res.data)
  })
  .catch(err => {
    if(err.response.data.message === "Licença não encontrada"){
      this.$router.push("/licence")
    }else if (err.response.data.message === "Licença Expirada"){
      this.$router.push("/licence")
    }
  })
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

const socket = io(url);

const meses = [
  "Janeiro",
  "Fevereiro",
  "Março",
  "Abril",
  "Maio",
  "Junho",
  "Julho",
  "Agosto",
  "Setembro",
  "Outubro",
  "Novembro",
  "Dezembro"
]

const language = {
  "sEmptyTable": "Nenhum dado disponível na tabela",
  "sInfo": "Mostrando _START_ até _END_ de _TOTAL_ entradas",
  "sInfoEmpty": "Mostrando 0 até 0 de 0 entradas",
  "sInfoFiltered": "(filtrado de _MAX_ entradas totais)",
  "sInfoPostFix": "",
  "sInfoThousands": ".",
  "sLengthMenu": "Mostrar _MENU_ registros",
  "sLoadingRecords": "Carregando...",
  "sProcessing": "Processando...",
  "sSearch": "Procurar:",
  "sZeroRecords": "Nenhum registro encontrado",
  "oPaginate": {
    "sFirst": "Primeiro",
    "sLast": "Último",
    "sNext": "Próximo",
    "sPrevious": "Anterior"
  },
  "oAria": {
    "sSortAscending": ": ativar para classificar a coluna em ordem crescente",
    "sSortDescending": ": ativar para classificar a coluna em ordem decrescente"
  }
}

export {api,url,fd,userData,numberFormat,socket,meses,checkLicence,language};