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
        <Navbar page = "Secretaria / Lista de devedores"/>
        <!-- Page header ends -->

        <!-- Content wrapper scroll start -->
        <div class="content-wrapper-scroll">

          <!-- Content wrapper start -->
          <div class="content-wrapper">

            <!-- Row start -->
            <div class="row">
              <div class="col-12">
                <div class="card">
                  <div class="card-body">
                      <div class="row mb-2">
                          <div class="col-md-3">
                              <label>Selecione o Ano</label><br>
                              <select
                                class="form-select"
                                v-model = "filter_data.ano_id"
                                >
                                    <option
                                        v-for = "ano in anos"
                                        :key = "ano.id"
                                        :value = "ano.id"
                                        >
                                    {{ano.nome}}
                                    </option>
                                </select>
                          </div>
                          <div class="col-md-3">
                              <label>Selecione o Curso</label><br>
                              <select
                                class="form-select"
                                v-model = "filter_data.curso_id"
                                @change="getSalas"
                                >
                                    <option
                                        v-for = "curso in cursos"
                                        :key = "curso.id"
                                        :value = "curso.id"
                                        >
                                    {{curso.nome}}
                                    </option>
                                </select>
                          </div>
                           <div class="col-md-3">
                              <label>Selecione o Periodo</label><br>
                              <select
                                class="form-select"
                                v-model = "filter_data.periodo_id"
                                @change="getSalas"
                                >
                                    <option
                                        v-for = "periodo in periodos"
                                        :key = "periodo.id"
                                        :value = "periodo.id"
                                        >
                                    {{periodo.nome}}
                                    </option>
                                </select>
                          </div>
                          <div class="col-md-3">
                              <label>Selecione a Classe</label><br>
                              <select
                                class="form-select"
                                v-model = "filter_data.classe_id"
                                @change = "getSalas"
                                >
                                    <option
                                        v-for = "classe in classes"
                                        :key = "classe.id"
                                        :value = "classe.id"
                                        >
                                    {{classe.nome}}
                                    </option>
                                </select>
                          </div>
                          <div class="col-md-3">
                              <label>Selecione a Turma</label><br>
                              <select
                                class="form-select"
                                v-model = "filter_data.sala_id"
                                >
                                    <option
                                        v-for = "sala in salas"
                                        :key = "sala.id"
                                        :value = "sala.id"
                                        >
                                    {{sala.nome}}
                                    </option>
                                </select>
                          </div>
                          <div class="col-md-3">
                              <label>Tipo de Emolumento</label><br>
                              <select
                                class="form-select"
                                v-model = "filter_data.natureza_id"
                                @change = "getEmolumentos"
                                >
                                    <option
                                        v-for = "natureza in naturezas"
                                        :key = "natureza.id"
                                        :value = "natureza.id"
                                        >
                                    {{natureza.nome}}
                                    </option>
                                </select>
                          </div>
                          <div class="col-md-3">
                              <label>Emolumento</label><br>
                              <select
                                class="form-select"
                                v-model = "filter_data.emolumento_id"
                                >
                                    <option
                                        v-for = "emolumento in emolumentos"
                                        :key = "emolumento.id"
                                        :value = "emolumento.id"
                                        >
                                    {{emolumento.nome}}
                                    </option>
                                </select>
                          </div>
                          <div class="col-md-5 d-flex">
                            <div>
                              <label class="text-white">.</label><br>
                              <button @click="getDevedores" class = "btn btn-primary btn-sm mx-1 fw-bold d-flex align-items-center p-2 rounded-3 border-0 text-uppercase">
                                <span style="font-size:22px" class = "fas fa-search mx-1"></span> Pesquisar
                              </button>
                            </div>
                            <div v-if="devedores.length > 0">
                              <label class="text-white">.</label><br>
                               <button @click="generatePDF" class = "btn btn-danger btn-sm mx-1 fw-bold d-flex align-items-center p-2 rounded-3 border-0 text-uppercase">
                                <span style="font-size:22px" class = "fas fa-file-pdf mx-1"></span> imprimir
                               </button>
                            </div>
                          </div>
                      </div>
                      <DataTable 
                      ref="table"
                      :data = "devedores" 
                      :columns = "columns" 
                      :options="{ select: true, language:language }"
                      class="display table table-striped table-bordered">
                        <thead>
                          <tr class = "bg-secondary">
                            <th>NOME</th>
                            <th>IDENTIFICAÇÃO</th>
                            <th>TELEFONE</th>
                            <th>ENCARREGADO</th>
                            <th>CONTACTO</th>
                          </tr>
                        </thead>
                      </DataTable>

                  </div>
                </div>
              </div>
            </div>
            <!-- Row end -->

            <div class="modal fade" id = "removeForm">
                <div class="modal-dialog rounded-0">
                    <div class="modal-content rounded-0">
                        <div class="modal-header">
                           <h4>{{title}}</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <p>
                                    Deseja excluir  <b>{{matricula.nome}}</b> definitivamente da base de dados?
                                </p>
                            </div>
                        </div>
                        <div class="modal-footer border-0 pt-0">
                            <button class="btn btn-secondary rounded-0" data-bs-dismiss = "modal">Fechar</button>
                            <button @click="deleteForm" class="btn btn-primary rounded-0">Confirmar</button>
                        </div>
                    </div>
                </div>
            </div>

          </div>
          <!-- Content wrapper end -->

          <!-- App Footer start -->
          <Footer/>
          <!-- App footer end -->

        </div>
        <!-- Content wrapper scroll end -->

      </div>
    </div>
    <!-- Page wrapper end -->
</template>

<script>
    import $ from 'jquery';
    import '../static';
    import Sidebar from '../components/Sidebar.vue';
    import Navbar from '../components/Navbar.vue';
    import Footer from '../components/Footer.vue';
    import { api, language, url } from '../../../helpers/api';
    import DataTable from 'datatables.net-vue3';
    import DataTablesCore from 'datatables.net';
    import Select from 'datatables.net-select';
    import jsPDF from 'jspdf';
    import 'jspdf-autotable';

    DataTable.use(DataTablesCore);
    DataTable.use(Select);

    export default{
        name:"matricula_view",
        components:{Sidebar,Navbar,Footer,DataTable},
        data(){
          return{
              title:"Matrícula",
              dataTable:null,
              selectedRow: null,
              devedores:[],
              estudantes:[],
              anos:[],
              cursos:[],
              periodos:[],
              salas:[],
              classes:[],
              naturezas:[],
              emolumentos:[],
              matricula:{
                  id:null,
                  Estudante:{},
                  estudante_id:'',
              },
              filter_data:{
                  ano_id:'',
                  curso_id:'',
                  sala_id:'',
                  periodo_id:'',
                  classe_id:'',
                  natureza_id:'',
                  emolumento_id:'',
              },
              columns: [
                  { 
                    data: null,
                    render:(data) => {
                      return `${data.nome}`
                    }
                  },
                  { 
                    data: null,
                    render:(data) => {
                      return `${data.identificacao}`
                    }
                  },
                  { 
                    data: null,
                    render:(data) => {
                      return `${data.telefone}`
                    }
                  },
                  { 
                    data: null,
                    render:(data) => {
                      return `${data.encarregado}`
                    }
                  },
                  { 
                    data: null,
                    render:(data) => {
                      return `${data.contacto_encarregado}`
                    }
                  },
              ],
              language:language
          }
        },
        mounted() {
          this.getEstudantes();
          this.getAnos();
          this.getCursos();
          this.getPeriodos();
          this.getClasses();
          this.getNaturezas();
        },
        methods:{
            getNaturezas() {
              api.get(`/emolumento-natureza/`)
                .then(res => {
                  this.naturezas = res.data;
                })
                .catch(err => {
                  console.log(err);
                });
            },
            getEmolumentos() {
              const { natureza_id } = this.filter_data;
              api.get(`/emolumentos/natureza/${natureza_id}`)
                .then(res => {
                  this.emolumentos = res.data;
                })
                .catch(err => {
                  console.log(err);
                });
            },
            getDevedores(){
              const {ano_id,sala_id,emolumento_id} = this.filter_data;
              api
              .get(`/fluxo-de-caixa/devedores/ano/${ano_id}/turma/${sala_id}/emolumento/${emolumento_id}`)
              .then(res => {
                  this.devedores = res.data;
              })
              .catch(err => {
                  console.log(err)
              })
            },
            getEstudantes(){
              api
              .get(`/estudantes/`)
              .then(res => {
                  this.estudantes = res.data;
              })
              .catch(err => {
                  console.log(err)
              })
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
            const { periodo_id, curso_id, classe_id } = this.filter_data;
              api
              .get(`/salas/curso/${curso_id}/classe/${classe_id}/periodo/${periodo_id}`)
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
            getStudent(){
              api
              .get(`/inscricao/numero/${this.filter_data.numero}`)
              .then(res => {
                  if(res.data != null){
                    this.estudante = res.data;
                    this.registration.estudante_id = res.data.id
                    this.showStudent = true;
                    this.showRegistration = true;
                  }else{
                    this.$swal.fire({
                      title:"Notificação",
                      icon:"warning",
                      text:"Nenhum Estudante Encontrado"
                    })
                    this.showStudent = false;
                    this.showRegistration = false;
                  }
              })
              .catch(err => {
                  console.log(err)
              })
            },
            submitForm(){
                const form = {
                    ...this.matricula,
                    ...this.filter_data,
                    user_id:this.$store.state.user.id,
                  estado:'Estudando',
                }
              if(this.matricula.id > 0){
                api
                .put(`/matricula/${this.matricula.id}`, form)
                .then(res => {
                    if(res.data.message){
                        this.$swal.fire({
                          title:res.data.message,
                          icon:"success"
                        })
                        this.gerarComprovativo(res.data.data.id, res.data.data.curso_id)
                        this.getdevedores();
                        $(".btn-secondary").click()
                    }else{
                        this.$swal.fire({
                          title:"Erro: Não foi possível atualizar",
                          icon:"error"
                        })
                    }
                })
                .catch(err => {
                     this.$swal.fire({
                      title:"Erro",
                      icon:"error",
                      text:err.response.data.message
                    })
                })
              }else{
                api
                .post("/matricula/", form)
                .then(res => {
                    if(res.data.data.id > 0){
                        this.$swal.fire({
                          title:res.data.message,
                          icon:"success"
                        })
                        this.gerarComprovativo(res.data.data.id, res.data.data.curso_id)
                        this.getdevedores();
                        $(".btn-secondary").click()
                    }else{
                        this.$swal.fire({
                          title:"Erro: Não foi possível cadastrar",
                          icon:"error"
                        })
                    }
                })
                .catch(err => {
                     this.$swal.fire({
                      title:"Erro",
                      icon:"error",
                      text:err.response.data.message
                    })
                })
              }
            },
            deleteForm(){
                api
                .delete(`/matricula/${this.matricula.id}`)
                .then(res => {
                    if(res.data.message){
                        this.$swal.fire({
                          title:res.data.message,
                          icon:"success"
                        })
                        this.getdevedores();
                        $(".btn-secondary").click()
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
            },
            selectRow() {
                const table = this.$refs.table.dt;
                const self = this;
                
                table.rows({ selected: true }).every(function () {
                    const data = this.data();
                    self.matricula = data;
                });
            },

            clearForm(){
                this.matricula = {};
            },
            generatePDF() {
                let num = 1;
                const doc = new jsPDF();
                const columns = [
                    { header: 'Nº', dataKey: 'id' },
                    { header: 'NOME DO ESTUDANTE', dataKey: 'estudante' },
                    { header: 'ENCARREGADO', dataKey: 'encarregado' },
                    { header: 'CONTACTO', dataKey: 'contacto_encarregado' }
                ];
                const rows = this.devedores.map(item => ({
                    id: num++,
                    estudante: item.nome,
                    encarregado: item.encarregado,
                    contacto_encarregado: item.contacto_encarregado,
                }));
                
                // Adicionar o logotipo
                doc.addImage(`${url}/api/mediafiles/castro.jpeg`, 'JPEG', 90, 15, 25, 25); 
                // Adicionar o cabeçalho com informações da empresa
                doc.setFontSize(12);
                doc.text('INSTITUTO POLITÉCNICO PRIVADO CASTRO', 58, 50);
                doc.text('"A Luz do Saber"', 85, 56);
                // Adicionar o título do relatório
                doc.setFontSize(14);
                doc.text('RELAÇÃO NOMINAL DE ESTUDANTES COM PAGAMENTOS EM ATRASO', 20, 64);

                // Calcular a altura da tabela e a posição de início
                const marginTop = 70;
                let startY = marginTop;

                // Adicionar a tabela
                doc.autoTable(columns, rows, {
                    startY: startY,
                    theme: 'grid',
                    didDrawPage: function (data) {
                        // Ajustar a posição do início da tabela para a próxima página
                        startY = data.cursor.y + 10; // 10 é uma margem adicional, ajuste conforme necessário
                    }
                });

                // Gerar o PDF
                doc.output('dataurlnewwindow');
            }


        },
         watch: {
          dataTable: {
            handler() {
              this.selectedRow = null;
             },
            deep: true
           }
         },
    }

</script>

<style>
@import 'datatables.net-bs5';
</style>
