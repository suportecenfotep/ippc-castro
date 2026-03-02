import { createRouter, createWebHashHistory } from 'vue-router'

function isAuthenticated() {
  return localStorage.getItem('usuario') !== null;
}

const routes = [

  //ROUTES FOR ADMIN
  {
    path: '/',
    name: 'admin_login',
    component: () => import('../views/admin/login.vue'),
    meta: { requiresAuth: false } 
  },
  {
    path: '/dashboard',
    name: 'admin_dashboard',
    component: () => import('../views/admin/dashboard.vue'),
    meta: { requiresAuth: true } 
  },
  {
    path: '/licence',
    name: 'admin_licence',
    component: () => import('../views/admin/licence.vue'),
    meta: { requiresAuth: false } 
  },

  //CONFIGURACAO
  {
    path: '/admin/configuracao',
    name: 'admin_config',
    component: () => import('../views/admin/configuracao/configuracao_view.vue'),
    meta: { requiresAuth: true } 
  },

  //ESTUDANTES
  {
    path: '/admin/estudantes/lista-geral-estudantes',
    name: 'admin_student_student',
    component: () => import('../views/admin/secretaria/estudante_view'),
    meta: { requiresAuth: true } 
  },
  {
    path: '/admin/secretaria/matricular-estudante/:estudante_id/',
    name: 'admin_secretary_registration_student',
    component: () => import('../views/admin/secretaria/matricular_estudante_view.vue'),
    meta: { requiresAuth: true } 
  },
  {
    path: '/admin/estudantes/matriculados',
    name: 'admin_secretary_registration',
    component: () => import('../views/admin/secretaria/matricula_view'),
    meta: { requiresAuth: true } 
  },

  //FINANCES
  {
    path: '/admin/finances/emolumento-preco',
    name: 'admin_finances_emolument_fees',
    component: () => import('../views/admin/financas/emolumento_preco_view.vue'),
    meta: { requiresAuth: true } 
  },
  {
    path: '/admin/finances/pagamentos/:estudante_id',
    name: 'admin_finances_payment_view',
    component: () => import('../views/admin/financas/pagamento_view.vue'),
    meta: { requiresAuth: true } 
  },
  {
    path: '/admin/finances/despesas',
    name: 'admin_finances_saida_view',
    component: () => import('../views/admin/financas/despesa_view.vue'),
    meta: { requiresAuth: true } 
  },
  {
    path: '/admin/finances/fluxo-de-caixa',
    name: 'admin_finances_fluxo_de_caixa',
    component: () => import('../views/admin/financas/fluxo_de_caixa_view.vue'),
    meta: { requiresAuth: true } 
  },
  {
    path: '/admin/finances/devedores',
    name: 'admin_devedores',
    component: () => import('../views/admin/financas/devedores_view.vue'),
    meta: { requiresAuth: true } 
  },

  //AUTENTICAÇÃO
  {
    path: '/admin/autenticacao/users',
    name: 'admin_autenticacao_users',
    component: () => import('../views/admin/autenticacao/users_view.vue'),
    meta: { requiresAuth: true } 
  },
  {
    path: '/admin/auth/security-logs',
    name: 'admin_autenticacao_security_logs',
    component: () => import('../views/admin/autenticacao/security_log_view.vue'),
    meta: { requiresAuth: true } 
  },
  {
    path: '/admin/autenticacao/logout',
    name: 'admin_autenticacao_logout',
    component: () => import('../views/admin/logout.vue'),
    meta: { requiresAuth: true } 
  },
  {
    path: '/admin/autenticacao/profile',
    name: 'admin_autenticacao_profile',
    component: () => import('../views/admin/profile.vue'),
    meta: { requiresAuth: true } 
  },


  //UTILS
  { 
    path: '/:pathMatch(.*)*',
    name: 'NotFound', 
    component: () => import('../views/404_view.vue'),
    meta: { requiresAuth: false } 
  },
]

const router = createRouter({
  history: createWebHashHistory(process.env.BASE_URL),
  routes
})

// Guarda de navegação para verificar autenticação
router.beforeEach((to, from, next) => {
  if (to.matched.some(record => record.meta.requiresAuth)) {
    if (!isAuthenticated()) {
      next('/');
    } else {
      next();
    }
  } else {
    next();
  }
});

export default router
