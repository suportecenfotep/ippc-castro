<template>
  <!-- Page wrapper start -->
  <div class="page-wrapper">

    <!-- Sidebar wrapper start -->
    <Sidebar/>
    <!-- Sidebar wrapper end -->

    <!-- Main container start -->
    <div class="main-container">

      <!-- Page header starts -->
      <Navbar page="Painel de Controle"/>
      <!-- Page header ends -->

      <!-- Content wrapper scroll start -->
      <div class="content-wrapper-scroll">

        <!-- Content wrapper start -->
        <div class="content-wrapper pt-1">

          <div class="w-100 d-flex align-items-start justify-content-between">
            <h1 class = "fw-bold fs-3 text-primary">Painel de Controle</h1>
            <h5 class = "fw-normal">Utilizador (a): <strong>{{user.nome}}</strong></h5>
          </div>

          <!-- Row start -->
          <div class="row">
            <div class="col-xxl-3 col-md-3 col-12">
              <div class="stats-tile">
                <div class="sale-icon shade-blue">
                  <i class="fas fa-user-plus"></i>
                </div>
                <div class="sale-details">
                  <h3 class="text-blue">{{registros.inscricoes}}</h3>
                  <p>Estudantes</p>
                </div>
              </div>
            </div>
            <div class="col-xxl-3 col-md-3 col-12">
              <div class="stats-tile">
                <div class="sale-icon shade-secondary">
                  <i class="fas fa-user-pen"></i>
                </div>
                <div class="sale-details">
                  <h3 class="text-secondary">{{registros.matriculas}}</h3>
                  <p>Matriculas</p>
                </div>
              </div>
            </div>
            <div class="col-xxl-3 col-md-3 col-12">
              <div class="stats-tile">
                <div class="sale-icon shade-green">
                  <i class="fas fa-users"></i>
                </div>
                <div class="sale-details">
                  <h3 class="text-green">{{registros.matriculados}}</h3>
                  <p>Matriculados</p>
                </div>
              </div>
            </div>
            <div class="col-xxl-3 col-md-3 col-12">
              <div class="stats-tile">
                <div class="sale-icon shade-red">
                  <i class="fas fa-users-slash"></i>
                </div>
                <div class="sale-details">
                  <h3 class="text-red">{{registros.desistentes}}</h3>
                  <p>Desistentes</p>
                </div>
              </div>
            </div>
          </div>
          <!-- Row end -->

          <div class="row" v-if = "user.nivel === 'Administrador' || user.nivel === 'IT'">
              <router-link to="/admin/finances/fluxo-de-caixa" class="col-md-3 text-decoration-none">
                  <div class="card mw-100 mh-auto text-white bg-primary" style="height: auto;">
                      <div class="card-header">
                          <h4>
                              <i class="fas fa-calendar-day"></i> Saldo Diário
                          </h4>
                      </div>
                      <div class="card-body">
                          <h3>{{ numberFormat(saldo.daily, 2, ',', '.') }}</h3>
                      </div>
                  </div>
              </router-link>

              <router-link to="/admin/finances/fluxo-de-caixa" class="col-md-3 text-decoration-none">
                  <div class="card text-white bg-success">
                      <div class="card-header mw-100 text-truncate">
                          <h4>
                              <i class="fas fa-calendar-week"></i> Saldo Semanal
                          </h4>
                      </div>
                      <div class="card-body">
                          <h3>{{ numberFormat(saldo.weekly, 2, ',', '.') }}</h3>
                      </div>
                  </div>
              </router-link>

              <router-link to="/admin/finances/fluxo-de-caixa" class="col-md-3 text-decoration-none">
                  <div class="card text-white bg-warning">
                      <div class="card-header">
                          <h4>
                              <i class="fas fa-calendar-alt"></i> Saldo Mensal
                          </h4>
                      </div>
                      <div class="card-body">
                          <h3>{{ numberFormat(saldo.monthly, 2, ',', '.') }}</h3>
                      </div>
                  </div>
              </router-link>

              <router-link to="/admin/finances/fluxo-de-caixa" class="col-md-3 text-decoration-none">
                  <div class="card text-white bg-danger">
                      <div class="card-header">
                          <h4>
                              <i class="fas fa-chart-bar"></i> Saldo Anual
                          </h4>
                      </div>
                      <div class="card-body">
                          <h3>{{ numberFormat(saldo.yearly, 2, ',', '.') }}</h3>
                      </div>
                  </div>
              </router-link>
          </div>

          <div class="row">
            <div class="col-xxl-6 col-sm-6 col-md-6">
              <div class="card" style = "height:auto">
                <div class="card-body">
                  <!-- Row start -->
                  <div class="row">
                    <div class="col-xxl-12 col-sm-12 col-12">
                      <div class="row">
                        <div class="col-12">
                           <Bar
                              id="my-chart-id"
                              :options="chartOptions"
                              :data="chartData"
                            />
                        </div>
                      </div>
                    </div>
                  </div>
                  <!-- Row end -->
                </div>
              </div>
            </div>
            <div class="col-xxl-6 col-sm-6 col-md-6">
              <div class="card" style = "height:18.5em">
                <div class="card-header">
                  <h4 class="card-title">Usuários Conectados</h4>
                  <div>
                    <span class = "fas fa-users"></span>
                    <b>
                    ( {{users.length}} )
                    </b>
                  </div>
                </div>
                <div class="card-body pt-0 overflow-scroll">
                  <div class="table-responsive">
                    <table class="table v-middle">
                      <thead>
                        <tr class="bg-secondary">
                          <th></th>
                          <th></th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr 
                          v-for="user in users" 
                          :key="user.id"
                        >
                          <td>
                            <div class="media-box">
                              <img :src="`${url}/api/mediafiles/`+user.foto" class="media-avatar" alt="Admin Themes" style = "width:3em; height:3em; border-radius:100px !important">
                              <div class="media-box-body">
                                <div class="text-truncate">{{user.nome}}</div>
                              </div>
                            </div>
                          </td>
                          <td>
                            <span v-if="user.status" class="text-green td-status"><i class="bi bi-check-circle"></i> Online</span>
                            <span v-else class="text-danger td-status"><i class="bi bi-x-circle"></i> Offline</span>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>

            <div class="col-xxl-12 col-sm-12 col-md-12" v-if = "user.nivel === 'Administrador' || user.nivel === 'IT'">
              <div class="card" style="height:auto">
                <div class="card-header">
                  <h4 class="card-title">Total de pagamentos por Mês</h4>
                </div>
                <div class="card-body">
                  <Bar
                    id="monthly-payments-chart"
                    :options="monthlyChartOptions"
                    :data="monthlyChartData"
                  />
                </div>
              </div>
            </div>

            <div class="col-xxl-12 col-sm-12 col-md-12" v-if="user.nivel === 'Administrador' || user.nivel === 'IT'">
              <div class="card" style="height:auto">
                <div class="card-header">
                  <h4 class="card-title">Total de pagamentos por Ano</h4>
                </div>
                <div class="card-body">
                  <Bar
                    id="annual-payments-chart"
                    :options="annualChartOptions"
                    :data="annualChartData"
                  />
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
    <!-- Main container end -->
    <Loader v-if="isLoading"/>
  </div>
  <!-- Page wrapper end -->
</template>

<script>
  import './static';
  import Sidebar from './components/Sidebar.vue';
  import Navbar from './components/Navbar.vue';
  import Footer from './components/Footer.vue';
  import Loader from './components/Loader.vue';
  import { Bar } from 'vue-chartjs';
  import { Chart as ChartJS, Title, Tooltip, Legend, BarElement, ArcElement, CategoryScale, LinearScale } from 'chart.js';
  import { api, url, socket, numberFormat } from '../../helpers/api';
  import { mapState } from 'vuex';
  import moment from 'moment';

  ChartJS.register(Title, Tooltip, Legend, BarElement, ArcElement, CategoryScale, LinearScale);

  export default {
      name: "dashboard_view",
      components: { Sidebar, Navbar, Footer, Loader, Bar },
      data() {
          return {
              users: [],
              notifications: [],
              is_student: false,
              isLoading:true,
              url: url,
              user:{},
              year: {},
              saldo:{
                daily:0,
                weekly:0,
                monthly:0,
                yearly:0
              },
              chartData: {
                  labels: ['T.Estudantes', 'T.Matriculados'],
                  datasets: [{
                      label: 'Total de Registos',
                      backgroundColor: '#f87979',
                      data: [0, 0]
                  }]
              },
              aproveitamentoData: {
                  labels: ['Aprovados', 'Reprovados'],
                  datasets: [{
                      label: 'Aproveitamento',
                      backgroundColor: ['green', 'red'],
                      data: [60, 40]
                  }]
              },
              estatisticaData: {
                  labels: ['Masculino', 'Feminino'],
                  datasets: [{
                      label: 'Estatística por Gênero',
                      backgroundColor: ['black', 'pink'],
                      data: [30, 20]
                  }]
              },
              chartOptions: {
                  responsive: true
              },
              registros: {
                  inscricoes: 0,
                  matriculas: 0,
                  matriculados: 0,
                  desistentes: 0,
                  aprovados: 0,
                  reprovados: 0,
              },
              monthlyChartData: {
                labels: [
                  "Setembro", "Outubro", "Novembro", "Dezembro",
                  "Janeiro", "Fevereiro", "Março", "Abril",
                  "Maio", "Junho", "Julho"
                ],
                datasets: [
                  {
                    label: "Pagamentos Mensais",
                    backgroundColor: "#42A5F5",
                    data: Array(11).fill(0), // Inicializamos com zeros
                  }
                ],
              },
              monthlyChartOptions: {
                responsive: true,
                plugins: {
                  legend: { position: "top" },
                },
                scales: {
                  y: { beginAtZero: true },
                },
              },
              // Dados do gráfico anual
              annualChartData: {
                labels: ["2025", "2026", "2027", "2028", "2029", "2030"],
                datasets: [
                  {
                    label: "Pagamentos Anuais",
                    backgroundColor: "#66BB6A",
                    data: Array(6).fill(0), 
                  },
                ],
              },
              annualChartOptions: {
                responsive: true,
                plugins: {
                  legend: { position: "top" },
                },
                scales: {
                  y: { beginAtZero: true },
                },
              },
          }
      },
      mounted() {
          this.countData();
          this.getUsers();
          this.getYear();
          this.checkLicence();
          socket.on("userChange", () => {
              this.getUsers()
          })
          socket.on("paymentChange", () => {
              this.countData()
          })
          this.user = this.$store.state.user;
      },
      computed: {
          ...mapState(['user'])
      },
      methods: {
          numberFormat,
          async countData() {
              try {
                  this.get_matriculas = await api.get('/matricula/');
                  this.registros.matriculas = this.get_matriculas.data.length;

                  this.get_inscricoes = await api.get('/estudantes/');
                  this.registros.inscricoes = this.get_inscricoes.data.length;

                  this.get_matriculados = await api.get('/matricula/estado/Estudando');
                  this.registros.matriculados = this.get_matriculados.data.length;

                  this.get_desistentes = await api.get('/matricula/estado/Cancelada');
                  this.registros.desistentes = this.get_desistentes.data.length;

                  const get_balance = await api.get(`/pagamentos/balancos/getAll/${this.year.id}`)
                  this.saldo = get_balance.data;

                  this.chartData = {
                    labels: ['T.Estudantes', 'T.Matriculados'],
                      datasets: [{
                          label: 'Total de Registos',
                          backgroundColor: '#f87979',
                          data: [
                              this.registros.inscricoes,
                              this.registros.matriculados
                          ]
                      }]
                  };
                 // Solicitar dados de pagamentos mensais
                const response = await api.get("/pagamentos/list/mensais");
                const payments = response.data; // Dados do backend [{ano, mes, totalPagamentos}]

                // Mapear pagamentos para os 12 meses do ano
                const meses = [
                    "Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho",
                    "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"
                ];
                const pagamentosMensais = Array(12).fill(0); // Inicializar com zeros

                payments.forEach(({ mes, totalPagamentos }) => {
                    pagamentosMensais[mes - 1] = totalPagamentos; // Ajustar índice (meses começam em 0)
                });

                // Atualizar os dados do gráfico
                this.monthlyChartData = {
                    labels: meses,
                    datasets: [
                        {
                            label: "Pagamentos Mensais",
                            backgroundColor: "#42A5F5",
                            data: pagamentosMensais, // Dados mapeados
                        },
                    ],
                };

                // Solicitar dados de pagamentos anuais
                const annualResponse = await api.get("/pagamentos/list/anuais");
                const annualPayments = annualResponse.data; // Dados do backend [{ano, totalPagamentos}]

                // Mapear pagamentos para os anos de 2021 a 2025
                const anos = ["2025", "2026", "2027", "2028", "2029", "2030"];
                const pagamentosAnuais = Array(6).fill(0); // Inicializar com zeros

                annualPayments.forEach(({ ano, totalPagamentos }) => {
                  const index = anos.indexOf(ano.toString());
                  if (index !== -1) {
                    pagamentosAnuais[index] = totalPagamentos; // Atualizar o valor no índice correto
                  }
                });

                // Atualizar os dados do gráfico
                this.annualChartData = {
                  labels: anos,
                  datasets: [
                    {
                      label: "Pagamentos Anuais",
                      backgroundColor: "#66BB6A",
                      data: pagamentosAnuais, // Dados mapeados
                    },
                  ],
                };
                this.isLoading = false;
              } catch (err) {
                  console.log(err);
                  this.$swal.fire({
                      title: "Erro",
                      text: "Verifique a sua conexão com a internet",
                      icon: "error",
                      timer: 3000
                  });
                this.isLoading = false;
              }
          },
          checkLicence() {
              api
                  .get("/license/read/")
                  .then(res => {
                      console.log(res.data);
                  })
                  .catch(err => {
                      if (err.response.data.message === "Licença não encontrada") {
                          this.$router.push("/licence");
                      }
                  });
          },
          getUsers() {
              api
                  .get('/utilizadores/status/1/')
                  .then(res => {
                      this.users = res.data;
                  })
                  .catch(err => {
                      console.log(err);
                  });
          },
          moment,
          getYear() {
              api
                  .get(`/anos/status/1`)
                  .then(res => {
                      this.year = res.data[0];
                  })
                  .catch(err => {
                      console.log(err);
                  });
          }
      },
  };
</script>

<style>
.activity {
  width: 100%;
  display: flex;
  flex-direction: row;
  margin-bottom: 10px;
}

.activity-avatar {
  width: 3.5em;
  height: 3.5em;
  background: rgb(199, 197, 197);
  color: white;
  text-align: center;
  margin-right: 12px;
  border-radius: 100px;
  padding-top: 10px;
}

.activity-title {
  margin-bottom: 0;
}

.activity-text {
  margin-top: 0;
  font-size: 12px;
}
</style>