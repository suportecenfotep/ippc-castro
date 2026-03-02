<template>
  <div class="col-12">
    <div class="d-flex p-3">
      <button @click="clearForm" data-bs-toggle="modal" data-bs-target="#addClasse" class="btn btn-primary btn-sm fw-bold d-flex align-items-center p-2 rounded-3 border-0 text-uppercase">
        <span class="fas fa-plus mx-1 fs-5"></span> Adicionar
      </button>
      <button @click="selectRow" data-bs-toggle="modal" data-bs-target="#editClasse" class="btn btn-info btn-dark btn-sm mx-1 fw-bold d-flex align-items-center p-2 rounded-3 border-0 text-uppercase">
        <span class="fas fa-pencil mx-1 fs-5"></span> Editar
      </button>
      <button @click="selectRow" data-bs-toggle="modal" data-bs-target="#removeClasse" class="btn btn-danger btn-sm mx-1 fw-bold d-flex align-items-center p-2 rounded-3 border-0 text-uppercase">
        <span class="fas fa-trash mx-1 fs-5"></span> Excluir
      </button>
    </div>
    <DataTable
      :data="classes"
      :columns="columns"
      :options="{ select: true, language: language }"
      ref="table"
      class="display table table-bordered table-striped">
      <thead>
        <tr class="bg-secondary">
          <th>NOME</th>
          <th>CÓDIGO</th>
          <th>ESTADO</th>
        </tr>
      </thead>
    </DataTable>
  </div>

  <!-- Add Modal -->
  <div class="modal fade" id="addClasse">
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
                v-model="classe.nome"
              />
            </div>
            <div class="col-md-12 mb-3">
              <label>Código</label><br>
              <input
                type="text"
                class="form-control"
                v-model="classe.codigo"
              />
            </div>
            <div class="col-md-12 mb-3">
              <label>Estado</label><br>
              <input
                type="checkbox"
                class="form-check"
                v-model="classe.status"
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
  <div class="modal fade" id="editClasse">
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
                v-model="classe.nome"
              />
            </div>
            <div class="col-md-12 mb-3">
              <label>Código</label><br>
              <input
                type="text"
                class="form-control"
                v-model="classe.codigo"
              />
            </div>
            <div class="col-md-12 mb-3">
              <label>Estado</label><br>
              <input
                type="checkbox"
                class="form-check"
                v-model="classe.status"
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
  <div class="modal fade" id="removeClasse">
    <div class="modal-dialog rounded-0">
      <div class="modal-content rounded-0">
        <div class="modal-header">
          <h4>{{title}}</h4>
        </div>
        <div class="modal-body">
          <div class="row">
            <p>
              Deseja excluir <b>{{classe.nome}}</b> definitivamente da base de dados?
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
import DataTable from 'datatables.net-vue3';
import DataTablesCore from 'datatables.net';
import Select from 'datatables.net-select';
import { api, language } from '../../../helpers/api';

DataTable.use(DataTablesCore);
DataTable.use(Select);

export default {
  name: "classe_view",
  components: { DataTable },
  data() {
    return {
      title: "Classe",
      selectedRow: null,
      classes: [],
      columns: [
        { data: 'nome' },
        { data: 'codigo' },
        {
          data: 'status',
          render: (data) => data ?
            `<span class="fas fa-check-circle text-success"></span>` :
            `<span class="fas fa-times-circle text-danger"></span>`
        }
      ],
      classe: {
        id: null,
        nome: '',
        codigo: '',
        status: false
      },
      language: language,
    };
  },
  mounted() {
    this.getClasses();
  },
  methods: {
    getClasses() {
      api.get(`/classes/`)
        .then(res => {
          this.classes = res.data;
        })
        .catch(err => {
          console.log(err);
        });
    },
    submitForm() {
      if (this.classe.id > 0) {
        api.put(`/classes/${this.classe.id}`, this.classe)
          .then(res => {
            if (res.data.message) {
              this.$swal.fire({
                title: "Sucesso",
                text: res.data.message,
                icon: "success"
              });
              this.getClasses();
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
        api.post("/classes/", this.classe)
          .then(res => {
            if (res.data.data.id > 0) {
              this.$swal.fire({
                title: "Sucesso",
                text: res.data.message,
                icon: "success"
              });
              this.getClasses();
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
      api.delete(`/classes/${this.classe.id}`)
        .then(res => {
          if (res.data.message) {
            this.$swal.fire({
              title: "Sucesso",
              text: res.data.message,
              icon: "success"
            });
            this.getClasses();
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
        self.classe = data;
      });
    },
    clearForm() {
      this.classe = {
        id: null,
        nome: '',
        codigo: '',
        status: false
      };
    }
  }
};
</script>

<style>
.selected {
  background-color: blue; 
}
</style>
