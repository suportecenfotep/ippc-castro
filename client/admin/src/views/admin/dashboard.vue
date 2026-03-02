<template>
  <div class="page-wrapper glass-bg">
    <Sidebar />

    <div class="main-container">
      <Navbar page="Painel Analítico Escolar" />

      <div class="content-wrapper-scroll">
        <div class="content-wrapper pt-3 px-4">
          
          <div class="d-flex align-items-center justify-content-between mb-4 animate__animated animate__fadeIn">
            <div>
              <h3 class="fw-bold dashboard-title mb-0">Painel de Controle</h3>
              <p class="text-muted small mb-0" v-if="cards.projecaoMensal && (user.nivel ==='Administrador' || user.nivel === 'IT')">
                <i class="fas fa-chart-line me-1"></i> Projeção Mensal: <span class="fw-bold text-dark">{{ numberFormat(cards.projecaoMensal, 2, ',', '.') }} Kz</span>
              </p>
            </div>
            <div class="text-end">
              <div 
                class="inadimplencia-badge"
                :class="parseFloat(cards.taxaInadimplencia) > 50 ? 'is-critical pulse-red' : 'is-warning'"
              >
                <i class="fas fa-exclamation-triangle me-2"></i>
                Taxa de Inadimplência: <strong>{{ cards.taxaInadimplencia }}</strong>
              </div>
            </div>
          </div>

          <div class="row g-3 mb-4">
            <div class="col-md-4" v-for="(stat, index) in [
              { label: 'Total Estudantes', val: cards.totalEstudantes, icon: 'fa-user-graduate', color: 'slate' },
              { label: 'Matrículas Ativas', val: cards.matriculasAtivas, icon: 'fa-check-double', color: 'emerald' },
              { label: 'Operadores Ativos', val: topUsers.length, icon: 'fa-users', color: 'indigo' }
            ]" :key="index">
              <div class="stats-card shadow-sm border-0 h-100">
                <div :class="['icon-box', stat.color]"><i :class="['fas', stat.icon]"></i></div>
                <div class="stats-info">
                  <h2 class="mb-0 fw-bold text-dark">{{ stat.val || 0 }}</h2>
                  <span class="text-muted small text-uppercase fw-semibold">{{ stat.label }}</span>
                </div>
              </div>
            </div>
          </div>

          <div class="row mb-4" v-if="desafios && desafios.length">
            <div class="col-12">
              <div class="card border-0 shadow-sm custom-card">
                <div class="card-body p-4">
                  <h6 class="section-title mb-4">
                    <i class="fas fa-bullseye me-2"></i>Metas de Produtividade
                  </h6>
                  <div class="row g-4">
                    <div class="col-md-4" v-for="d in desafios" :key="d.titulo">
                      <div class="goal-item p-3 rounded-4">
                        <div class="d-flex justify-content-between align-items-center mb-2">
                          <span class="fw-bold small text-dark">{{ d.titulo }}</span>
                          <span :class="['status-pill', d.cor === 'bg-success' ? 'done' : 'ongoing']">{{ d.status }}</span>
                        </div>
                        <div class="progress rounded-pill mb-2" style="height: 6px; background: #e2e8f0;">
                          <div class="progress-bar progress-bar-animated" 
                               :class="d.cor === 'bg-success' ? 'bg-emerald' : 'bg-indigo'" 
                               :style="{ width: d.progresso + '%' }"></div>
                        </div>
                        <div class="d-flex justify-content-between small">
                          <span class="text-muted text-truncate w-75">{{ d.objetivo }}</span>
                          <span class="fw-bold text-dark">{{ d.progresso }}%</span>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="row mb-4" v-if="user.nivel === 'Administrador' || user.nivel === 'IT'">
            <div class="col-md-6" v-for="(fluxo, key) in saldos" :key="key">
              <div class="finance-card shadow-sm border-0 mb-3" :class="key">
                <div class="card-body p-4">
                  <div class="d-flex justify-content-between align-items-start mb-3">
                    <div>
                      <span class="text-white-50 small text-uppercase ls-1 fw-bold">Saldo {{ key === 'geral' ? 'Acumulado' : 'Mensal' }}</span>
                      <h2 class="text-white fw-bold mt-1 mb-0">{{ numberFormat(fluxo.total, 2, ',', '.') }} <small class="fw-light opacity-50">Kz</small></h2>
                    </div>
                    <div class="finance-icon"><i class="fas fa-wallet"></i></div>
                  </div>
                  <div class="finance-details d-flex gap-4">
                    <div>
                      <small class="d-block opacity-75">Entradas</small>
                      <span class="fw-bold">+{{ numberFormat(fluxo.entradas, 0, '', '.') }}</span>
                    </div>
                    <div class="border-start border-white-10 ps-4">
                      <small class="d-block opacity-75">Saídas</small>
                      <span class="fw-bold">-{{ numberFormat(fluxo.saidas, 0, '', '.') }}</span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="row mt-2" v-if="user.nivel === 'Administrador' || user.nivel === 'IT'">
            <div class="col-lg-6 mb-4">
              <div class="card border-0 shadow-sm h-100 custom-card">
                <div class="card-header bg-transparent border-0 d-flex justify-content-between align-items-center p-4">
                  <h6 class="fw-bold text-dark mb-0">Top Operadores</h6>
                  <i class="fas fa-crown text-warning opacity-75"></i>
                </div>
                <div class="card-body p-0 pb-3">
                  <div class="table-responsive">
                    <table class="table align-middle table-hover modern-table">
                      <thead>
                        <tr>
                          <th class="ps-4">Operador</th>
                          <th class="text-end pe-4">Desempenho</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr v-for="t in topUsers" :key="t.user_id">
                          <td class="ps-4">
                            <div class="d-flex align-items-center">
                              <div class="avatar-container me-3">
                                <img :src="`${url}/api/mediafiles/${t.User.foto}`" class="rounded-circle border" @error="setDefaultAvatar">
                              </div>
                              <span class="fw-semibold text-dark">{{ t.User.nome }}</span>
                            </div>
                          </td>
                          <td class="text-end pe-4">
                            <span class="badge-custom-blue">{{ t.total }} oper.</span>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>

            <div class="col-lg-6 mb-4">
              <div class="card border-0 shadow-sm h-100 custom-card">
                <div class="card-header bg-transparent border-0 p-4">
                  <h6 class="fw-bold text-dark mb-0">Comparativo Anual</h6>
                </div>
                <div class="card-body p-0 pb-3">
                  <div class="table-responsive">
                    <table class="table align-middle modern-table">
                      <thead>
                        <tr>
                          <th class="ps-4">Ano Lectivo</th>
                          <th class="text-end pe-4">Receita Total</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr v-for="ano in comparativoAnos" :key="ano.ano">
                          <td class="ps-4 py-3 fw-bold text-indigo">{{ ano.ano }}</td>
                          <td class="text-end pe-4 fw-bold text-emerald">{{ numberFormat(ano.total, 2, ',', '.') }} Kz</td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="row">
            <div class="col-md-6 mb-4">
              <div class="card custom-card border-0 shadow-sm">
                <div class="card-header header-blue border-0 p-4">
                  <h6 class="mb-0 fw-bold"><i class="fas fa-plus-circle me-2"></i>Novas Matrículas</h6>
                </div>
                <div class="card-body p-0">
                  <div class="list-group list-group-flush">
                    <div v-for="m in feed.ultimasMatriculas" :key="m.id" class="list-group-item p-3 border-0 border-bottom mx-2">
                      <div class="d-flex justify-content-between align-items-center">
                        <div class="text-truncate" style="max-width: 80%;">
                          <p class="mb-0 fw-bold text-dark small">{{ m.Estudante.nome }}</p>
                          <small class="text-indigo">{{ m.Curso.nome }}</small>
                        </div>
                        <span class="time-stamp">{{ formatRelative(m.createdAt) }}</span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div class="col-md-6 mb-4">
              <div class="card custom-card border-0 shadow-sm">
                <div class="card-header header-red border-0 p-4">
                  <h6 class="mb-0 fw-bold"><i class="fas fa-minus-circle me-2"></i>Saídas Recentes</h6>
                </div>
                <div class="card-body p-0">
                  <div class="table-responsive">
                    <table class="table table-sm align-middle modern-table mb-0">
                      <tbody>
                        <tr v-for="d in feed.despesasRecentes" :key="d.id">
                          <td class="ps-4 py-3">
                            <span class="d-block fw-semibold text-dark small text-truncate" style="max-width: 250px">{{ d.descricao }}</span>
                            <small class="text-muted opacity-75">Ref: {{ d.referencia }}</small>
                          </td>
                          <td class="text-end pe-4 fw-bold text-danger">
                            -{{ numberFormat(d.valor, 0, '', '.') }}
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>

        </div>
        <Footer />
      </div>
    </div>
    <Loader v-if="isLoading" />
  </div>
</template>
<script>
import Sidebar from './components/Sidebar.vue';
import Navbar from './components/Navbar.vue';
import Footer from './components/Footer.vue';
import Loader from './components/Loader.vue';
import { api, url, numberFormat } from '../../helpers/api';
import moment from 'moment';
import 'moment/locale/pt-br';
import './static'

export default {
  name: "DashboardAnalitico",
  components: { Sidebar, Navbar, Footer, Loader },
  data() {
    return {
      isLoading: true,
      url: url,
      user: this.$store.state.user,
      cards: { totalEstudantes: 0, matriculasAtivas: 0, taxaInadimplencia: "0%", projecaoMensal: 0 },
      saldos: { mensal: { entradas: 0, saidas: 0, total: 0 }, geral: { entradas: 0, saidas: 0, total: 0 } },
      stats: { genero: [], salas: [] },
      comparativoAnos: [],
      desafios: [],
      feed: { ultimasMatriculas: [], despesasRecentes: [] },
      topUsers: []
    };
  },
  methods: {
    numberFormat,
    formatRelative(date) { 
      return date ? moment(date).fromNow() : 'agora'; 
    },
    setDefaultAvatar(event) {
      event.target.src = '/img/avatar-default.svg';
    },
    async fetchDashboardData() {
      this.isLoading = true;
      try {
        const { data } = await api.get('/dashboard/academic');
        this.cards = data.cards || this.cards;
        this.saldos = data.saldos || this.saldos;
        this.stats = data.stats || this.stats;
        this.comparativoAnos = data.comparativoAnos || [];
        this.desafios = data.desafios || [];
        this.feed = data.feed || this.feed;
        this.topUsers = data.topUsers || [];
      } catch (error) {
        console.error("Erro ao carregar dashboard:", error);
      } finally {
        this.isLoading = false;
      }
    }
  },
  async mounted() {
    moment.locale('pt-br');
    await this.fetchDashboardData();
  }
};
</script>

<style scoped>
/* Variáveis de Cores Elegantes */
:root {
  --indigo: #6366f1;
  --emerald: #10b981;
  --slate-dark: #1e293b;
  --slate-light: #f8fafc;
}

/* Background suave */
.glass-bg {
  background-color: #f1f5f9;
}

/* Títulos */
.dashboard-title {
  color: #1e293b;
  letter-spacing: -0.5px;
}

/* Badges e Ícones Customizados */
.inadimplencia-badge {
  padding: 10px 20px;
  border-radius: 50px;
  font-size: 0.85rem;
  font-weight: 500;
}
.is-critical { background: #fee2e2; color: #b91c1c; border: 1px solid #fecaca; }
.is-warning { background: #fff7ed; color: #c2410c; border: 1px solid #ffedd5; }

/* Stats Tiles Modernos */
.stats-card {
  background: white;
  padding: 1.5rem;
  border-radius: 1.25rem;
  display: flex;
  align-items: center;
  transition: transform 0.2s;
}
.stats-card:hover { transform: translateY(-5px); }

.icon-box {
  width: 54px; height: 54px;
  border-radius: 14px;
  display: flex; align-items: center; justify-content: center;
  font-size: 1.4rem; margin-right: 1.2rem;
}
.slate { background: #f1f5f9; color: #475569; }
.emerald { background: #ecfdf5; color: #10b981; }
.indigo { background: #eef2ff; color: #6366f1; }

/* Finance Cards (Gradientes Elegantes) */
.finance-card { border-radius: 1.5rem; position: relative; overflow: hidden; }
.finance-card.mensal { background: linear-gradient(135deg, #1e293b 0%, #334155 100%); color: white; }
.finance-card.geral { background: linear-gradient(135deg, #059669 0%, #10b981 100%); color: white; }
.finance-icon { font-size: 2.5rem; opacity: 0.15; position: absolute; right: 20px; top: 20px; }
.border-white-10 { border-color: rgba(255,255,255,0.1) !important; }

/* Tabelas e Listas */
.modern-table thead tr {
  background-color: #f8fafc;
  color: #64748b;
  font-size: 0.75rem;
  text-transform: uppercase;
  letter-spacing: 0.5px;
}
.modern-table td { border-color: #f1f5f9; font-size: 0.9rem; }

.badge-custom-blue {
  background: #eef2ff;
  color: #4338ca;
  padding: 5px 12px;
  border-radius: 8px;
  font-size: 0.8rem;
  font-weight: 700;
}

.avatar-container img {
  width: 36px; height: 36px;
  object-fit: cover;
}

.time-stamp {
  font-size: 0.7rem;
  color: #94a3b8;
  background: #f8fafc;
  padding: 2px 8px;
  border-radius: 4px;
}

/* Headers de Feed */
.header-blue { color: #4338ca; background-color: #eef2ff !important; border-radius: 1.25rem 1.25rem 0 0; }
.header-red { color: #b91c1c; background-color: #fef2f2 !important; border-radius: 1.25rem 1.25rem 0 0; }
.custom-card { border-radius: 1.25rem; overflow: hidden; }

/* Animações */
.pulse-red { animation: pulse-shadow 2s infinite; }
@keyframes pulse-shadow {
  0% { box-shadow: 0 0 0 0 rgba(185, 28, 28, 0.4); }
  70% { box-shadow: 0 0 0 10px rgba(185, 28, 28, 0); }
  100% { box-shadow: 0 0 0 0 rgba(185, 28, 28, 0); }
}

.bg-emerald { background-color: #10b981 !important; }
.bg-indigo { background-color: #6366f1 !important; }

.status-pill {
  font-size: 0.65rem;
  padding: 3px 10px;
  border-radius: 50px;
  font-weight: 800;
  text-transform: uppercase;
}
.status-pill.done { background: #d1fae5; color: #065f46; }
.status-pill.ongoing { background: #e0e7ff; color: #3730a3; }
</style>