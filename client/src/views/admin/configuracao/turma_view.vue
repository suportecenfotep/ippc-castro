<template>
  <div class="col-12">
    <div class="d-flex p-3">
      <button @click="clearForm" data-bs-toggle="modal" data-bs-target="#addTurma" class="btn btn-primary btn-sm fw-bold d-flex align-items-center p-2 rounded-3 border-0 text-uppercase">
        <span class="fas fa-plus mx-1 fs-5"></span> Adicionar
      </button>
      <button @click="selectRow" data-bs-toggle="modal" data-bs-target="#editTurma" class="btn btn-info btn-dark btn-sm mx-1 fw-bold d-flex align-items-center p-2 rounded-3 border-0 text-uppercase">
        <span class="fas fa-pencil mx-1 fs-5"></span> Editar
      </button>
      <button @click="selectRow" data-bs-toggle="modal" data-bs-target="#removeTurma" class="btn btn-danger btn-sm mx-1 fw-bold d-flex align-items-center p-2 rounded-3 border-0 text-uppercase">
        <span class="fas fa-trash mx-1 fs-5"></span> Excluir
      </button>
    </div>
    <div class="row">
      <div class="col-md-3">
        <label class="mb-1">Selecione o curso</label><br>
        <select class="form-select" v-model="filter_data.curso_id">
          <option v-for="curso in cursos" :key="curso.id" :value="curso.id">{{ curso.nome }}</option>
        </select>
      </div>
      <div class="col-md-3">
        <label class="mb-1">Selecione a classe</label><br>
        <select class="form-select" v-model="filter_data.classe_id">
          <option v-for="classe in classes" :key="classe.id" :value="classe.id">{{ classe.nome }}</option>
        </select>
      </div>
      <div class="col-md-3">
        <label class="mb-1">Selecione o periodo</label><br>
        <select class="form-select" v-model="filter_data.periodo_id">
          <option v-for="periodo in periodos" :key="periodo.id" :value="periodo.id">{{ periodo.nome }}</option>
        </select>
      </div>
      <div class="col-md-3">
        <label class="mb-1 text-white">.</label><br>
        <button @click="getTurmas" class="btn btn-info fw-bold text-uppercase">
          <span class="fas fa-search"></span> Pesquisar
        </button>
      </div>
    </div>
    <DataTable 
          :data="salas" 
          :columns="columns" 
          :options="{ select: true, language:language }"
          ref="table"
          class="display table table-bordered table-striped">
          <thead>
            <tr class="bg-secondary">
              <th>NOME</th>
              <th>NÚMERO</th>
              <th>ESTADO</th>
            </tr>
          </thead>
        </DataTable>
  </div>

  <!-- Add Modal -->
  <div class="modal fade" id="addTurma">
    <div class="modal-dialog rounded-0">
      <div class="modal-content rounded-0">
        <div class="modal-header">
          <h4>{{ title }}</h4>
        </div>
        <div class="modal-body">
          <div class="row">
            <div class="col-md-12 mb-3">
              <label>Nome</label><br>
              <input type="text" class="form-control" v-model="turma.nome" />
            </div>
            <div class="col-md-12 mb-3">
              <label>Numero</label><br>
              <input type="number" class="form-control" v-model="turma.numero_sala" />
            </div>
            <div class="col-md-12 mb-3">
              <label>Estado</label><br>
              <input type="checkbox" class="form-check" v-model="turma.status" />
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
  <div class="modal fade" id="editTurma">
    <div class="modal-dialog rounded-0">
      <div class="modal-content rounded-0">
        <div class="modal-header">
          <h4>{{ title }}</h4>
        </div>
        <div class="modal-body">
          <div class="row">
            <div class="col-md-12 mb-3">
              <label>Nome</label><br>
              <input type="text" class="form-control" v-model="turma.nome" />
            </div>
            <div class="col-md-12 mb-3">
              <label>Numero</label><br>
              <input type="number" class="form-control" v-model="turma.numero_sala" />
            </div>
            <div class="col-md-12 mb-3">
              <label>Estado</label><br>
              <input type="checkbox" class="form-check" v-model="turma.status" />
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
  <div class="modal fade" id="removeTurma">
    <div class="modal-dialog rounded-0">
      <div class="modal-content rounded-0">
        <div class="modal-header">
          <h4>{{ title }}</h4>
        </div>
        <div class="modal-body">
          <div class="row">
            <p>
              Deseja excluir <b>{{ turma.nome }}</b> definitivamente da base de dados?
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
import $ from 'jquery';
import '../static';
import { api, language } from '../../../helpers/api';
import DataTable from 'datatables.net-vue3';
import DataTablesCore from 'datatables.net';
import Select from 'datatables.net-select';

DataTable.use(DataTablesCore);
DataTable.use(Select);

export default {
  name: "turma_view",
  components:{DataTable},
  data() {
    return {
      title: "Turma",
      turmasTable: null,
      selectedRow: null,
      cursos: [],
      classes: [],
      periodos: [],
      salas: [],
      turma: {
        id: null,
        nome: '',
        numero_sala: '',
        status: true
      },
      filter_data: {
        periodo_id: '',
        classe_id: '',
        curso_id: ''
      },
      columns: [
          { data: 'nome' },
          { data: 'numero_sala' },
          {
            data: 'status',
            render: (data) => data ?
              `<span class="fas fa-check-circle text-success"></span>` :
              `<span class="fas fa-check-circle text-danger"></span>`
          }
      ],
      language:language,
    };
  },
  created() {
    this.getCursos();
    this.getPeriodos();
    this.getClasses();
  },
  methods: {
    getCursos() {
      api
        .get(`/cursos/`)
        .then(res => {
          this.cursos = res.data;
        })
        .catch(err => {
          console.log(err);
        });
    },
    getClasses() {
      api
        .get(`/classes/`)
        .then(res => {
          this.classes = res.data;
        })
        .catch(err => {
          console.log(err);
        });
    },
    getPeriodos() {
      api
        .get(`/periodos/`)
        .then(res => {
          this.periodos = res.data;
        })
        .catch(err => {
          console.log(err);
        });
    },
    getTurmas() {
      const { periodo_id, curso_id, classe_id } = this.filter_data;
      api
        .get(`/salas/curso/${curso_id}/classe/${classe_id}/periodo/${periodo_id}`)
        .then(res => {
          this.salas = res.data;
        })
        .catch(err => {
          console.log(err);
        });
    },
    submitForm() {
      const form = {
        ...this.turma,
        ...this.filter_data
      };
      if (this.turma.id > 0) {
        api
          .put(`/salas/${this.turma.id}`, form)
          .then(res => {
            if (res.data.message) {
              this.$swal.fire({
                title: "Sucesso",
                text: res.data.message,
                icon: "success"
              });
              this.getTurmas();
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
        api
          .post("/salas/", form)
          .then(res => {
            if (res.data.data.id > 0) {
              this.$swal.fire({
                title: "Sucesso",
                text: res.data.message,
                icon: "success"
              });
              this.getTurmas();
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
      api
        .delete(`/salas/${this.turma.id}`)
        .then(res => {
          if (res.data.message) {
            this.$swal.fire({
              title: "Sucesso",
              text: res.data.message,
              icon: "success"
            });
            this.getTurmas();
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
            self.turma = data
        });
    },
    clearForm() {
      this.turma = { id: null, nome: '', status: true };
    }
  },
  watch: {
    dataTable: {
      handler() {
        this.selectedRow = null;
      },
      deep: true
    }
  }
};
</script>

<style>
.selected {
  background-color: blue;
}
</style>
