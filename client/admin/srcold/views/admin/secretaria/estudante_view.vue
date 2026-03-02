<template>
  <div class="page-wrapper">
    <Sidebar />

    <div class="main-container">
      <Navbar page="Estudantes / Lista Geral" />

      <div class="content-wrapper-scroll">
        <div class="content-wrapper">
          
          <div class="row">
            <div class="col-12">
              <div class="card">
                <div class="card-header d-flex align-items-center justify-content-between p-3">
                  <div class="row g-2 align-items-end">
                    <div class="col-auto">
                      <label class="form-label small fw-bold">Filtrar por Curso</label>
                      <select class="form-select form-select-sm" v-model="filter_data.curso_id" style="min-width: 200px;">
                        <option value="">Todos os Cursos</option>
                        <option v-for="curso in cursos" :key="curso.id" :value="curso.id">
                          {{ curso.nome }}
                        </option>
                      </select>
                    </div>
                    <div class="col-auto">
                      <button @click="getStudents" class="btn btn-info btn-sm fw-bold">
                        <i class="fas fa-search"></i> PESQUISAR
                      </button>
                    </div>
                  </div>
                  
                  <button @click="openModal('add')" class="btn btn-primary btn-sm fw-bold shadow-sm">
                    <i class="fas fa-plus pe-1"></i> NOVO ESTUDANTE
                  </button>
                </div>

                <div class="card-body">
                  <div class="mb-3">
                    <div class="input-group">
                      <span class="input-group-text bg-light border-end-0"><i class="fas fa-filter text-muted"></i></span>
                      <input type="text" v-model="searchQuery" class="form-control border-start-0" placeholder="Filtrar na tabela por nome, identificação ou processo...">
                    </div>
                  </div>

                  <div class="table-responsive">
                    <table class="table table-hover table-bordered align-middle">
                      <thead class="table-dark">
                        <tr>
                          <th style="width: 100px;">PROC.</th>
                          <th>IDENTIFICAÇÃO</th>
                          <th>NOME COMPLETO</th>
                          <th>TELEFONE</th>
                          <th>ENCARREGADO</th>
                          <th class="text-center" style="width: 150px;">ACÇÕES</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr v-for="estudante in estudantesFiltrados" :key="estudante.id">
                          <td class="fw-bold text-primary">{{ estudante.numero_processual }}</td>
                          <td>{{ estudante.identificacao || '---' }}</td>
                          <td>
                            <template v-if="temAcessoFinanceiro">
                              <a @click="irParaPagamentos(estudante.id)" style="text-decoration: underline; color:blue; cursor: pointer;" role="button">
                                {{ estudante.nome }}
                              </a>
                            </template>
                            <template v-else>
                              {{ estudante.nome }}
                            </template>
                          </td>
                          <td>{{ estudante.telefone || '---' }}</td>
                          <td>{{ estudante.encarregado || '---' }}</td>
                          <td class="text-center">
                            <div class="btn-group">
                              <button v-if="temAcessoFinanceiro" 
                                      class="btn btn-outline-success btn-sm" 
                                      @click="irParaPagamentos(estudante.id)" 
                                      title="Ir para Pagamentos">
                                <i class="fas fa-dollar-sign"></i>
                              </button>

                              <button class="btn btn-outline-info btn-sm" @click="openModal('details', estudante)" title="Detalhes">
                                <i class="fas fa-eye"></i>
                              </button>
                              
                              <button class="btn btn-outline-danger btn-sm" @click="confirmarRemocao(estudante)" title="Excluir">
                                <i class="fas fa-trash"></i>
                              </button>
                            </div>
                          </td>
                        </tr>
                        <tr v-if="estudantesFiltrados?.length === 0">
                          <td colspan="6" class="text-center py-4 text-muted italic">
                            Nenhum registro encontrado para a pesquisa.
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="modal fade" id="studentModal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-xl">
              <div class="modal-content shadow-lg border-0">
                <div class="modal-header bg-light">
                  <h5 class="modal-title fw-bold text-uppercase">{{ modalTitle }}</h5>
                  <div class="d-flex gap-2">
                    <button v-if="mode !== 'add' && temAcessoFinanceiro" 
                            @click="irParaPagamentos(student.id)" 
                            class="btn btn-success btn-sm fw-bold">
                      <i class="fas fa-money-bill-wave"></i> PAGAMENTOS
                    </button>

                    <button v-if="mode !== 'add'" @click="matricular(student.id)" class="btn btn-info btn-sm fw-bold">
                      <i class="fas fa-user-graduate"></i> MATRICULAR
                    </button>
                  </div>
                </div>
                <div class="modal-body bg-white">
                  <div v-if="mode === 'details'" class="alert alert-info py-2 d-flex justify-content-between align-items-center">
                    <span><i class="fas fa-info-circle me-2"></i>Modo de Visualização</span>
                    <button @click="mode = 'edit'" class="btn btn-sm btn-dark">Habilitar Edição</button>
                  </div>

                  <div class="row g-3">
                    <div class="col-md-3">
                      <label class="form-label fw-bold">Nº Processo</label>
                      <input type="text" class="form-control" v-model="student.numero_processual" :disabled="mode === 'details'">
                    </div>
                    <div class="col-md-6">
                      <label class="form-label fw-bold">Nome Completo</label>
                      <input type="text" class="form-control" v-model="student.nome" :disabled="mode === 'details'">
                    </div>
                    <div class="col-md-3">
                      <label class="form-label fw-bold">Data Nascimento</label>
                      <input type="date" class="form-control" v-model="student.data_de_nascimento" :disabled="mode === 'details'">
                    </div>

                    <div class="col-md-3">
                      <label class="form-label fw-bold">BI / Identificação</label>
                      <input type="text" class="form-control" v-model="student.identificacao" :disabled="mode === 'details'">
                    </div>
                    <div class="col-md-3">
                      <label class="form-label fw-bold">Local Emissão</label>
                      <input type="text" class="form-control" v-model="student.local_emissao_identificacao" :disabled="mode === 'details'">
                    </div>
                    <div class="col-md-3">
                      <label class="form-label fw-bold">Data Emissão BI</label>
                      <input type="date" class="form-control" v-model="student.data_emissao_bi" :disabled="mode === 'details'">
                    </div>
                    <div class="col-md-3">
                      <label class="form-label fw-bold">Gênero</label>
                      <select class="form-select" v-model="student.genero" :disabled="mode === 'details'">
                        <option value="Masculino">Masculino</option>
                        <option value="Feminino">Feminino</option>
                      </select>
                    </div>

                    <div class="col-md-3">
                      <label class="form-label fw-bold">Nacionalidade</label>
                      <input type="text" class="form-control" v-model="student.nacionalidade" :disabled="mode === 'details'">
                    </div>
                    <div class="col-md-3">
                      <label class="form-label fw-bold">Província</label>
                      <input type="text" class="form-control" v-model="student.provincia" :disabled="mode === 'details'">
                    </div>
                    <div class="col-md-3">
                      <label class="form-label fw-bold">Município</label>
                      <input type="text" class="form-control" v-model="student.municipio" :disabled="mode === 'details'">
                    </div>
                    <div class="col-md-3">
                      <label class="form-label fw-bold">Estado Civil</label>
                      <select class="form-select" v-model="student.estado_civil" :disabled="mode === 'details'">
                        <option v-for="ec in estadosCivis" :key="ec" :value="ec">{{ec}}</option>
                      </select>
                    </div>

                    <div class="col-md-4">
                      <label class="form-label fw-bold">Nome do Pai</label>
                      <input type="text" class="form-control" v-model="student.nome_pai" :disabled="mode === 'details'">
                    </div>
                    <div class="col-md-4">
                      <label class="form-label fw-bold">Nome da Mãe</label>
                      <input type="text" class="form-control" v-model="student.nome_mae" :disabled="mode === 'details'">
                    </div>
                    <div class="col-md-4">
                      <label class="form-label fw-bold">Residência Atual</label>
                      <input type="text" class="form-control" v-model="student.residencia" :disabled="mode === 'details'">
                    </div>

                    <div class="col-md-4">
                      <label class="form-label fw-bold">Encarregado</label>
                      <input type="text" class="form-control" v-model="student.encarregado" :disabled="mode === 'details'">
                    </div>
                    <div class="col-md-4">
                      <label class="form-label fw-bold">Grau Parentesco</label>
                      <input type="text" class="form-control" v-model="student.grau_parentesco" :disabled="mode === 'details'">
                    </div>
                    <div class="col-md-4">
                      <label class="form-label fw-bold">Tel. Encarregado</label>
                      <input type="text" class="form-control" v-model="student.contacto_encarregado" :disabled="mode === 'details'">
                    </div>
                  </div>
                </div>
                <div class="modal-footer bg-light border-0">
                  <button class="btn btn-secondary shadow-sm" data-bs-dismiss="modal">Fechar</button>
                  <button v-if="mode !== 'details'" @click="submitForm" class="btn btn-primary px-4 shadow-sm">
                    {{ mode === 'add' ? 'Salvar Registro' : 'Atualizar Dados' }}
                  </button>
                </div>
              </div>
            </div>
          </div>

          <div class="modal fade" id="removeForm">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header bg-danger text-white">
                  <h5 class="modal-title">Confirmar Exclusão</h5>
                </div>
                <div class="modal-body">
                  Tem certeza que deseja remover o estudante <strong>{{ student.nome }}</strong>?
                </div>
                <div class="modal-footer">
                  <button class="btn btn-light border" data-bs-dismiss="modal">Cancelar</button>
                  <button @click="deleteForm" class="btn btn-danger">Confirmar Exclusão</button>
                </div>
              </div>
            </div>
          </div>

        </div>
        <Footer />
      </div>
    </div>
  </div>
</template>

<script>
import Sidebar from '../components/Sidebar.vue';
import Navbar from '../components/Navbar.vue';
import Footer from '../components/Footer.vue';
import { api } from '../../../helpers/api';
import * as bootstrap from 'bootstrap';
import { mapState } from 'vuex';
import '../static';

export default {
    name: "student_view",
    components: { Sidebar, Navbar, Footer },
    data() {
        return {
            mode: 'add',
            searchQuery: '',
            estudantes: [],
            cursos: [],
            estadosCivis: [],
            student: this.initialStudentState(),
            filter_data: { curso_id: '' },
            modals: { main: null, remove: null }
        }
    },
    computed: {
        ...mapState(['user']),
        
        // Verificação centralizada de acesso financeiro
        temAcessoFinanceiro() {
            const niveisPermitidos = ['Administrador', 'Tesouraria', 'IT'];
            return this.user && niveisPermitidos.includes(this.user.nivel);
        },

        modalTitle() {
            if (this.mode === 'add') return "Novo Cadastro de Estudante";
            if (this.mode === 'edit') return "Editar Estudante";
            return "Detalhes do Estudante";
        },

        estudantesFiltrados() {
            if (!this.estudantes) return [];
            const query = this.searchQuery.toLowerCase();
            return this.estudantes.filter(e => 
                e.nome.toLowerCase().includes(query) || 
                e.numero_processual?.toString().includes(query) ||
                e.identificacao?.toLowerCase().includes(query)
            );
        }
    },
    watch: {
        'student.genero': function () {
            this.getMaritalState();
        }
    },
    mounted() {
        this.getCursos();
        this.getAll();
        this.modals.main = new bootstrap.Modal(document.getElementById('studentModal'));
        this.modals.remove = new bootstrap.Modal(document.getElementById('removeForm'));
    },
    methods: {
        initialStudentState() {
            return {
                id: null, 
                numero_processual: '',
                nome: '', 
                identificacao: '', 
                local_emissao_identificacao: '',
                data_emissao_bi: '', 
                telefone: '', 
                data_de_nascimento: '',
                nacionalidade: '', 
                provincia: '', 
                municipio: '',
                genero: '', 
                estado_civil: '', 
                escola_anterior: 'ND', 
                residencia: 'Huambo',
                necessidade_especial: 'Nenhuma', 
                curso_id: '',
                nome_pai: '',
                nome_mae: '',
                encarregado: '',
                grau_parentesco: '',
                contacto_encarregado: '',
                status: true
            };
        },

        irParaPagamentos(estudanteId) {
            if (!this.temAcessoFinanceiro) {
                this.$swal.fire("Acesso Restrito", "Você não tem permissão para acessar pagamentos.", "warning");
                return;
            }
            if (!estudanteId) return;
            
            if (this.modals.main) this.modals.main.hide();
            this.$router.push(`/admin/finances/pagamentos/${estudanteId}`);
        },

        matricular(estudanteId) {
            if (!estudanteId) return;
            if (this.modals.main) this.modals.main.hide();
            this.$router.push(`/admin/secretaria/matricular-estudante/${estudanteId}`);
        },

        getMaritalState() {
            const masc = ["Solteiro", "Casado", "Divorciado", "Viúvo"];
            const fem = ["Solteira", "Casada", "Divorciada", "Viúva"];
            this.estadosCivis = this.student.genero === "Masculino" ? masc : fem;
        },

        getCursos() {
            api.get('/cursos/').then(res => { this.cursos = res.data || []; });
        },

        getAll() {
            api.get('/estudantes/').then(res => { this.estudantes = res.data || []; });
        },

        getStudents() {
            if (!this.filter_data.curso_id) return this.getAll();
            api.get(`/estudantes/curso/${this.filter_data.curso_id}`).then(res => {
                this.estudantes = res.data || [];
            });
        },

        openModal(mode, data = null) {
            this.mode = mode;
            if (data) {
                this.student = { ...data };
                if(this.student.data_de_nascimento) this.student.data_de_nascimento = this.student.data_de_nascimento.split('T')[0];
                if(this.student.data_emissao_bi) this.student.data_emissao_bi = this.student.data_emissao_bi.split('T')[0];
            } else {
                this.student = this.initialStudentState();
            }
            this.modals.main.show();
        },

        confirmarRemocao(estudante) {
            this.student = estudante;
            this.modals.remove.show();
        },

        submitForm() {
            const apiCall = this.student.id 
                ? api.put(`/estudantes/${this.student.id}`, this.student)
                : api.post("/estudantes/", this.student);

            apiCall.then(() => {
                this.$swal.fire("Sucesso", "Dados salvos!", "success");
                this.getAll();
                this.modals.main.hide();
            }).catch(err => {
                this.$swal.fire("Erro", err.response?.data?.message || "Erro ao salvar", "error");
            });
        },

        deleteForm() {
            api.delete(`/estudantes/${this.student.id}`).then(() => {
                this.getAll();
                this.modals.remove.hide();
                this.$swal.fire("Removido", "Estudante removido com sucesso", "success");
            });
        }
    }
}
</script>

<style scoped>
:deep(.table td) {
    vertical-align: middle;
}
.italic {
    font-style: italic;
}
</style>