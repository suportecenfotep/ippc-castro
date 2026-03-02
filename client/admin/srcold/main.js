import { createApp } from 'vue';
import App from './App.vue';
import router from './router';
import './views/admin/assets/fontawesome/css/all.css';
import 'sweetalert2/dist/sweetalert2.min.css';
import 'bootstrap/dist/js/bootstrap.bundle';
import 'datatables.net-bs5';
import 'datatables.net-buttons-bs5';
import 'datatables.net-responsive-bs5';
import VueSweetalert2 from 'vue-sweetalert2';
import store from './store'
import vSelect from 'vue-select'
import 'vue-select/dist/vue-select.css';
import ElementPlus from 'element-plus';
import 'element-plus/dist/index.css';

const app = createApp(App)

app.use(router)
app.use(VueSweetalert2);
app.use(ElementPlus);
app.use(store)
app.component('v-select', vSelect)
app.mount('#app')