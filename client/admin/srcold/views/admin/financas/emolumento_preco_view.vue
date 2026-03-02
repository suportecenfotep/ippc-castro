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
        <Navbar page = "Tesouraria / Emolumento Preço"/>
        <!-- Page header ends -->

        <!-- Content wrapper scroll start -->
        <div class="content-wrapper-scroll">

          <!-- Content wrapper start -->
          <div class="content-wrapper">

            <!-- Row start -->
            <div class="row">
              <div class="col-12">
                <div class="card">
                  <div class="d-flex p-3">
                    <button @click = "clearForm" data-bs-toggle = "modal" data-bs-target = "#addForm" class = "btn btn-primary btn-sm fw-bold d-flex align-items-center p-2 rounded-3 border-0 text-uppercase">
                      <span class = "fas fa-plus mx-1 fs-5"></span> Adicionar
                    </button>
                     <button v-if = "emolumento_preco.length > 0" @click = "selectRow" data-bs-toggle = "modal" data-bs-target = "#editForm" class = "btn btn-info btn-dark btn-sm mx-1 fw-bold d-flex align-items-center p-2 rounded-3 border-0 text-uppercase">
                      <span class = "fas fa-pencil mx-1 fs-5"></span> Editar
                    </button>
                     <button v-if = "emolumento_preco.length > 0" @click = "selectRow" data-bs-toggle = "modal" data-bs-target = "#removeForm" class = "btn btn-danger btn-sm mx-1 fw-bold d-flex align-items-center p-2 rounded-3 border-0 text-uppercase">
                      <span class = "fas fa-trash mx-1 fs-5"></span> Excluir
                    </button>
                  </div>
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
                              <label>Selecione a Classe</label><br>
                              <select
                                class="form-select"
                                v-model = "filter_data.classe_id"
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
                              <label>Selecione a Natureza</label><br>
                              <select
                                class="form-select"
                                v-model = "filter_data.emolumento_natureza_id"
                                @change="getEmolumentos"
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
                          <div class="col-md-3 d-flex pt-0">
                            <div>
                              <label class="text-white">.</label><br>
                              <button @click="getEmolumentosPreco" class = "btn btn-info btn-sm mx-1 fw-bold d-flex align-items-center p-2 rounded-3 border-0 text-uppercase">
                                <span style="font-size:22px" class = "fas fa-search mx-1"></span> Pesquisar
                              </button>
                            </div>
                          </div>
                      </div>
                      <DataTable 
                      ref="table"
                      :data = "emolumentos_preco" 
                      :columns = "columns" 
                      :options="{ select: true, language:language }"
                      class="display table table-striped table-bordered">
                        <thead>
                          <tr class = "bg-secondary">
                            <th>NOME</th>
                            <th>PREÇO</th>
                            <th>ESTADO</th>
                          </tr>
                        </thead>
                      </DataTable>
                  </div>
                </div>
              </div>
            </div>
            <!-- Row end -->

            <div class="modal fade" id = "addForm">
                <div class="modal-dialog rounded-0">
                    <div class="modal-content rounded-0">
                        <div class="modal-header">
                            <h4>{{title}}</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-12 mb-3">
                                    <label>Emolumento</label><br>
                                    <select 
                                        class = "form-select"
                                        v-model = "emolumento_preco.emolumento_id"
                                        >
                                      <option
                                        v-for = "emolumento in emolumentos"
                                        :key = "emolumento.id"    
                                        :value = "emolumento.id"
                                        >{{emolumento.nome}}</option> 
                                    </select>
                                </div>
                                 <div class="col-md-12 mb-3">
                                    <label>Preço</label><br>
                                    <input
                                        type = "text"
                                        class="form-control"
                                        v-model="emolumento_preco.preco"
                                    />
                                </div>
                                <div class="col-md-12 mb-3">
                                    <label>Estado</label><br>
                                    <input
                                        type = "checkbox"
                                        class="form-check"
                                        v-model="emolumento_preco.status"
                                    />
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer border-0 pt-0">
                            <button class="btn btn-secondary rounded-0" data-bs-dismiss = "modal">Fechar</button>
                            <button @click = "submitForm" class="btn btn-primary rounded-0">Enviar</button>
                        </div>
                    </div>
                </div>
            </div>

             <div class="modal fade" id = "editForm">
                <div class="modal-dialog rounded-0">
                    <div class="modal-content rounded-0">
                        <div class="modal-header">
                            <h4>{{title}}</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-12 mb-3">
                                    <label>Emolumento</label><br>
                                    <select 
                                        class = "form-select"
                                        v-model = "emolumento_preco.emolumento_id"
                                        >
                                      <option
                                        v-for = "emolumento in emolumentos"
                                        :key = "emolumento.id"    
                                        :value = "emolumento.id"
                                        >{{emolumento.nome}}</option> 
                                    </select>
                                </div>
                                 <div class="col-md-12 mb-3">
                                    <label>Preço</label><br>
                                    <input
                                        type = "number"
                                        class="form-control"
                                        v-model="emolumento_preco.preco"
                                    />
                                </div>
                                <div class="col-md-12 mb-3">
                                    <label>Estado</label><br>
                                    <input
                                        type = "checkbox"
                                        class="form-check"
                                        v-model="emolumento_preco.status"
                                    />
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer border-0 pt-0">
                            <button  class="btn btn-secondary rounded-0" data-bs-dismiss = "modal">Fechar</button>
                            <button @click = "submitForm" class="btn btn-primary rounded-0">Enviar</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id = "removeForm">
                <div class="modal-dialog rounded-0">
                    <div class="modal-content rounded-0">
                        <div class="modal-header">
                           <h4>{{title}}</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <p>
                                    Deseja excluir  <b>{{emolumento_preco.nome}}</b> definitivamente da base de dados?
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
    import {api,url,numberFormat,language} from '../../../helpers/api';
    import DataTable from 'datatables.net-vue3';
    import DataTablesCore from 'datatables.net';
    import Select from 'datatables.net-select';

    DataTable.use(DataTablesCore);
    DataTable.use(Select);
    export default{
        name:"emolumento_preco_view",
        components:{Sidebar,Navbar,Footer,DataTable},
        data(){
          return{
              title:"Emolumento Preço",
              dataTable:null,
              selectedRow: null,
              emolumentos_preco:[],
              candidatos:[],
              anos:[],
              cursos:[],
              naturezas:[],
              emolumentos:[],
              classes:[],
              emolumento_preco:{
                  id:null,
                  emolumento_id:'',
                  status:true
              },
              filter_data:{
                  ano_id:'',
                  curso_id:'',
                  emolumento_natureza_id:'',
                  classe_id:'',
              },
              columns: [
                  { 
                    data: null,
                    render:(data)=>{
                      return `${data.Emolumento.nome}`
                    }
                  },
                  { 
                    data: 'preco',
                    render:(data)=>{
                      return `${numberFormat(data,2,',','.')}`
                    }
                  },
                  {
                    data: 'status',
                    render: (data) => data ?
                      `<span class="fas fa-check-circle text-success"></span> Disponível` :
                      `<span class="fas fa-check-circle text-danger"></span> Indisponível`
                  }
              ],
              language:language
          }
        },
        mounted() {
          this.getAnos();
          this.getCursos();
          this.getClasses();
          this.getNaturezas();
        },
         beforeUnmount() {
            if (this.dataTable) {
               this.dataTable.destroy();
            }
         },
        methods:{
           numberFormat,
           gerarLista(){
              const {ano_id, curso_id, periodo_id, classe_id, sala_id} = this.filter_data;
              api
              .get(`/lista-estudantes-emolumentos_preco/ano/${ano_id}/curso/${curso_id}/periodo/${periodo_id}/classe/${classe_id}/sala/${sala_id}`)
              .then(res => {
                if(res.data.url){
                  window.open(url+'/mediafiles/'+res.data.url, '_blank')
                }
              })
              .catch(err => {
                console.log(err)
              })
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
            getEmolumentosPreco(){
              const { ano_id, curso_id, classe_id, emolumento_natureza_id } = this.filter_data;
              api
              .get(`/emolumento-preco/ano/${ano_id}/curso/${curso_id}/classe/${classe_id}/natureza/${emolumento_natureza_id}/`)
              .then(res => {
                  this.emolumentos_preco = res.data;
              })
              .catch(err => {
                  console.log(err)
              })
            },
            getEmolumentos(){
              const {emolumento_natureza_id} = this.filter_data;
              api
              .get(`/emolumentos/natureza/${emolumento_natureza_id}`)
              .then(res => {
                  this.emolumentos = res.data;
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
            initDataTable() {
             this.$nextTick(() => {
              this.dataTable = $('#myDataTable').DataTable({
               });
             });
            },
            submitForm(){
                const form = {
                    ...this.emolumento_preco,
                    ...this.filter_data,
                }
              if(this.emolumento_preco.id > 0){
                api
                .put(`/emolumento-preco/${this.emolumento_preco.id}`, form)
                .then(res => {
                    if(res.data.message){
                        this.$swal.fire({
                          title:"Sucesso",
                          text:res.data.message,
                          icon:"success"
                        })
                        this.getEmolumentosPreco();
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
                .post("/emolumento-preco/", form)
                .then(res => {
                    if(res.data.data.id > 0){
                        this.$swal.fire({
                          title:"Sucesso",
                          text:res.data.message,
                          icon:"success"
                        })
                        this.getEmolumentosPreco();
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
                .delete(`/emolumento-preco/${this.emolumento_preco.id}`)
                .then(res => {
                    if(res.data.message){
                        this.$swal.fire({
                          title:"Sucesso",
                          text:res.data.message,
                          icon:"success"
                        })
                        this.getEmolumentosPreco();
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
                    self.emolumento_preco = data
                });
            },
            clearForm(){
                this.emolumento_preco = {};
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