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
      <Navbar page="Autenticação / Utilizadores"/>
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
                  <button data-bs-toggle="modal" data-bs-target="#addForm" class="btn btn-primary btn-sm fw-bold d-flex align-items-center p-2 rounded-3 border-0 text-uppercase">
                    <span class="fas fa-plus mx-1 fs-5"></span> Adicionar
                  </button>
                  <button @click = "selectRow" data-bs-toggle="modal" data-bs-target="#editForm" class="btn btn-info btn-dark btn-sm mx-1 fw-bold d-flex align-items-center p-2 rounded-3 border-0 text-uppercase">
                    <span class="fas fa-pencil mx-1 fs-5"></span> Editar
                  </button>
                  <button @click = "selectRow" data-bs-toggle="modal" data-bs-target="#removeForm" class="btn btn-danger btn-sm mx-1 fw-bold d-flex align-items-center p-2 rounded-3 border-0 text-uppercase">
                    <span class="fas fa-trash mx-1 fs-5"></span> Excluir
                  </button>
                </div>
                <div class="card-body">
                    <DataTable 
                      :data="utilizadores" 
                      :columns="columns" 
                      :options="{ select: true, language:language}"
                      ref="table"
                      class="display table table-bordered table-striped">
                      <thead>
                        <tr>
                          <th>NOME</th>
                          <th>TELEFONE</th>
                          <th>NÍVEL</th>
                          <th>ESTADO</th>
                          <th>ÚLTIMO LOGIN</th>
                        </tr>
                      </thead>
                    </DataTable>
                </div>
              </div>
            </div>
          </div>
          <!-- Row end -->

        <!-- Modals -->
            <!-- Add Modal -->
            <div class="modal fade" id="addForm" data-bs-backdrop = "static">
            <div class="modal-dialog rounded-0">
              <div class="modal-content rounded-0">
                <div class="modal-header">
                  <h4>{{title}}</h4>
                </div>
                <div class="modal-body">
                  <div class="row">
                    <div class="col-md-12 mb-3">
                      <label>Nome</label><br>
                      <input 
                        type="text"
                        class="form-control"
                        v-model="user.nome"
                      />
                    </div>
                    <div class="col-md-12 mb-3">
                      <label>Telefone</label><br>
                      <input 
                        type="number"
                        class="form-control"
                        v-model="user.telefone"
                      />
                    </div>
                    <div class="col-md-12 mb-3">
                      <label>Email</label><br>
                      <input 
                        type="email"
                        class="form-control"
                        v-model="user.email"
                      />
                    </div>
                    <div class="col-md-12 mb-3">
                      <label>Nível</label><br>
                      <select 
                        class="form-select"
                        v-model="user.nivel"
                      >
                        <option 
                          v-for="nivel in niveis" 
                          :key="nivel"     
                          :value="nivel"
                        >{{nivel}}</option>    
                      </select>
                    </div>
                    <div class="col-md-12 mb-3">
                      <label>Palavra-Passe</label><br>
                      <input 
                        type="password"
                        class="form-control"
                        v-model="user.senha"
                      />
                    </div>
                    <div class="col-md-12 mb-3">
                      <label>Estado</label><br>
                      <input 
                        type="checkbox"
                        class="form-check"
                        v-model="user.status"
                      />
                    </div>
                  </div>
                </div>
                <div class="modal-footer border-0 pt-0">
                  <button class="btn btn-secondary rounded-0" data-bs-dismiss="modal">Fechar</button>
                  <button @click="submitForm" class="btn btn-primary rounded-0">Enviar</button>
                </div>
              </div>
            </div>
          </div>

          <!-- Edit Modal -->
          <div class="modal fade" id="editForm" data-bs-backdrop = "static">
            <div class="modal-dialog rounded-0">
              <div class="modal-content rounded-0">
                <div class="modal-header">
                  <h4>{{title}}</h4>
                </div>
                <div class="modal-body">
                  <div class="row">
                    <div class="col-md-12 mb-3">
                      <label>Nome</label><br>
                      <input 
                        type="text"
                        class="form-control"
                        v-model="user.nome"
                      />
                    </div>
                    <div class="col-md-12 mb-3">
                      <label>Telefone</label><br>
                      <input 
                        type="number"
                        class="form-control"
                        v-model="user.telefone"
                      />
                    </div>
                    <div class="col-md-12 mb-3">
                      <label>Email</label><br>
                      <input 
                        type="email"
                        class="form-control"
                        v-model="user.email"
                      />
                    </div>
                    <div class="col-md-12 mb-3">
                      <label>Nível</label><br>
                      <select 
                        class="form-select"
                        v-model="user.nivel"
                      >
                        <option 
                          v-for="nivel in niveis" 
                          :key="nivel"     
                          :value="nivel"
                        >{{nivel}}</option>    
                      </select>
                    </div>
                    <div class="col-md-12 mb-3">
                      <label>Palavra-Passe</label><br>
                      <input 
                        type="password"
                        class="form-control"
                        v-model="user.senha"
                      />
                    </div>
                    <div class="col-md-12 mb-3">
                      <label>Estado</label><br>
                      <input 
                        type="checkbox"
                        class="form-check"
                        v-model="user.status"
                      />
                    </div>
                  </div>
                </div>
                <div class="modal-footer border-0 pt-0">
                  <button class="btn btn-secondary rounded-0" data-bs-dismiss="modal">Fechar</button>
                  <button @click="submitForm" class="btn btn-primary rounded-0">Enviar</button>
                </div>
              </div>
            </div>
          </div>

          <!-- Remove Modal -->
          <div class="modal fade" id="removeForm" data-bs-backdrop = "static">
            <div class="modal-dialog rounded-0">
              <div class="modal-content rounded-0">
                <div class="modal-header">
                  <h4>{{title}}</h4>
                </div>
                <div class="modal-body">
                  <div class="row">
                    <p>
                      Deseja excluir <b>{{user.nome}}</b> definitivamente da base de dados?
                    </p>
                  </div>
                </div>
                <div class="modal-footer border-0 pt-0">
                  <button class="btn btn-secondary rounded-0" data-bs-dismiss="modal">Fechar</button>
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
import { api, language } from '../../../helpers/api';
import DataTable from 'datatables.net-vue3';
import DataTablesCore from 'datatables.net';
import Select from 'datatables.net-select';
import moment from 'moment';

DataTable.use(DataTablesCore);
DataTable.use(Select);

export default {
  name: "user_view",
  components: { Sidebar, Navbar, Footer, DataTable },
  data() {
    return {
      title: "Usuário",
      selectedRow: null,
      utilizadores: [],
      niveis: [],
      columns: [
        { data: 'nome' },
        { data: 'telefone' },
        { data: 'nivel' },
        {
          data: null,
          render: (data) => {
            return data.status ?
              `<span class="fas fa-check-circle text-success"></span> Online` :
              `<span class="fas fa-check-circle text-danger"></span> Offline`;
          }
        },
        { data:null,
          render:(data) => {
            return `${moment(data.createdAt).format("DD-MM-YYYY HH:mm:ss")}`
          }
         },
      ],
      user: {
        id: null,
        nome: '',
        telefone: '',
        email: '',
        nivel: '',
        senha: '',
        status: true,
      },
      language:language
    }
  },
  mounted() {
    this.getUsers();
    this.getLevels();
  },
  methods: {
    getLevels() {
      this.niveis = [
       "IT",
       "Administrador",
       "Secretaria",
       "Tesouraria",
       "Professor",
       "D.Pedagógico",
       "D.Geral",
       "PCA"
      ]
    },
    getUsers() {
      api.get(`/utilizadores/`)
        .then(res => {
          this.utilizadores = res.data;
        })
        .catch(err => {
          console.log(err);
        })
    },
    submitForm() {
      if (this.user.id > 0) {
        api.put(`/utilizadores/${this.user.id}`, this.user)
          .then(res => {
            if (res.data.message) {
              this.$swal.fire({
                title: "Sucesso",
                text: res.data.message,
                icon: "success"
              });
              this.getUsers();
              $(".btn-secondary").click();
            } else {
              this.$swal.fire({
                title: "Erro: Não foi possível atualizar",
                icon: "error"
              });
            }
          })
          .catch(err => {
            console.log(err);
          });
      } else {
        api.post("/utilizadores/", this.user)
          .then(res => {
            if (res.data.data.id > 0) {
              this.$swal.fire({
                title: "Sucesso",
                text: res.data.message,
                icon: "success"
              });
              this.getUsers();
              $(".btn-secondary").click();
            } else {
              this.$swal.fire({
                title: "Erro: Não foi possível cadastrar",
                icon: "error"
              });
            }
          })
          .catch(err => {
            console.log(err);
          });
      }
    },
    deleteForm() {
      api.delete(`/utilizadores/${this.user.id}`)
        .then(res => {
          if (res.data.message) {
            this.$swal.fire({
              title: "Sucesso",
              text: res.data.message,
              icon: "success"
            });
            this.getUsers();
            $(".btn-secondary").click();
          } else {
            this.$swal.fire({
              title: "Erro: Não foi possível excluir",
              icon: "error"
            });
          }
        })
        .catch(err => {
          console.log(err);
        });
    },
    selectRow() {
      const table = this.$refs.table.dt;
      const self = this;  // Captura o contexto do Vue
      
      table.rows({ selected: true }).every(function () {
        const data = this.data();
        self.user = {  // Usa 'self' em vez de 'this' para se referir ao contexto do componente
          id: data.id,
          nome: data.nome,
          telefone: data.telefone,
          email: data.email,
          nivel: data.nivel,
          senha: data.senha,
          status: data.status,
        };
        console.log(self.user.nome);
      });
    },
    clearForm() {
      this.user = {
        id: null,
        nome: '',
        telefone: '',
        email: '',
        nivel: '',
        senha: '',
        status: true,
      };
    },
  },
}
</script>

<style>
@import 'datatables.net-bs5';
</style>
