<template>
    <div class="col-12">
      <div class="d-flex p-3">
        <button @click="clearForm" data-bs-toggle="modal" data-bs-target="#addDisciplinaClasse" class="btn btn-primary btn-sm fw-bold d-flex align-items-center p-2 rounded-3 border-0 text-uppercase">
          <span class="fas fa-plus mx-1 fs-5"></span> Adicionar
        </button>
        <button @click="selectRow" data-bs-toggle="modal" data-bs-target="#removeDisciplinaClasse" class="btn btn-danger btn-sm mx-1 fw-bold d-flex align-items-center p-2 rounded-3 border-0 text-uppercase">
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
        <div class="col-md-3 mb-3">
          <label>Selecione a Classe</label><br>
          <select class="form-select" v-model="filter_data.classe_id">
            <option v-for="classe in classes" :key="classe.id" :value="classe.id">{{ classe.nome }}</option>
          </select>
        </div>
        <div class="col-md-3">
          <label class="text-white">.</label><br>
          <button class="btn btn-info fw-bold" @click="getDistribuicoes">
            <span class="fas fa-search"></span> PESQUISAR
          </button>
        </div>
      </div>
      <DataTable
        :data="atribuicoes"
        :columns="columns"
        :options="{ select: true, language: language }"
        ref="table"
        class="display table table-bordered table-striped w-100">
        <thead>
          <tr class="bg-secondary">
            <th>NOME</th>
          </tr>
        </thead>
      </DataTable>
    </div>
  
    <!-- Add Modal -->
    <div class="modal fade" id="addDisciplinaClasse">
      <div class="modal-dialog rounded-0">
        <div class="modal-content rounded-0">
          <div class="modal-header">
            <h4>{{ title }}</h4>
          </div>
          <div class="modal-body">
            <div class="row">
              <div class="col-md-12 mb-3">
                <label>Curso</label><br>
                <select @change = "getDisciplinas" class="form-select" v-model="subject.curso_id">
                  <option v-for="curso in cursos" :key="curso.id" :value="curso.id">{{ curso.nome }}</option>
                </select>
              </div>
              <div class="col-md-12 mb-3">
                <label>Selecione a Classe</label><br>
                <select class="form-select" v-model="subject.classe_id">
                    <option v-for="classe in classes" :key="classe.id" :value="classe.id">{{ classe.nome }}</option>
                </select>
              </div>
              <div class="col-md-12 mb-3">
                <label>Selecione a Disciplina</label><br>
                <select class="form-select" v-model="subject.disciplina_id">
                    <option v-for="disciplina in disciplinas" :key="disciplina.id" :value="disciplina.id">{{ disciplina.nome }}</option>
                </select>
              </div>
              <div class = "col-md-12">
                <label>Estado</label><br>
                <input 
                    type = "checkbox"
                    class = "form-check"
                    v-model = "subject.status"
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
    <div class="modal fade" id="removeDisciplinaClasse">
      <div class="modal-dialog rounded-0">
        <div class="modal-content rounded-0">
          <div class="modal-header">
            <h4>{{ title }}</h4>
          </div>
          <div class="modal-body">
            <div class="row">
              <p>
                Deseja excluir definitivamente da base de dados?
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
        atribuicoes: [],
        columns: [
          {
             data: null,
             render:(data) => {
                return data.Disciplina.nome
             }  
          },
        ],
        subject: {
          id: null,
          curso_id: '',
          classe_id: '',
          disciplina_id: '',
          status: true
        },
        filter_data: {
          curso_id: '',
          classe_id: ''
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
      getDisciplinas(e) {
        api.get(`/disciplinas/curso/${e.target.value}`)
          .then(res => {
            this.disciplinas = res.data;
          })
          .catch(err => {
            console.log(err);
          });
      },
      getDistribuicoes() {
        const { curso_id, classe_id } = this.filter_data;
        api.get(`/disciplinas-classe/curso/${curso_id}/classe/${classe_id}`)
          .then(res => {
            this.atribuicoes = res.data;
          })
          .catch(err => {
            console.log(err);
          });
      },
      submitForm() {
        if (this.subject.id > 0) {
          api.put(`/disciplinas-classe/${this.subject.id}`, this.subject)
            .then(res => {
              if (res.data.message) {
                this.$swal.fire({
                  title: "Sucesso",
                  text: res.data.message,
                  icon: "success"
                });
                this.getDistribuicoes();
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
          api.post("/disciplinas-classe/", this.subject)
            .then(res => {
              if (res.data.data.id > 0) {
                this.$swal.fire({
                  title: "Sucesso",
                  text: res.data.message,
                  icon: "success"
                });
                this.getDistribuicoes();
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
        api.delete(`/disciplinas-classe/${this.subject.id}`)
          .then(res => {
            if (res.data.message) {
              this.$swal.fire({
                title: "Sucesso",
                text: res.data.message,
                icon: "success"
              });
              this.getDistribuicoes();
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
        const self = this;  

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
  