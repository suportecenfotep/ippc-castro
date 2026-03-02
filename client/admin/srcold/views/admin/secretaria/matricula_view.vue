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
        <Navbar page = "Secretaria / Estudantes Matriculados"/>
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
                          <div class="col-md-2">
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
                          <div class="col-md-2">
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
                           <div class="col-md-2">
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
                          <div class="col-md-2">
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
                          <div class="col-md-2">
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
                          <div class = "col-md-2">
                              <label class="text-white">.</label><br>
                              <button @click="getMatriculados" class = "btn btn-primary btn-sm mx-1 fw-bold d-flex align-items-center p-2 rounded-3 border-0 text-uppercase">
                                <span style="font-size:22px" class = "fas fa-search mx-1"></span> Pesquisar
                              </button>
                          </div>
                          <div class="col-md-8 d-flex ps-2 pb-0">
                            <div v-if = "matriculados.length > 0">
                              <label class="text-white">.</label><br>
                               <button @click="generatePDF" class = "btn btn-info btn-sm mx-1 fw-bold d-flex align-items-center p-2 rounded-3 border-0 text-uppercase">
                                <span style="font-size:22px" class = "fas fa-file-pdf mx-1"></span> lista 
                               </button>
                            </div>
                            <div v-if = "matriculados.length > 0 && user.nivel === 'Administrador' || user.nivel === 'IT' || user.nivel === 'Secretaria'">
                              <label class="text-white">.</label><br>
                               <button @click="generateComprovativo" class = "btn btn-info btn-sm mx-1 fw-bold d-flex align-items-center p-2 rounded-3 border-0 text-uppercase">
                                <span style="font-size:22px" class = "fas fa-file-pdf mx-1"></span> comprovativo
                               </button>
                            </div>
                            <div v-if = "matriculados.length > 0 && user.nivel === 'Administrador' || user.nivel === 'IT' || user.nivel === 'Secretaria'">
                              <label class="text-white">.</label><br>
                              <button @click = "selectRow" data-bs-toggle = "modal" data-bs-target = "#removeForm" class = "btn btn-danger btn-sm mx-1 fw-bold d-flex align-items-center p-2 rounded-3 border-0 text-uppercase">
                                <span class = "fas fa-trash mx-1 fs-5"></span> Excluir
                              </button>
                            </div>
                            <div v-if = "matriculados.length > 0 && user.nivel === 'Administrador' || user.nivel === 'IT' || user.nivel === 'Secretaria'">
                              <label class="text-white">.</label><br>
                              <button style = "background: black" @click = "selectRow" data-bs-toggle = "modal" data-bs-target = "#cancelRegistration" class = "btn btn-dark btn-sm mx-1 fw-bold d-flex align-items-center p-2 rounded-3 border-0 text-uppercase">
                                <span class = "fas fa-user-slash mx-1 fs-5"></span> Anular
                              </button>
                            </div>
                            <div v-if = "matriculados.length > 0 && user.nivel === 'Administrador' || user.nivel === 'IT' || user.nivel === 'Secretaria'">
                              <label class="text-white">.</label><br>
                              <button @click = "selectRow" data-bs-toggle = "modal" data-bs-target = "#updateState" class = "btn btn-dark btn-sm mx-1 fw-bold d-flex align-items-center p-2 rounded-3 border-0 text-uppercase">
                                <span class = "fas fa-user mx-1 fs-5"></span> Atualizar
                              </button>
                            </div>
                            <div v-if = "matriculados.length > 0 && user.nivel === 'Administrador' || user.nivel === 'IT' || user.nivel === 'Secretaria'">
                              <label class="text-white">.</label><br> 
                              <button @click="mapadefaltas" class = "btn btn-info btn-sm mx-1 fw-bold d-flex align-items-center p-2 rounded-3 border-0 text-uppercase">
                                <span style="font-size:22px" class = "fas fa-file-pdf mx-1"></span> Faltas 
                               </button>
                            </div>
                            <div v-if = "matriculados.length > 0 && user.nivel === 'Administrador' || user.nivel === 'IT' || user.nivel === 'Secretaria'">
                              <label class="text-white">.</label><br>
                              <button @click="generateDeclaracao" class = "btn btn-info btn-sm mx-1 fw-bold d-flex align-items-center p-2 rounded-3 border-0 text-uppercase">
                                <span style="font-size:22px" class = "fas fa-file-pdf mx-1"></span> Declaração 
                               </button>
                            </div>
                          </div>
                      </div>
                      <DataTable 
                      ref="table"
                      :data = "matriculados" 
                      :columns = "columns" 
                      :options="{ select: true, language:language }"
                      class="display table table-striped table-bordered">
                        <thead>
                          <tr class = "bg-secondary">
                            <th>NOME</th>
                            <th>IDENTIFICAÇÃO</th>
                            <th>TELEFONE</th>
                            <th>CURSO</th>
                            <th>ESTADO</th>
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
                                    Deseja excluir  <b>{{matricula.Estudante.nome}}</b> definitivamente da base de dados?
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

            <div class="modal fade" id = "cancelRegistration">
                <div class="modal-dialog rounded-0">
                    <div class="modal-content rounded-0">
                        <div class="modal-header">
                           <h4>{{title}}</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <p>
                                    Deseja anular esta matrícula <b>{{matricula.Estudante.nome}}</b> ?
                                </p>
                            </div>
                        </div>
                        <div class="modal-footer border-0 pt-0">
                            <button class="btn btn-secondary rounded-0" data-bs-dismiss = "modal">Fechar</button>
                            <button @click="atualizarEstado" class="btn btn-primary rounded-0">Confirmar</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id = "updateState">
                <div class="modal-dialog rounded-0">
                    <div class="modal-content rounded-0">
                        <div class="modal-header">
                           <h4>{{title}}</h4>
                        </div>
                        <div class="modal-body pt-0">
                            <div class="row">
                              <div class = "col-md-12 mb-2">
                                <label>Turma</label><br>
                                <select
                                  class="form-select"
                                  v-model = "matricula.sala_id">
                                  <option 
                                      v-for = "turma in turmas"
                                      :key = "turma.id"
                                      :value = "turma.id">{{turma.nome}}</option>
                                </select>
                              </div>
                               <div class = "col-md-12">
                                <label>Estado</label><br>
                                <select 
                                  class = "form-select"
                                  v-model = "matricula.estado">
                                    <option 
                                      v-for = "estado in estados"
                                      :key = "estado"
                                      :value = "estado">{{estado}}</option>
                                </select>
                               </div>
                            </div>
                        </div>
                        <div class="modal-footer border-0 pt-0">
                            <button class="btn btn-secondary rounded-0" data-bs-dismiss = "modal">Fechar</button>
                            <button @click="atualizarEstado" class="btn btn-primary rounded-0">Confirmar</button>
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
    import { api, url, language } from '../../../helpers/api';
    import DataTable from 'datatables.net-vue3';
    import DataTablesCore from 'datatables.net';
    import Select from 'datatables.net-select';
    import { mapState } from 'vuex';
    //import moment from 'moment';

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
              matriculados:[],
              estudantes:[],
              anos:[],
              cursos:[],
              periodos:[],
              salas:[],
              turmas:[],
              classes:[],
              user:{},
              estados:["Estudando","Cancelada","Transita","Não Transita"],
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
              },
              columns: [
                  { 
                    data: null,
                    render:(data) => {
                      return data.Estudante === null ? "Não definido" : data.Estudante.nome
                    }
                  },
                  { 
                    data: null,
                    render:(data) => {
                      return data.Estudante === null ? "Não definido" : data.Estudante.identificacao
                    }
                  },
                  { 
                    data: null,
                    render:(data) => {
                      return data.Estudante === null ? "Não definido" : data.Estudante.telefone
                    }
                  },
                  { 
                    data: null,
                    render:(data) => {
                      return `${data.Curso.nome}`
                    }
                  },
                  {
                    data:"estado",
                    render:(data) => {
                      if(data === "Estudando"){
                        return `<b class = "text-secondary">${data}</b>`
                      }

                      else if(data === "Transita"){
                        return `<b class = "text-success">${data}</b>`
                      }

                      else{
                        return `<b class = "text-danger">${data}</b>`
                      }
                    }
                  }
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
          this.getTurmas();
          this.user = this.$store.state.user;
        },
        methods:{
            generatePDF() {
              const {ano_id, curso_id, periodo_id, classe_id, sala_id} = this.filter_data;
              window.open(`${url}/api/documentos/lista-matriculados/ano/${ano_id}/curso/${curso_id}/periodo/${periodo_id}/classe/${classe_id}/sala/${sala_id}`, "_blank")
            },
            mapadefaltas(){
              const {ano_id, curso_id, periodo_id, classe_id, sala_id} = this.filter_data;
              window.open(`${url}/api/documentos/mapa-de-faltas/ano/${ano_id}/curso/${curso_id}/periodo/${periodo_id}/classe/${classe_id}/sala/${sala_id}`, "_blank")
            },
            getMatriculados(){
              const {ano_id,sala_id} = this.filter_data;
              api
              .get(`/matricula/ano/${ano_id}/turma/${sala_id}/`)
              .then(res => {
                  if(res.data.length > 0){
                    this.matriculados = res.data;
                  }else{
                    this.matriculados = []
                     this.$swal.fire({
                        title:"Notificação",
                        icon:"warning",
                        text:"Nenhum Estudante Encontrado"
                      })
                  }
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
            getTurmas(){
              api
              .get(`/salas/`)
              .then(res => {
                  this.turmas = res.data;
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
            atualizarEstado(){
                api
                .put(`/matricula/${this.matricula.id}`, this.matricula)
                .then(res => {
                    if(res.data.message){
                        this.$swal.fire({
                          title:res.data.message,
                          icon:"success"
                        })
                        this.getMatriculados();
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
            deleteForm(){
                api
                .delete(`/matricula/${this.matricula.id}`)
                .then(res => {
                    if(res.data.message){
                        this.$swal.fire({
                          title:res.data.message,
                          icon:"success"
                        })
                        this.getMatriculados();
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
            generateComprovativo() {
                const table = this.$refs.table.dt;
                const self = this;
                
                table.rows({ selected: true }).every(function () {
                    const data = this.data();
                    self.matricula = data;
                });

                window.open(`${url}/api/documentos/boletim-matricula/${this.matricula.id}/`, "_blank") 

            },
            generateDeclaracao() {
                const table = this.$refs.table.dt;
                const self = this;
                
                table.rows({ selected: true }).every(function () {
                    const data = this.data();
                    self.matricula = data;
                });

                window.open(`${url}/api/documentos/declaracao-frequencia/${this.matricula.id}/`, "_blank") 

            },
            clearForm(){
                this.matricula = {};
            },
        },
         watch: {
          dataTable: {
            handler() {
              this.selectedRow = null;
             },
            deep: true
           }
         },
         computed:{
          ...mapState(['user'])
         }
    }

</script>

<style>
@import 'datatables.net-bs5';
</style>
