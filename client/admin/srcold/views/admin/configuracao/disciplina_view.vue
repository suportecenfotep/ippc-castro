<template>
    <div class="col-12">
      <div class="d-flex p-3">
        <button @click="clearForm" data-bs-toggle="modal" data-bs-target="#addsubjecto" class="btn btn-primary btn-sm fw-bold d-flex align-items-center p-2 rounded-3 border-0 text-uppercase">
          <span class="fas fa-plus mx-1 fs-5"></span> Adicionar
        </button>
        <button @click="selectRow" data-bs-toggle="modal" data-bs-target="#editsubjecto" class="btn btn-info btn-dark btn-sm mx-1 fw-bold d-flex align-items-center p-2 rounded-3 border-0 text-uppercase">
          <span class="fas fa-pencil mx-1 fs-5"></span> Editar
        </button>
        <button @click="selectRow" data-bs-toggle="modal" data-bs-target="#removesubjecto" class="btn btn-danger btn-sm mx-1 fw-bold d-flex align-items-center p-2 rounded-3 border-0 text-uppercase">
          <span class="fas fa-trash mx-1 fs-5"></span> Excluir
        </button>
      </div>
      <div class="row">
        <div class="col-md-3 mb-3">
          <label>Selecione o curso</label><br>
          <select class="form-select" v-model="filter_data.curso_id">
            <option v-for="curso in cursos" :key="curso.id" :value="curso.id">{{ curso.nome }}</option>
          </select>
        </div>
        <div class="col-md-3">
          <label class="text-white">.</label><br>
          <button class="btn btn-info fw-bold" @click="getDisciplinas">
            <span class="fas fa-search"></span> PESQUISAR
          </button>
        </div>
      </div>
      <DataTable
        :data="disciplinas"
        :columns="columns"
        :options="{ select: true, language: language }"
        ref="table"
        class="display table table-bordered table-striped w-100">
        <thead>
          <tr class="bg-secondary">
            <th>NOME</th>
            <th>ABREVIATURA</th>
            <th>CLASSIFICAÇÃO</th>
            <th>REGIME</th>
          </tr>
        </thead>
      </DataTable>
    </div>
  
    <!-- Add Modal -->
    <div class="modal fade" id="addsubjecto">
      <div class="modal-dialog rounded-0">
        <div class="modal-content rounded-0">
          <div class="modal-header">
            <h4>{{ title }}</h4>
          </div>
          <div class="modal-body">
            <div class="row">
              <div class="col-md-12 mb-3">
                <label>Curso</label><br>
                <select class="form-select" v-model="subject.curso_id">
                  <option v-for="curso in cursos" :key="curso.id" :value="curso.id">{{ curso.nome }}</option>
                </select>
              </div>
              <div class = "col-md-12 mb-3">
                <label>Classificação</label><br>
                  <select
                      placeholder = "Classificacao"
                      v-model="subject.classificacao"
                      class = "form-select"
                  >
                  <option v-for="classificacao in classificacoes" :key="classificacao" :value="classificacao">{{ classificacao }}</option>
                </select>                
              </div>
              <div class = "col-md-12 mb-3">
                <label>Regime</label><br>
                <select
                      placeholder = "Classificacao"
                      v-model="subject.regime"
                      class = "form-select"
                  >
                  <option v-for="regime in regimes" :key="regime" :value="regime">{{ regime }}</option>
                </select>                
              </div>
              <div class="col-md-12 mb-3">
                <label>Nome</label><br>
                <input type="text" class="form-control" v-model="subject.nome" />
              </div>
              <div class="col-md-12 mb-3">
                <label>Abreviatura</label><br>
                <input type="text" class="form-control" v-model="subject.abreviatura" />
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
    <div class="modal fade" id="editsubjecto">
      <div class="modal-dialog rounded-0">
        <div class="modal-content rounded-0">
          <div class="modal-header">
            <h4>{{ title }}</h4>
          </div>
          <div class="modal-body">
            <div class="row">
              <div class="col-md-12 mb-3">
                <label>Curso</label><br>
                <select class="form-select" v-model="subject.curso_id">
                  <option v-for="curso in cursos" :key="curso.id" :value="curso.id">{{ curso.nome }}</option>
                </select>
              </div>
              <div class = "col-md-12 mb-3">
                <label>Classificação</label><br>
                  <select
                      placeholder = "Classificacao"
                      v-model="subject.classificacao"
                      class = "form-select"
                  >
                  <option v-for="classificacao in classificacoes" :key="classificacao" :value="classificacao">{{ classificacao }}</option>
                </select>                
              </div>
              <div class = "col-md-12 mb-3">
                <label>Regime</label><br>
                <select
                      placeholder = "Classificacao"
                      v-model="subject.regime"
                      class = "form-select"
                  >
                  <option v-for="regime in regimes" :key="regime" :value="regime">{{ regime }}</option>
                </select>                
              </div>
              <div class="col-md-12 mb-3">
                <label>Nome</label><br>
                <input type="text" class="form-control" v-model="subject.nome" />
              </div>
              <div class="col-md-12 mb-3">
                <label>Abreviatura</label><br>
                <input type="text" class="form-control" v-model="subject.abreviatura" />
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
    <div class="modal fade" id="removesubjecto">
      <div class="modal-dialog rounded-0">
        <div class="modal-content rounded-0">
          <div class="modal-header">
            <h4>{{ title }}</h4>
          </div>
          <div class="modal-body">
            <div class="row">
              <p>
                Deseja excluir <b>{{ subject.nome }}</b> definitivamente da base de dados?
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
  </template>
  
  <script>
  import $ from 'jquery'
  import DataTable from 'datatables.net-vue3';
  import DataTablesCore from 'datatables.net';
  import Select from 'datatables.net-select';
  import { api, language } from '../../../helpers/api';
  
  DataTable.use(DataTablesCore);
  DataTable.use(Select);
  
  export default {
    name: "subjecto_view",
    components: { DataTable },
    data() {
      return {
        title: "Disciplina",
        selectedRow: null,
        cursos: [],
        classes: [],
        disciplinas: [],
        classificacoes:['Complementar','Específica'],
        regimes:['Terminal','BI-Anual'],
        columns: [
          { data: 'nome' },
          { data: 'abreviatura' },
          { data: 'classificacao' },
          { data: 'regime' },
        ],
        subject: {
          id: null,
          nome: '',
          curso_id: '',
          classe_id: '',
          classificacao:'',
          regime:'',
          status: true
        },
        filter_data: {
          curso_id: ''
        },
        language: language,
      };
    },
    mounted() {
      this.getCursos();
      this.getClasses();
    },
    methods: {
      getCursos() {
        api.get(`/cursos/`)
          .then(res => {
            this.cursos = res.data;
          })
          .catch(err => {
            console.log(err);
          });
      },
      getClasses() {
        api.get(`/classes/`)
          .then(res => {
            this.classes = res.data;
          })
          .catch(err => {
            console.log(err);
          });
      },
      getDisciplinas() {
        const { curso_id } = this.filter_data;
        api.get(`/disciplinas/curso/${curso_id}`)
          .then(res => {
            this.disciplinas = res.data;
          })
          .catch(err => {
            console.log(err);
          });
      },
      submitForm() {
        if (this.subject.id > 0) {
          api.put(`/disciplinas/${this.subject.id}`, this.subject)
            .then(res => {
              if (res.data.message) {
                this.$swal.fire({
                  title: "Sucesso",
                  text: res.data.message,
                  icon: "success"
                });
                this.getDisciplinas();
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
          api.post("/disciplinas/", this.subject)
            .then(res => {
              if (res.data.data.id > 0) {
                this.$swal.fire({
                  title: "Sucesso",
                  text: res.data.message,
                  icon: "success"
                });
                this.getDisciplinas();
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
        api.delete(`/disciplinas/${this.subject.id}`)
          .then(res => {
            if (res.data.message) {
              this.$swal.fire({
                title: "Sucesso",
                text: res.data.message,
                icon: "success"
              });
              this.getDisciplinas();
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
            self.subject = data
        });
      },
      clearForm() {
        this.subject = { };
      },
    },
  };
  </script>
  
  <style>
  .selected {
    background-color: blue; 
  }
  </style>
  