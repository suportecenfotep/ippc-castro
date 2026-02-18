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
        <Navbar page = "Finanças / Despesas"/>
        <!-- Page header ends -->

        <!-- Content wrapper scroll start -->
        <div class="content-wrapper-scroll">

          <!-- Content wrapper start -->
          <div class="content-wrapper">

            <!-- Row start -->
            <div class="row">
              <div class="col-12">
                <div class="card">
                  <div class="d-flex p-3 pb-0">
                    <button @click = "clearForm" data-bs-toggle = "modal" data-bs-target = "#addForm" class = "btn btn-primary btn-sm fw-bold d-flex align-items-center p-2 rounded-3 border-0 text-uppercase">
                      <span class = "fas fa-plus mx-1 fs-5"></span> Adicionar
                    </button>
                     <button v-if = "despesas.length > 0" @click = "selectRow" data-bs-toggle = "modal" data-bs-target = "#editForm" class = "btn btn-info btn-dark btn-sm mx-1 fw-bold d-flex align-items-center p-2 rounded-3 border-0 text-uppercase">
                      <span class = "fas fa-pencil mx-1 fs-5"></span> Editar
                    </button>
                     <button v-if = "despesas.length > 0" @click = "selectRow" data-bs-toggle = "modal" data-bs-target = "#removeForm" class = "btn btn-danger btn-sm mx-1 fw-bold d-flex align-items-center p-2 rounded-3 border-0 text-uppercase">
                      <span class = "fas fa-trash mx-1 fs-5"></span> Excluir
                    </button>
                  </div>
                  <div class="card-body">
                    <div class="row p-2">
                          <div class="col-md-6">
                            <label class="mb-1">Selecione o período</label><br>
                            <div class="d-flex align-items-center">
                                <b class="me-1">DE</b>
                                <input
                                    type="date"
                                    class="form-control"
                                    v-model="filter_data.start_date"
                                >
                                <b class="mx-1">A</b>
                                <input
                                    type="date"
                                    class="form-control"
                                    v-model="filter_data.end_date"
                                >
                            </div>
                          </div>

                          <div class="col-md-6">
                            <label class="text-white mb-1">.</label><br>
                            <button @click = "getDespesas" class="btn btn-info text-uppercase fw-bold">
                                <span class="fas fa-search"></span> Filtrar
                            </button>
                            <button @click = "generateExpensesPDF" v-if="despesas.length > 0" class="btn btn-danger mx-2 text-uppercase fw-bold ">
                                <span class="fas fa-file-pdf"></span> Imprimir relatório
                            </button>
                          </div>
                      </div>
                      <DataTable 
                      ref="table"
                      :data = "despesas" 
                      :columns = "columns" 
                      :options="{ select: true, language:language }"
                      class="display table table-striped table-bordered">
                        <thead>
                          <tr class = "bg-secondary">
                            <th>DESCRIÇÃO</th>
                            <th>REFERÊNCIA</th>
                            <th>VALOR</th>
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
                                    <label>Descrição</label><br>
                                    <input
                                        type = "text"
                                        class="form-control"
                                        v-model="despesa.descricao"
                                        />
                                </div>
                                 <div class="col-md-12 mb-3">
                                    <label>Referência</label><br>
                                    <input
                                        type = "text"
                                        class="form-control"
                                        v-model="despesa.referencia"
                                        />
                                </div>
                                <div class="col-md-12 mb-3">
                                    <label>Valor</label><br>
                                    <input
                                        type = "number"
                                        class="form-control"
                                        v-model="despesa.valor"
                                        />
                                </div>
                                <div class="col-md-12 mb-3">
                                    <label>Estado</label><br>
                                    <input 
                                      type = "checkbox"
                                      class="form-check"
                                      v-model = "despesa.status"
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
                                    <label>Descrição</label><br>
                                    <input
                                        type = "text"
                                        class="form-control"
                                        v-model="despesa.descricao"
                                        />
                                </div>
                                 <div class="col-md-12 mb-3">
                                    <label>Referência</label><br>
                                    <input
                                        type = "text"
                                        class="form-control"
                                        v-model="despesa.referencia"
                                        />
                                </div>
                                <div class="col-md-12 mb-3">
                                    <label>Valor</label><br>
                                    <input
                                        type = "number"
                                        class="form-control"
                                        v-model="despesa.valor"
                                        />
                                </div>
                                <div class="col-md-12 mb-3">
                                    <label>Estado</label><br>
                                    <input 
                                      type = "checkbox"
                                      class="form-check"
                                      v-model = "despesa.status"
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
                                    Deseja excluir  <b>{{despesa.descricao}}</b> definitivamente da base de dados?
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
    import {api, language, numberFormat, url} from '../../../helpers/api';
    import jsPDF from 'jspdf';
    import 'jspdf-autotable';
    //import QRious from 'qrious';
    import moment from 'moment';
    import DataTable from 'datatables.net-vue3';
    import DataTablesCore from 'datatables.net';
    import Select from 'datatables.net-select';
    import { mapState } from 'vuex';

    DataTable.use(DataTablesCore);
    DataTable.use(Select);

    export default{
        name:"despesa_view",
        components:{Sidebar,Navbar,Footer,DataTable},
        data(){
          return{
              title:"Despesa",
              dataTable:null,
              selectedRow: null,
              despesas:[],
              despesa:{
                  id:null,
                  descricao:'',
                  referencia:'',
                  valor:0,
                  status:true,
              },
              filter_data:{
                start_date:"",
                end_date:""
              },
              columns: [
                  { data: 'descricao' },
                  { data: 'referencia' },
                  { 
                    data: 'valor',
                    render:(data)=>{
                      return `${numberFormat(data,2,',','.')}`
                    }
                  },
                  {
                    data: 'status',
                    render: (data) => data ?
                      `<span class="fas fa-check-circle text-success"></span> Pago` :
                      `<span class="fas fa-check-circle text-danger"></span> Não Pago`
                  }
              ],
              language:language,
          }
        },
        mounted() {
          this.getAll()
        },
        methods:{
            getDespesas(){
              const {start_date, end_date} = this.filter_data;
              api
              .get(`/despesas/start/${start_date}/end/${end_date}`)
              .then(res => {
                  this.despesas = res.data;
              })
              .catch(err => {
                  console.log(err)
              })
            },
            getAll(){
              api
              .get(`/despesas/`)
              .then(res => {
                  this.despesas = res.data;
              })
              .catch(err => {
                  console.log(err)
              })
            },
            generateExpensesPDF() {
                const doc = new jsPDF();
                const columns = [
                    { header: 'DESCRIÇÃO', dataKey: 'descricao' },
                    { header: 'REFERÊNCIA', dataKey: 'referencia' },
                    { header: 'VALOR', dataKey: 'valor' },
                    { header: 'ESTADO', dataKey: 'estado' }
                ];

                const rows = this.despesas.map(item => ({
                    descricao: item.descricao,
                    referencia: item.referencia,
                    valor: this.numberFormat(item.valor, 2, ',', '.'),
                    estado: item.status ? 'Pago' : 'Não Pago'
                }));

                // Adicionar o logotipo
                doc.addImage(`${url}/api/mediafiles/logo.jpeg`, 'JPEG', 150, 10, 45, 25); // Ajusta a posição e tamanho do logotipo

                // Adicionar o cabeçalho com informações da empresa
                doc.setFontSize(12);
                doc.text('IPPC - DESPESAS', 14, 10);
                doc.text('NIF: 123456789', 14, 16);
                doc.text('Contactos: +123456789', 14, 22);
                doc.text('Endereço: Rua Exemplo, 123', 14, 28);
                doc.text('Email: contato@ippc.pt', 14, 34);

                // Adicionar o título do relatório
                doc.setFontSize(14);
                doc.text(`Relatório de despesas de ${moment(this.filter_data.start_date).format("DD-MM-YYYY")} a ${moment(this.filter_data.end_date).format("DD-MM-YYYY")}`, 14, 50);

                // Adicionar a tabela
                doc.autoTable(columns, rows, {
                    margin: { top: 55 },
                    theme: 'grid'
                });

                doc.output('dataurlnewwindow');
            },
            numberFormat,
            submitForm(){
              const form = {
                  ...this.despesa,
                  user_id:this.$store.state.user.id
              }
              if(this.despesa.id > 0){
                api
                .put(`/despesas/${this.despesa.id}`, form)
                .then(res => {
                    if(res.data.message){
                        this.$swal.fire({
                          title:"Sucesso",
                          text:res.data.message,
                          icon:"success"
                        })
                        this.getDespesas();
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
                .post("/despesas/", form)
                .then(res => {
                    if(res.data.data.id > 0){
                        this.$swal.fire({
                          title:"Sucesso",
                          text:res.data.message,
                          icon:"success"
                        })
                        this.getDespesas();
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
                .delete(`/despesas/${this.despesa.id}`)
                .then(res => {
                    if(res.data.message){
                        this.$swal.fire({
                          title:"Sucesso",
                          text:res.data.message,
                          icon:"success"
                        })
                        this.getDespesas();
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
                    self.despesa = data
                });
            },
            clearForm(){
                this.despesa = {};
            },
        },
        computed:{
          ...mapState(['user'])
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