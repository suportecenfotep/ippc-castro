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
        <Navbar page = "Vitrine / Notícias"/>
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
                    <button @click = "clearForm" data-bs-toggle = "modal" data-bs-target = "#addForm" class = "btn btn-primary btn-sm fw-bold d-flex align-items-center p-1 rounded-3 border-0 text-uppercase">
                      <span class = "bi bi-plus fs-4"></span> Adicionar
                    </button>
                     <button data-bs-toggle = "modal" data-bs-target = "#editForm" class = "btn btn-info btn-dark mx-1 fw-bold d-flex align-items-center p-1 rounded-3 border-0 text-uppercase">
                      <span class = "bi bi-pencil fs-4"></span> Editar
                    </button>
                     <button data-bs-toggle = "modal" data-bs-target = "#removeForm" class = "btn btn-danger btn-sm mx-1 fw-bold d-flex align-items-center p-1 rounded-3 border-0 text-uppercase">
                      <span class = "bi bi-trash fs-4"></span> Excluir
                    </button>
                  </div>
                  <div class="card-body">

                      <table id = "myDataTable" class="table table-striped">
                        <thead>
                          <tr class = "bg-secondary">
                            <th>NOME</th>
                            <th>ESTADO</th>
                          </tr>
                        </thead>
                        <tbody>
                            <tr v-for = "item in noticias" :key = "item.id" @click="selectRow(item)" :class="{ 'selected': item === selectedRow }">
                               <td>{{item.titulo}}</td>
                               <td v-if="item.status">
                                   <span class="bi bi-check-circle text-success"></span>
                               </td>
                               <td v-else>
                                   <span class="bi bi-x-circle text-danger"></span>
                               </td>
                            </tr>
                        </tbody>
                      </table>

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
                                <div class = "col-md-12 mb-3">
                                    <label>Foto</label><br>
                                    <input 
                                      type = "file"
                                      id = "file"
                                      class = "form-control"
                                      />
                                </div>
                                <div class="col-md-12 mb-3">
                                    <label>Título</label><br>
                                    <input 
                                      type = "text"
                                      class="form-control"
                                      v-model = "slideshow.titulo"
                                      />
                                </div>
                                <div class="col-md-12 mb-3">
                                    <label>Descrição</label><br>
                                    <textarea 
                                      type = "text"
                                      class="form-control"
                                      v-model = "slideshow.texto"
                                      />
                                </div>
                                <div class="col-md-12 mb-3">
                                    <label>Estado</label><br>
                                    <input 
                                      type = "checkbox"
                                      class="form-check"
                                      v-model = "slideshow.status"
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
                                <div class = "col-md-12 mb-3">
                                    <label>Foto</label><br>
                                    <input 
                                      type = "file"
                                      id = "file"
                                      class = "form-control"
                                      />
                                </div>
                                <div class="col-md-12 mb-3">
                                    <label>Título</label><br>
                                    <input 
                                      type = "text"
                                      class="form-control"
                                      v-model = "slideshow.titulo"
                                      />
                                </div>
                                <div class="col-md-12 mb-3">
                                    <label>Descrição</label><br>
                                    <textarea 
                                      type = "text"
                                      class="form-control"
                                      v-model = "slideshow.texto"
                                      />
                                </div>
                                <div class="col-md-12 mb-3">
                                    <label>Estado</label><br>
                                    <input 
                                      type = "checkbox"
                                      class="form-check"
                                      v-model = "slideshow.status"
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
                                    Deseja excluir  <b>{{slideshow.titulo}}</b> definitivamente da base de dados?
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
    import {api,fd} from '../../../helpers/api';
    export default{
        name:"noticia_view",
        components:{Sidebar,Navbar,Footer},
        data(){
          return{
              title:"Notícia",
              dataTable:null,
              selectedRow: null,
              noticias:[],
              slideshow:{
                  id:null,
                  foto:'',
                  titulo:'',
                  texto:'',
                  status:true,
              }
          }
        },
        mounted() {
          this.getNoticias();
        },
         beforeUnmount() {
            if (this.dataTable) {
               this.dataTable.destroy();
            }
         },
        methods:{
            getNoticias(){
              api
              .get(`/noticias/`)
              .then(res => {
                  this.noticias = res.data;
                  this.initDataTable();
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
              fd.append("foto", $("#file")[0].files[0])
              fd.append("titulo", this.slideshow.titulo)
              fd.append("texto", this.slideshow.texto)
              fd.append("status", this.slideshow.status)
              if(this.slideshow.id > 0){
                api
                .put(`/noticias/${this.slideshow.id}`, fd)
                .then(res => {
                    if(res.data.message){
                        this.$swal.fire({
                          title:res.data.message,
                          icon:"success"
                        })
                        this.dataTable.destroy()
                        this.getNoticias();
                        $(".btn-secondary").click()
                    }else{
                        this.$swal.fire({
                          title:"Erro: Não foi possível atualizar",
                          icon:"error"
                        })
                    }
                })
                .catch(err => {
                    console.log(err)
                })
              }else{
                api
                .post("/noticias/", fd)
                .then(res => {
                    if(res.data.data.id > 0){
                        this.$swal.fire({
                          title:res.data.message,
                          icon:"success"
                        })
                        this.dataTable.destroy()
                        this.getNoticias();
                        $(".btn-secondary").click()
                    }else{
                        this.$swal.fire({
                          title:"Erro: Não foi possível cadastrar",
                          icon:"error"
                        })
                    }
                })
                .catch(err => {
                    console.log(err)
                })
              }
            },
            deleteForm(){
                api
                .delete(`/noticias/${this.slideshow.id}`)
                .then(res => {
                    if(res.data.message){
                        this.$swal.fire({
                          title:res.data.message,
                          icon:"success"
                        })
                        this.dataTable.destroy()
                        this.getNoticias();
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
            selectRow(row) {
               this.selectedRow = row;
               this.slideshow = row;
               console.log(row)
            },
            clearForm(){
                this.slideshow = {};
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