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
        <Navbar page = "Meu Perfil"/>
        <!-- Page header ends -->

        <!-- Content wrapper scroll start -->
        <div class="content-wrapper-scroll">

          <!-- Content wrapper start -->
          <div class="content-wrapper">

            <!-- Row start -->
            <div class="row">
              <div class="col-sm-12 col-12">

                <div class="profile-header">
                  <h1 class = "fw-bold">Bem vindo, {{user.nome}}</h1>
                  <div class="profile-header-content">
                    <div class="profile-header-tiles">
                      <div class="row">
                        <div class="col-sm-4 col-12">
                          <div class="profile-tile">
                            <span class="icon">
                              <i class="fas fa-user"></i>
                            </span>
                            <h6 class="mw-100 text-truncate">Nome - <span>{{user.nome}}</span></h6>
                          </div>
                        </div>
                        <div class="col-sm-4 col-12">
                          <div class="profile-tile">
                            <span class="icon">
                              <i class="fas fa-phone"></i>
                            </span>
                            <h6>Telefone - <span>{{user.telefone}}</span></h6>
                          </div>
                        </div>
                        <div class="col-sm-4 col-12">
                          <div class="profile-tile">
                            <span class="icon">
                              <i class="fas fa-users"></i>
                            </span>
                            <h6>Nível - <span>{{user.nivel}}</span></h6>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="profile-avatar-tile">
                      <img :src="url+'/api/mediafiles/'+user.foto" class="img-fluid" alt="Foto de Perfil" />
                    </div>
                  </div>
                </div>

              </div>
            </div>
            <!-- Row end -->

            <!-- Row start -->
            <div class="row">
              <div class="col-md-12">
                <!-- Row start -->
                <div class="row">
                  <div class="col-sm-12 col-12">
                    <!-- Card start -->
                    <div class="card">
                      <div class="card-header">
                        <div class="card-title">Editar Perfil</div>
                      </div>
                      <div class="card-body">
                        <div class="create-offer-container">
                            <div class="row">
                                <div class="col-md-4">
                                    <label>Nome do Utilizador</label><br>
                                    <input
                                        type = "text"
                                        class="form-control"
                                        v-model = "user.nome"
                                        readonly
                                        disabled
                                    />
                                </div>
                                 <div class="col-md-4">
                                    <label>Telefone</label><br>
                                    <input
                                        type = "number"
                                        class="form-control"
                                        v-model = "user.telefone"
                                        readonly
                                        disabled
                                    />
                                </div>
                                <div class="col-md-4">
                                    <label>Email</label><br>
                                    <input
                                        type = "email"
                                        class="form-control"
                                        v-model = "user.email"
                                        readonly
                                        disabled
                                    />
                                </div>
                                 <div class="col-md-4">
                                    <label>Foto de Perfil</label><br>
                                    <input
                                        type = "file"
                                        id = "file"
                                        class="form-control"
                                        readonly
                                        disabled
                                    />
                                </div>
                                <div class="col-md-4">
                                    <label>Nível de Acesso</label><br>
                                    <input
                                        type = "text"
                                        class="form-control"
                                        v-model = "user.nivel"
                                        disabled
                                        readonly
                                    />
                                </div>
                                 <div class="col-md-4">
                                    <label>Palavra-Passe</label><br>
                                    <input
                                        type = "text"
                                        class="form-control"
                                        v-model = "user.senha"
                                        readonly
                                        disabled
                                    />
                                </div>
                                <div class="col-md-2 mt-3" hidden>
                                    <button class="btn btn-primary">
                                       <span class="fas fa-refresh"></span> Atualizar
                                    </button>
                                </div>
                            </div>
                        </div>
                      </div>
                    </div>
                    <!-- Card end -->
                  </div>
                </div>
                <!-- Row end -->
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
      <!-- *************
				************ Main container end *************
			************* -->

    </div>
    <!-- Page wrapper end -->
</template>
<script>
    import './static';
    import Sidebar from './components/Sidebar.vue';
    import Navbar from './components/Navbar.vue';
    import Footer from './components/Footer.vue';
    import {url} from '../../helpers/api'
import { mapState } from 'vuex';
    export default{
        name:"dashboard_view",
        components:{Sidebar,Navbar,Footer},
        data(){
            return{
                userData:{},
                user:{
                    id:'',
                    foto:'',
                    nome:'',
                    telefone:'',
                    email:'',
                    nivel:'',
                    senha:''
                },
                url:''
            }
        },
        computed:{
          ...mapState(['user'])
        },
        created(){
            this.userData = this.$store.state.user;
            this.user = this.userData;
            this.url = url;
            console.log(this.userData)
        }
    }

</script>