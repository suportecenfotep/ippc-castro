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
        <Navbar page = "Secretaria / Matricular Estudante"/>
        <!-- Page header ends -->

        <!-- Content wrapper scroll start -->
        <div class="content-wrapper-scroll">

          <!-- Content wrapper start -->
          <div class="content-wrapper">
            <!-- Row start -->
            <div class="row">
              <div v-if = "showStudent" class="col-12 mt-0">
                <div class="card">
                 <div class="row p-2">
                     <div class="col-md-2 pt-1">
                         <img 
                            src = "../assets/images/avatar.svg"
                            class="w-100"    
                        />
                     </div>
                     <div class="col-md-4">
                         <h4>Dados Pessoais</h4>
                         <p class="m-1">Nome: <b>{{estudante.nome}}</b></p>
                         <p class="m-1">Identificação: <b>{{estudante.identificacao}}</b></p>
                         <p class="m-1">Local de Emissão do Bilhete: <b>{{estudante.local_emissao_identificacao}}</b></p>
                         <p class="m-1">Gênero: <b>{{estudante.genero}}</b></p>
                         <p class="m-1">Estado Civil: <b>{{estudante.estado_civil}}</b></p>
                         <p class="m-1">Idade: <b>{{new Date().getFullYear() - moment(estudante.data_de_nascimento).format("YYYY")}}</b></p>
                     </div>
                     <div class="col-md-4">
                         <h4>Outras Informações</h4>
                         <p class="m-1">Língua de Opção: <b>{{estudante.lingua_opcao}}</b></p>
                         <p class="m-1">Telefone: <b>{{estudante.telefone}}</b></p>
                         <p class="m-1">Encarregado: <b>{{estudante.encarregado}}</b></p>
                         <p class="m-1">Contacto: <b>{{estudante.contacto_encarregado}}</b></p>
                         <p class="m-1">Residência: <b>{{estudante.residencia}}</b></p>
                         <p class="m-1">Data de Nascimento: <b>{{moment(estudante.data_de_nascimento).format("DD - MM - YYYY")}}</b></p>
                     </div>
                 </div>
                </div>
              </div>
              <div v-if = "showRegistration" class = "col-12">
                  <div class="card p-2">
                      <div class="card-header p-0">
                          <h4 class="card-title text-uppercase fw-bold">Matricular Estudante</h4>
                      </div>
                      <div class="row">
                        <div class = "col-md-6">
                              <label>Curso</label><br>
                              <select
                                class="form-select"
                                 v-model="registration.curso_id"
                                >
                                <option
                                  v-for="curso in cursos"
                                  :key="curso.id"
                                  :value="curso.id">{{curso.nome}}</option>
                              </select>
                          </div>
                          <div class = "col-md-6">
                              <label>Ano</label><br>
                              <select
                                class="form-select"
                                v-model="registration.ano_id"
                                >
                                <option
                                  v-for="ano in anos"
                                  :key="ano.id"
                                  :value="ano.id">{{ano.nome}}</option>
                              </select>
                          </div>
                           <div class = "col-md-6">
                              <label>Período</label><br>
                              <select
                                class="form-select"
                                v-model="registration.periodo_id"
                                >
                                <option
                                  v-for="periodo in periodos"
                                  :key="periodo.id"
                                  :value="periodo.id">{{periodo.nome}}</option>
                              </select>
                          </div>
                          <div class = "col-md-6">
                              <label>Classe</label><br>
                              <select
                                class="form-select"
                                 v-model="registration.classe_id"
                                 @change = "getSalas"
                                >
                                <option
                                  v-for="classe in classes"
                                  :key="classe.id"
                                  :value="classe.id">{{classe.nome}}</option>
                             </select>
                          </div>
                          <div class = "col-md-12">
                              <label>Turma</label><br>
                              <select
                                class="form-select"
                                 v-model="registration.sala_id"
                                >
                                <option
                                  v-for="sala in salas"
                                  :key="sala.id"
                                  :value="sala.id">{{sala.nome}}</option>
                              </select>
                          </div>
                          <div class = "col-md-4 pt-2">
                              <button @click = "submitForm" class="btn btn-primary fw-bold">
                                  <span class="fas fa-database"></span> MATRICULAR
                              </button>
                          </div>
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
    import {api, url} from '../../../helpers/api';
    import moment from 'moment';
    export default{
        name:"matricula_view",
        components:{Sidebar,Navbar,Footer},
        data(){
          return{
              title:"Matricula",
              dataTable:null,
              selectedRow: null,
              showStudent:false,
              showRegistration:false,
              filter_data:{
                estudante_id:''
              },
              estudante:{},
              matricula:{},
              registration:{
                ano_id:null,
                curso_id:null,
                sala_id:null,
                estudante_id:null,
                periodo_id:null,
                classe_id:null,
                estado:"Estudando"
              },
              anos:[],
              cursos:[],
              periodos:[],
              estudantes:[],
              salas:[],
              classes:[],
          }
        },
        mounted() {
          this.getAnos();
          this.getCursos();
          this.getPeriodos();
          this.getClasses();
          this.getEstudantes();
          this.getStudent();
        },
        methods:{
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
            const { periodo_id, curso_id, classe_id } = this.registration;
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
              .get(`/estudantes/${this.$route.params.estudante_id}`)
              .then(res => {
                  if(res.data != null){
                    this.estudante = res.data;
                    this.registration.estudante_id = res.data.id
                    this.registration.curso_id = res.data.curso_id
                    this.showStudent = true;
                    this.showRegistration = true;
                  }else{
                    this.$router.push("/admin/secretaria/estudante")
                    this.showStudent = false;
                    this.showRegistration = false;
                  }
              })
              .catch(err => {
                  console.log(err)
              })
            },
            moment,
            generatePDF(data) {
              window.open(`${url}/api/documentos/boletim-matricula/${data}/`, "_blank") 
            },
            submitForm(){
              const form = {
                ...this.registration,
                user_id:this.$store.state.user.id,
                nome:this.$store.state.user.nome
              }
                api
                .post("/matricula/", form)
                .then(res => {
                    if(res.data.data.id > 0){
                        this.$swal.fire({
                          title:"Sucesso",
                          text:res.data.message,
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
                                  this.generatePDF(res.data.data.id)
                                }
                            })
                        })
                        this.registration = {
                          estado:"Estudando"
                        };
                        this.showStudent = true;
                        this.showRegistration = true;
                        this.registration = {};
                        this.getStudent();
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
                })
            },
            deleteForm(){
                api
                .delete(`/estudantes/${this.candidate.id}`)
                .then(res => {
                    if(res.data.message){
                        this.$swal.fire({
                          title:res.data.message,
                          icon:"success"
                        })
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
            getEstudantes(){
                api
                .get(`/estudantes/`)
                .then(res => this.estudantes = res.data)
                .catch(err => {
                    console.log(err)
                })
            },
            selectRow(row) {
               this.selectedRow = row;
               this.candidate = row;
               this.getMaritalState();
            },
            clearForm(){
                this.candidate = {};
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
    }

</script>

<style>
.selected {
  background-color: blue; 
}
</style>