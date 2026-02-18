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
      <Navbar page = "Autenticação / Registro de Actividades"/>
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
                    <DataTable 
                    ref="table"
                    :data = "notifications" 
                    :columns = "columns" 
                    :options="{ select: true, language:language }"
                    class="display table table-striped table-bordered">
                      <thead>
                        <tr class = "bg-secondary">
                          <th>DESCRIÇÃO</th>
                          <th>REFERÊNCIA</th>
                          <th>VALOR</th>
                        </tr>
                      </thead>
                    </DataTable>
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
  import '../static';
  import Sidebar from '../components/Sidebar.vue';
  import Navbar from '../components/Navbar.vue';
  import Footer from '../components/Footer.vue';
  import {api, language} from '../../../helpers/api';
  import moment from 'moment';
  import DataTable from 'datatables.net-vue3';
  import DataTablesCore from 'datatables.net';
  import Select from 'datatables.net-select';
  import { mapState } from 'vuex';

  DataTable.use(DataTablesCore);
  DataTable.use(Select);

  export default{
      name:"security_logs_view",
      components:{Sidebar,Navbar,Footer,DataTable},
      data(){
        return{
            title:"Registro de Actividades",
            dataTable:null,
            notifications:[],
            columns: [
                { data: 'title' },
                { data: 'text' },
                { 
                  data: 'createdAt',
                  render:(data) => {
                    return moment(data).format("DD-MM-YYYY HH:mm:ss")
                  }
                },
            ],
            language:language,
        }
      },
      mounted() {
        this.getAll()
      },
      methods:{
          getAll(){
            api
            .get(`/notifications/`)
            .then(res => {
                this.notifications = res.data;
            })
            .catch(err => {
                console.log(err)
            })
          },
          moment,
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