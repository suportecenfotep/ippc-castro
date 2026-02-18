<template>
    <!-- Page wrapper start -->
    <div class="page-wrapper">

      <!-- Sidebar wrapper start -->
      <Sidebar/>
      <!-- Sidebar wrapper end -->

      <!-- *************
				************ Main container start *************
			************* -->
      <div class="main-container">

        <!-- Page header starts -->
        <Navbar :page = "'Efectuar Pagamento / '+this.estudante.nome"/>
        <!-- Page header ends -->

        <!-- Content wrapper scroll start -->
        <div class="content-wrapper-scroll">

          <!-- Content wrapper start -->
          <div class="content-wrapper">
            <!-- Row start -->
            <div class="row">
              <div class="col-12">
                  <div class="card">
                      <div class="row p-2">
                          <div class="col-md-3">
                              <label>Ano Lectivo</label><br>
                              <select 
                                class = "form-control"
                                v-model="filter_data.ano_id"
                                >
                                <option
                                    v-for="ano in anos"
                                    :key="ano.id"    
                                    :value="ano.id">
                                {{ano.nome}}    
                                </option>   
                            </select>
                          </div>
                          <div class = "col-md-3">
                              <label class="text-white">.</label><br>
                              <button @click = "searchStudent" class="btn btn-info fw-bold">
                                  <span class="fas fa-search"></span> BUSCAR
                              </button>
                          </div>
                          
                      </div>
                  </div>
              </div>
              <div v-if = "showStudent" class="col-12 mt-0">
                <div class="card">
                 <div class="row p-2">
                     <div class="col-md-4">
                         <h4>Dados Pessoais</h4>
                         <p class="m-1 mw-100 text-truncate">Nome: <b>{{estudante.nome}}</b></p>
                         <p class="m-1">Identificação: <b>{{estudante.identificacao}}</b></p>
                         <p class="m-1">Curso: <b>{{curso}}</b></p>
                         <p class="m-1">Classe: <b>{{classe}}</b></p>
                         <p class="m-1">Turma: <b>{{turma}}</b></p>
                     </div>
                     <div v-if = "showHistory" class="col-md-12">
                         <h4>Historico de Pagamentos</h4>
                         <button class = "btn btn-primary fw-bold text-uppercase" @click="showPaymentForm = true; showHistory = false">
                             <span class="fas fa-database"></span> Pagar
                         </button>
                         <table class="table table-striped">
                             <thead>
                                 <tr>
                                     <th>DESCRIÇÃO</th>
                                     <th>VALOR</th>
                                     <th class = "col-md-5">OPÇÕES</th>
                                 </tr>
                             </thead>
                             <tbody>
                                 <tr
                                    v-for="pagamento in pagamentos"
                                    :key="pagamento.id"
                                    @click="selectRow(pagamento)" :class="{ 'selected': pagamento === selectedRow }"
                                    >
                                    <td class="align-middle">{{ pagamento.numero }}</td>
                                    <td class="align-middle fw-bold">{{ pagamento.itensPagos }}</td>
                                    <td>{{numberFormat(pagamento.totalPrice,2,',','.')}}Kz</td>
                                    <td>
                                        <button 
                                            class="btn btn-primary text-uppercase fw-bold"
                                            @click="gerarComprovativo(pagamento.id)">
                                           <span class = 'fas fa-file-pdf'></span> Comprovativo    
                                        </button>
                                        <button 
                                            class="btn btn-danger mx-2 text-uppercase fw-bold"
                                            @click="deletePagamento(pagamento.id)">
                                           <span class = 'fas fa-trash'></span> Anular   
                                        </button>
                                    </td>
                                 </tr>
                             </tbody>
                         </table>
                     </div>
                     <form @submit.prevent="sendData" v-if = "showPaymentForm" class = "col-md-12">
                        <button class = "btn btn-primary" @click="showPaymentForm = false; showHistory = true">
                            <span class="fas fa-backward"></span> Retroceder
                        </button>
                        <table class="table w-100">
                            <thead>
                                <tr>
                                    <th class="col-md-2">M.PAGAMENTO</th>
                                    <th class="col-md-2">NATUREZA</th>
                                    <th class="col-md-2">EMOLUMENTO</th>
                                    <th class="col-md-2">CURSO</th>
                                    <th class="col-md-2">CLASSE</th>
                                    <th class="col-md-2">PREÇO</th>
                                    <th class="col-md-2">DESCONTO</th>
                                    <th class="col-md-2">MULTA</th>
                                    <th class="col-md-2">REMOVER</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="(input, index) in inputs" :key="index">
                                    <td>
                                        <select
                                            class="form-select"
                                            v-model="inputs[index].metodo_pagamento"
                                            >
                                            <option
                                                v-for="metodo in metodos_pagamento"
                                                :key = "metodo"    
                                                :value = "metodo"  
                                            >{{metodo}}</option>  
                                        </select>
                                    </td>
                                    <td>
                                        <select
                                            class="form-select"
                                            v-model="inputs[index].natureza_id"
                                            @change="getEmolumentos($event.target.value,index)"
                                            >
                                            <option
                                                v-for="natureza in naturezas"
                                                :key = "natureza.id"    
                                                :value = "natureza.id"  
                                            >{{natureza.nome}}</option>  
                                        </select>
                                    </td>
                                    <td>
                                        <select
                                            class="form-select"
                                            v-model="inputs[index].emolumento_id"
                                            >
                                            <option
                                                v-for="emolumento in emolumentos[index]"
                                                :key = "emolumento.id"    
                                                :value = "emolumento.id"  
                                            >{{emolumento.nome}}</option>  
                                        </select>
                                    </td>
                                    <td>
                                        <select
                                            class="form-select"
                                            v-model="inputs[index].curso_id"
                                            >
                                            <option
                                                v-for="curso in cursos"
                                                :key = "curso.id"    
                                                :value = "curso.id"  
                                            >{{curso.nome}}</option>  
                                        </select>
                                    </td>
                                    <td>
                                        <select
                                            class="form-select"
                                            v-model="inputs[index].classe_id"
                                            @change="getEmolumentosPreco(index)"
                                            >
                                            <option
                                                v-for="classe in classes"
                                                :key = "classe.id"    
                                                :value = "classe.id"  
                                            >{{classe.nome}}</option>  
                                        </select>
                                    </td>
                                    <td>
                                        <select
                                            class="form-select"
                                            v-model="inputs[index].preco_id"
                                            >
                                            <option
                                                v-for="preco in precos[index]"
                                                :key = "preco.id"    
                                                :value = "preco.id"  
                                            >{{numberFormat(preco.preco,2,',','.')}}Kz</option>  
                                        </select>
                                    </td>
                                    <td>
                                        <input  
                                            type="number"
                                            class="form-control"
                                            v-model="inputs[index].desconto"
                                        />
                                    </td>
                                    <td>
                                        <input  
                                            type="number"
                                            class="form-control"
                                            v-model="inputs[index].multa"
                                        />
                                    </td>
                                    <td>
                                        <button type="button" @click="removeRow(index)" class="btn btn-danger">
                                            <span class="fas fa-trash"></span>
                                        </button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="d-flex float-end">
                            <button type = "button" @click="addRow" class="btn btn-sm btn-info fw-bold text-uppercase">
                                <span class="fas fa-plus"></span> Adicionar
                            </button>
                            <button type="submit" class="btn btn-sm btn-success mx-2 fw-bold text-uppercase">
                                <span class="fas fa-database"></span> Enviar
                            </button>
                        </div>
                    </form>
                 </div>
                </div>
              </div>
            </div>
            <!-- Row end -->
          </div>
          <!-- Content wrapper end -->

          <!-- App Footer start -->
          <Footer/>
          <!-- App footer end -->

        </div>
        <!-- Content wrapper scroll end -->
        <Loader v-if ="isLoading"/>
      </div>
    </div>
    <!-- Page wrapper end -->
</template>

<script>
    import '../static';
    import Sidebar from '../components/Sidebar.vue';
    import Navbar from '../components/Navbar.vue';
    import Footer from '../components/Footer.vue';
    import Loader from '../components/Loader.vue';
    import {api,url,numberFormat} from '../../../helpers/api';
    //import moment from 'moment';
    import jsPDF from 'jspdf';
    import 'jspdf-autotable';
    import QRious from 'qrious';
    import { mapState } from 'vuex';
    export default{
        name:"pagamento_view",
        components:{Sidebar,Navbar,Footer,Loader},
        data(){
          return{
              title:"Pagamentos",
              selectedRow: null,
              showStudent:false,
              showPaymentForm:false,
              showHistory:false,
              isLoading:false,
              filter_data:{
                ano_id:'',
                estudante_id:'',
              },
              estudante:{},
              registration:{
                ano_id:null,
                curso_id:null,
                sala_id:null,
                estudante_id:null,
                periodo_id:null,
                classe_id:null,
                estado:"Estudando"
              },
              matricula:{},
              curso:'',
              classe:'',
              turma:'',
              pagamento:{
                  descricao:''
              },
              anos:[],
              cursos:[],
              periodos:[],
              inputs: [],
              naturezas:[],
              precos:[],
              emolumentos:[],
              estudantes:[],
              pagamentos:[],
              metodos_pagamento:["Depósito","TPA","Transferência Bancária", "Internet Banking"]
          }
        },
        mounted() {
          this.getAnos();
          this.getCursos();
          this.getClasses();
          this.getNaturezas();
          this.getStudent();
        },
        methods:{
            removeRow(index){
                this.inputs.splice(index, 1);
            },
            addRow(){
               this.inputs.push({
                  metodo_pagamento:'',
                  natureza_id:'',
                  emolumento_id:'',
                  classe_id:'',
                  preco_id:'',
                  desconto:0,
                  multa:0,
              });
            },
            getNaturezas(){
              api
              .get(`/emolumento-natureza/`)
              .then(res => {
                  this.naturezas = res.data;
              })
              .catch(err => {
                  console.log(err)
              })
            },
            numberFormat,
            getEmolumentosPreco(index){
              const { ano_id } = this.filter_data;
              api
              .get(`/emolumento-preco/ano/${ano_id}/curso/${this.inputs[index].curso_id}/classe/${this.inputs[index].classe_id}/natureza/${this.inputs[index].natureza_id}/emolumento/${this.inputs[index].emolumento_id}`)
              .then(res => {
                  this.precos[index] = res.data;
              })
              .catch(err => {
                  console.log(err)
              })
            },
            getEmolumentos(id, index){
              api
              .get(`/emolumentos/natureza/${id}`)
              .then(res => {
                  this.emolumentos[index] = res.data;
              })
              .catch(err => {
                  console.log(err)
              })
            },
            generateComprovativo(id) {
               window.open(`${url}/api/documentos/comprovativo-pagamento/${id}`, "_blank")
            },
           gerarComprovativo(id) {
                this.isLoading = true;
                api.get(`/pagamentos/${id}`)
                    .then(res => {
                        if (res.data) {
                            this.isLoading = false;
                            const self = this;
                            const doc = new jsPDF({ orientation: 'landscape', format: 'a4' });
                            const faturas = res.data.ItensPagamentos;
                            const infoPagamento = res.data;

                            const desenharFatura = (xOffset, titulo, faturas) => {
                                // 1. Logotipo e Cabeçalho - Ajuste de escala para elegância
                                doc.addImage(`${url}/api/mediafiles/castro.jpeg`, 'JPEG', xOffset + 8, 10, 20, 20);
                                
                                doc.setFontSize(8.5);
                                doc.setFont(undefined, 'bold');
                                doc.text(titulo, xOffset + 132, 14);
                                
                                doc.setFont(undefined, 'normal');
                                doc.setFontSize(7.5);
                                doc.text('INSTITUTO POLITÉCNICO PRIVADO CASTRO', xOffset + 32, 13);
                                doc.setFontSize(7);
                                doc.text('NIF: 50002047 | Tel: +244 939 237 968', xOffset + 32, 17);
                                doc.text('Huambo, Estrada Nacional 260, Bomba Baixa', xOffset + 32, 21);
                                doc.text('Email: ippc23@gmail.com', xOffset + 32, 25);
                                
                                // Separador sutil
                                doc.setDrawColor(200);
                                doc.line(xOffset + 10, 32, xOffset + 145, 32);

                                doc.setFont(undefined, 'bold');
                                doc.setFontSize(8.5);
                                doc.text(`FATURA Nº ${infoPagamento.numero}`, xOffset + 10, 40); 
                                
                                doc.setFontSize(7.5);
                                doc.text('DADOS DO ESTUDANTE', xOffset + 10, 47);
                                
                                doc.setFont(undefined, 'normal');
                                doc.setFontSize(7);
                                doc.text(`Nome: ${self.matricula.Estudante.nome}`, xOffset + 10, 52);
                                doc.text(`Curso: ${self.matricula.Curso.nome} | Turma: ${self.matricula.Sala?.nome || "N/M"} | Classe: ${self.matricula.Classe?.nome || "N/M"}`, xOffset + 10, 56);

                                // --- TABELA OTIMIZADA ---
                                const startY = 65;
                                let currentY = startY;
                                const rowH = 5.5; 

                                // Estilo do Cabeçalho da Tabela
                                doc.setFillColor(245, 245, 245);
                                doc.rect(xOffset + 10, currentY - 4, 135, rowH, 'F');
                                doc.rect(xOffset + 10, currentY - 4, 135, rowH); // Borda

                                doc.setFont(undefined, 'bold');
                                const headers = ['Emolumento', 'Preço', 'Desc%', 'Multa%', 'Subtotal'];
                                const xPos = [xOffset+12, xOffset+70, xOffset+92, xOffset+107, xOffset+122];
                                headers.forEach((h, i) => doc.text(h, xPos[i], currentY));
                                
                                doc.setFont(undefined, 'normal');
                                faturas.slice(0, 12).forEach(item => {
                                    currentY += rowH;
                                    const preco = item.EmolumentoPreco.preco;
                                    const subtotal = preco - (preco * (item.desconto / 100)) + (preco * (item.multa / 100));

                                    doc.rect(xOffset + 10, currentY - 4, 135, rowH);
                                    doc.text(item.Emolumento.nome.substring(0, 38), xOffset + 12, currentY);
                                    doc.text(numberFormat(preco.toFixed(2),2,',','.'), xOffset + 70, currentY);
                                    doc.text(item.desconto.toFixed(0) + '%', xOffset + 93, currentY);
                                    doc.text(item.multa.toFixed(0) + '%', xOffset + 108, currentY);
                                    doc.text(numberFormat(subtotal.toFixed(2),2,',','.'), xOffset + 122, currentY);
                                });

                                // --- FOOTER ---
                                const footerY = 152;
                                const total = faturas.reduce((sum, item) => {
                                    const p = item.EmolumentoPreco.preco;
                                    return sum + (p - (p * (item.desconto / 100)) + (p * (item.multa / 100)));
                                }, 0);

                                doc.setFontSize(7);
                                doc.text('COORDENADAS BANCÁRIAS: YETU', xOffset + 10, footerY);
                                doc.text('Nº CONTA: 183361410001', xOffset + 10, footerY + 4);
                                
                                doc.setFont(undefined, 'bold');
                                doc.setFontSize(8);
                                doc.text('Total Geral:', xOffset + 95, footerY + 8);
                                doc.text(`${numberFormat(total.toFixed(2),2,',','.')} AOA`, xOffset + 115, footerY + 8);

                                // QR CODE (Reduzido e com Logo AGT menor)
                                const qrSize = 20;
                                const qr = new QRious({
                                    value: `https://www.agt.minfin.gov.ao/|52E9|${infoPagamento.numero}|${total.toFixed(2)}`,
                                    size: 100,
                                    level: 'H'
                                });
                                
                                const qrX = xOffset + 10;
                                const qrY = footerY + 12;
                                doc.addImage(qr.toDataURL(), 'PNG', qrX, qrY, qrSize, qrSize);
                                
                                // Logo AGT reduzido para não atrapalhar o scanner (5x5mm)
                                const logoSize = 5;
                                const logoOffset = (qrSize - logoSize) / 2;
                                doc.addImage(`${url}/api/mediafiles/AGT.png`, 'PNG', qrX + logoOffset, qrY + logoOffset, logoSize, logoSize);

                                doc.setFont(undefined, 'normal');
                                doc.setFontSize(6);
                                doc.text(`52E9-Processado por Programa Certificado nº 330/AGT/2021`, xOffset + 32, qrY + 18);

                                const hoje = new Date();
                                doc.setFontSize(7);
                                const dataStr = `Huambo, ${hoje.getDate()}/${hoje.getMonth() + 1}/${hoje.getFullYear()}`;
                                doc.text(dataStr, xOffset + 10, footerY + 40);
                                doc.text(`Operador: ${this.$store.state.user.nome}`, xOffset + 10, footerY + 44);
                                
                                doc.setDrawColor(150);
                                doc.line(xOffset + 10, footerY + 48, xOffset + 70, footerY + 48);
                            };

                            desenharFatura(142, 'ORIGINAL', faturas);
                            desenharFatura(0, '2ª VIA', faturas);
                            doc.output('dataurlnewwindow');
                        }
                    })
                    .catch(err => {
                        this.isLoading = false;
                        console.error(err);
                    });
            },
            getAnos(){
              api
              .get(`/anos/status/1/`)
              .then(res => {
                  this.anos = res.data;
              })
              .catch(err => {
                  console.log(err)
              })
            },
            getCursos(){
              api
              .get(`/cursos/`)
              .then(res => {
                  this.cursos = res.data;
              })
              .catch(err => {
                  console.log(err)
              })
            },
            getSalas(){
              api
              .get(`/salas/categoria/1/`)
              .then(res => {
                  this.salas = res.data;
              })
              .catch(err => {
                  console.log(err)
              })
            },
            getClasses(){
              api
              .get(`/classes/`)
              .then(res => {
                  this.classes = res.data;
              })
              .catch(err => {
                  console.log(err)
              })
            },
            getPeriodos(){
              api
              .get(`/periodos/`)
              .then(res => {
                  this.periodos = res.data;
              })
              .catch(err => {
                  console.log(err)
              })
            },
            getMatricula(estudante_id){
                api
                .get(`/matricula/estudante/${estudante_id}/estado/Estudando`)
                .then(res => {
                    if(res.data === null){
                        this.curso = "N/Atribuido"
                        this.classe = "N/Atribuida"
                    }else{
                        this.matricula = res.data;
                        this.curso = res.data.Curso.nome
                        this.classe = res.data.Classe.nome
                        this.turma = res.data.Sala.nome
                    }
                })
                .catch(err => {
                    console.log(err)
                })
            },
            getPagamentos(estudante_id){
                api
                .get(`/pagamentos/ano/${this.filter_data.ano_id}/estudante/${estudante_id}/`)
                .then(res => {
                    this.pagamentos = res.data;
                    this.showHistory = true;
                })
                .catch(err => {
                    console.log(err)
                })
            },
            getStudent(){
              api
              .get(`/estudantes/${this.$route.params.estudante_id}`)
              .then(res => {
                  if(res.data != null){
                    this.estudante = res.data;
                    this.registration.estudante_id = res.data.id
                    this.showStudent = true;
                  }else{
                    this.$swal.fire({
                      title:"Notificação",
                      icon:"warning",
                      text:"Nenhum Estudante Encontrado"
                    })
                    this.showStudent = false;
                    this.showPaymentForm = false;
                  }
              })
              .catch(err => {
                  console.log(err)
              })
            },
            searchStudent(){
                this.getMatricula(this.$route.params.estudante_id)
                this.getPagamentos(this.$route.params.estudante_id)
            },
            sendData(e){
                e.preventDefault()
                const pagamento = {
                    ...this.pagamento,
                    ano_id:this.filter_data.ano_id,
                    estudante_id:this.estudante.id,
                    user_id:this.$store.state.user.id,
                    nome:this.$store.state.user.nome,
                    itens:this.inputs
                }
                api
                .post("/pagamentos/", pagamento)
                .then(res => {
                    if(res.data.data.id > 0){
                        this.$swal.fire({
                          title:"Sucesso",
                          text:res.data.message,
                          backdrop:false,
                          icon:"success"
                        })
                        .then(() => {
                            this.$swal.fire({
                                title:"Mensagem",
                                icon:"question",
                                text:"Deseja retirar o comprovativo ?",
                                confirmButtonText:"Sim",
                                showCancelButton:true,
                                cancelButtonText:"Não"
                            })
                            .then(result => {
                                if(result.isConfirmed){ 
                                    this.gerarComprovativo(res.data.data.id)
                                }
                            })
                        })
                        this.showPaymentForm = false;
                        this.pagamento = {}
                        this.searchStudent()
                        this.inputs = []
                    }else{
                        this.$swal.fire({
                          title:"Erro",
                          text:"Não foi possível cadastrar",
                          icon:"error"
                        })
                    }
                })
                .catch(err => {
                  console.log(err)
                    this.$swal.fire({
                      title:"Erro",
                      icon:"error",
                      text:err.response.data.message
                    })
                    .then(() => {
                      this.showPaymentForm = false;
                    })
                })
            },
            deletePagamento(id){
                this.$swal.fire({
                    title:"Notificação",
                    icon:'question',
                    text:`Deseja anular este pagamento ?`,
                    confirmButtonText:'Sim',
                    showCancelButton:true,
                    cancelButtonText:'Não',
                })
                .then(result => {
                    if(result.isConfirmed){
                        api
                        .delete(`/pagamentos/${id}`)
                        .then(res => {
                            if(res.data.message){
                                this.$swal.fire({
                                title:res.data.message,
                                icon:"success"
                                })
                                this.searchStudent();
                            }else{
                                this.$swal.fire({
                                title:"Erro: Não foi possível excluir",
                                icon:"error"
                                })
                            }
                        })
                        .catch(err => {
                            console.log(err)
                        })
                    }
                })
            },
            selectRow(row) {
               this.selectedRow = row;
               console.log(row)
            },
        },
        computed:{
            ...mapState(['user'])
        }
    }

</script>

<style>
.selected {
  background-color: blue; 
}
</style>