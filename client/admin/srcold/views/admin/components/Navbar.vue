<template>
<div class="page-header">
    <!-- Toggle sidebar start -->
    <div class="toggle-sidebar" id="toggle-sidebar"><i class="bi bi-list"></i></div>
    <!-- Toggle sidebar end -->
    <!-- Logo sm starts -->
    <router-link to="/dashboard" class="d-lg-none d-md-block">
        <img src="../assets/images/nl.png" class="logo-sm" alt="Bootstrap Gallery">
    </router-link>
    <!-- Logo sm ends -->
    <!-- Breadcrumb start -->
    <ol class="breadcrumb d-lg-flex d-none">
        <li class="breadcrumb-item">
            <i class="bi bi-house fs-5"></i>
            <router-link to="/dashboard">Núcleo Lógico</router-link>
        </li>
        <li class="breadcrumb-item breadcrumb-active" aria-current="page">{{page}}</li>
    </ol>
    <!-- Breadcrumb end -->
    <!-- Header actions ccontainer start -->
    <div class="header-actions-container">
    <!-- Search container start -->
    <router-link to="/admin/autenticacao/profile" class="leads d-none d-xl-flex">
        <div >{{user.nivel}} </div>
        <span class="lead-icon text-dark">
            <i 
            class="bi bi-person-fill text-secondary"></i>
        </span>
    </router-link>
    <!-- Search container end -->

    <!-- Header actions start -->
    <ul class="header-actions">
        <li class="dropdown">
        <a id="userSettings" class="user-settings" data-toggle="dropdown" aria-haspopup="true">
            <span class="user-name d-none d-md-block">{{user.nome}}</span>
                <span class="avatar">
                <img :src="url+'/api/mediafiles/'+user.foto" alt="Admin Templates">
                <span class="status online"></span>
            </span>
        </a>
        <div class="dropdown-menu dropdown-menu-end" aria-labelledby="userSettings">
            <div class="header-profile-actions">
                <router-link class = "d-flex align-items-center" to="/admin/autenticacao/profile"> <span class = "fas fa-user" style="margin-right:10px"></span> Meu Perfil</router-link>
                <router-link v-if = "user.nivel === 'Administrador' || user.nivel === 'IT'" class = "d-flex align-items-center" to ="/admin/auth/security-logs"> <span class = "fas fa-bell" style="margin-right:10px"></span>Reg. de Atividades</router-link>
                <router-link v-if = "user.nivel === 'Administrador' || user.nivel === 'IT'" class = "d-flex align-items-center" to ="/admin/configuracao"> <span class = "fas fa-cog" style="margin-right:10px"></span> Configuração</router-link>
                <router-link class = "d-flex align-items-center" to="/admin/autenticacao/logout"> <span class = "fas fa-sign-out-alt" style="margin-right:10px"></span> Terminar Sessão</router-link>
            </div>
        </div>
        </li>
    </ul>
    <!-- Header actions end -->

    </div>
    <!-- Header actions ccontainer end -->

</div>
</template>
<script>
    import {url} from '../../../helpers/api'
    import { mapState } from 'vuex';
    export default{
        name:"Navbar_Comp",
        props:{
            page:String
        },
        data(){
            return{
             userData:{},
             url:''
            }
        },
        created(){
            this.url = url;
        },
        computed:{
            ...mapState(['user'])
        }
    }

</script>