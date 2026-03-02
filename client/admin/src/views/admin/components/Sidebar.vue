<template>
    <div>
        <div 
            v-if="sidebarActive" 
            class="sidebar-overlay d-lg-none" 
            @click="closeSidebar"
        ></div>

        <nav class="sidebar-wrapper" :class="{ 'sidebar-active': sidebarActive }">
            <div class="sidebar-brand">
                <router-link to="/dashboard" class="logo">
                    <img src="../assets/images/nl.png" alt="IPPC" />
                </router-link>
            </div>
            <div class="sidebar-menu">
                <div class="sidebarMenuScroll" style="overflow-y:auto">
                    <ul>
                        <li class="nav-link">
                            <router-link to="/dashboard">
                                <i class="fas fa-home"></i> PÁGINA INICIAL
                            </router-link>
                        </li>

                        <li v-for="item in filteredItems" :key="item.id" class="sidebar-dropdown">
                            <a href="#" @click.prevent="toggleSubMenu($event)">
                                <i :class="item.icon"></i>
                                <span class="menu-text">{{ item.label }}</span>
                            </a>
                            <div class="sidebar-submenu">
                                <ul>
                                    <li v-for="subItem in item.subItems" :key="subItem.id">
                                        <router-link :to="subItem.path">{{ subItem.label }}</router-link>
                                    </li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            </nav>
    </div>
</template>

<script>
import menuItems from './menu'; // Importa o array único
import { mapState } from 'vuex';

export default {
    name: "sidebar_comp",
    computed: {
        ...mapState(['user', 'sidebarActive']), // Mapeia o usuário e o estado do toggle mobile
        
        filteredItems() {
            const userRole = this.user?.nivel;
            if (!userRole) return [];

            // Filtra o array menuItems: só retorna itens onde o role do user está incluso
            return menuItems.filter(item => item.roles.includes(userRole));
        }
    },
    methods: {
        toggleSubMenu(event) {
            const parent = event.currentTarget.parentElement;
            const submenu = event.currentTarget.nextElementSibling;
            
            // Toggle das classes para abrir/fechar submenu
            parent.classList.toggle('active');
            if (submenu) {
                submenu.classList.toggle('active');
            }
        },
        closeSidebar() {
            // Fecha o menu mobile ao clicar no overlay
            this.$store.commit('TOGGLE_SIDEBAR');
        }
    }
};
</script>

<style scoped>
    /* Transição suave para o menu mobile */
    .sidebar-wrapper {
        transition: all 0.3s ease;
    }

    /* CSS para submenus */
    .sidebar-submenu {
        display: none;
    }
    
    /* Quando o item pai tem a classe active, mostra o submenu */
    .sidebar-dropdown.active .sidebar-submenu {
        display: block;
    }

    /* Regras para Mobile (Telas menores que 992px) */
    @media (max-width: 991.98px) {
        .sidebar-wrapper {
            position: fixed;
            top: 0;
            left: -270px; /* Escondido à esquerda */
            height: 100vh;
            z-index: 1050;
            width: 270px;
        }

        .sidebar-wrapper.sidebar-active {
            left: 0; /* Desliza para dentro da tela */
        }

        /* Overlay escuro de fundo */
        .sidebar-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            background: rgba(0, 0, 0, 0.5);
            z-index: 1040;
        }
    }
</style>