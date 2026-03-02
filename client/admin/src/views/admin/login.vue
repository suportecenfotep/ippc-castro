<template>
  <div class="login-page vh-100 d-flex align-items-center justify-content-center">
    <div class="glass-shape shape-1"></div>
    <div class="glass-shape shape-2"></div>

    <div class="login-card animate__animated animate__fadeInUp">
      <form @submit.prevent="signin" class="login-form-content">
        
        <div class="text-center mb-2">
          <div class="logo-wrapper shadow-sm">
            <img src="./assets/images/nl.png" alt="IPPC Logo" class="img-fluid" />
          </div>
          <h2 class="system-title mt-3">Núcleo <span>Lógico</span></h2>
          <p class="system-subtitle">Gestão Académica & Analítica</p>
        </div>

        <div class="modern-input-group mb-4">
          <label class="small text-uppercase fw-bold text-light-muted">Utilizador</label>
          <div class="input-wrapper">
            <i class="fas fa-user-circle icon-field"></i>
            <input 
              type="text" 
              v-model="auth.email" 
              placeholder="Digite seu e-mail" 
              required
            />
          </div>
        </div>

        <div class="modern-input-group mb-4">
          <label class="small text-uppercase fw-bold text-light-muted">Palavra-Passe</label>
          <div class="input-wrapper">
            <i class="fas fa-fingerprint icon-field"></i>
            <input 
              :type="showPassword ? 'text' : 'password'" 
              v-model="auth.senha" 
              placeholder="••••••••" 
              required
            />
            <button type="button" class="btn-toggle" @click="showPassword = !showPassword">
              <i :class="['fas', showPassword ? 'fa-eye-slash' : 'fa-eye']"></i>
            </button>
          </div>
        </div>

        <button type="submit" class="btn-login-modern w-100 mt-2" :disabled="isLoading">
          <template v-if="!isLoading">
            <span>ACESSAR PAINEL</span>
            <i class="fas fa-arrow-right ms-2"></i>
          </template>
          <span v-else class="spinner-border spinner-border-sm"></span>
        </button>

        <div class="footer-section mt-5 text-center">
          <span class="divider-text">Conecte-se</span>
          <div class="social-links d-flex justify-content-center gap-3 mt-3">
            <a href="#" class="social-item"><i class="fab fa-facebook-f"></i></a>
            <a href="#" class="social-item"><i class="fab fa-instagram"></i></a>
            <a href="#" class="social-item"><i class="fab fa-whatsapp"></i></a>
          </div>
        </div>
      </form>
    </div>

    <div class="legal-footer">
      <p>© Núcleo Lógico, {{ new Date().getFullYear() }} | Todos os direitos reservados</p>
    </div>
  </div>
</template>

<script>
import { api, url } from '@/helpers/api';
import './static';
import { mapMutations } from 'vuex';
import axios from 'axios';

export default {
  name: "login_view",
  data() {
    return {
      auth: { email: '', senha: '' },
      isLoading: false,
      showPassword: false
    }
  },
  mounted() {
    this.checkLicence();
  },
  methods: {
    ...mapMutations(['login']),
    async signin() {
      if (!this.auth.email || !this.auth.senha) {
        return this.$swal.fire({ title: "Atenção", icon: "warning", text: "Preencha todos os campos." });
      }

      this.isLoading = true;
      try {
        const res = await axios.post(`${url}/api/utilizadores/login`, this.auth);
        if (res.data.token) {
          localStorage.setItem("usuario", JSON.stringify(res.data));
          localStorage.setItem("user", JSON.stringify(res.data.data));
          this.login({ user: res.data.data, token: res.data.token });
          this.$router.push("/dashboard");
        } else {
          throw new Error();
        }
      } catch (err) {
        this.$swal.fire({
          title: "Erro de Autenticação",
          text: "Credenciais inválidas ou erro de conexão.",
          icon: "error"
        });
      } finally {
        this.isLoading = false;
      }
    },
    async checkLicence() {
      try {
        await api.get("/license/read/");
      } catch (err) {
        const msg = err.response?.data?.message;
        if (msg === "Licença não encontrada" || msg === "Licença Expirada") {
          this.$router.push("/licence");
        }
      }
    }
  }
}
</script>

<style scoped>
/* Reset e Base */
.login-page {
  background: #0f172a; /* Azul Marinho Profundo */
  background-image: 
    radial-gradient(circle at 20% 30%, rgba(30, 64, 175, 0.2) 0%, transparent 40%),
    radial-gradient(circle at 80% 70%, rgba(15, 23, 42, 1) 0%, transparent 40%);
  position: relative;
  overflow: hidden;
  font-family: 'Inter', sans-serif;
}

/* Formas de Vidro ao Fundo */
.glass-shape {
  position: absolute;
  border-radius: 50%;
  filter: blur(80px);
  z-index: 1;
}
.shape-1 { width: 300px; height: 300px; background: #3b82f6; top: -100px; left: -100px; opacity: 0.3; }
.shape-2 { width: 400px; height: 400px; background: #1e40af; bottom: -150px; right: -150px; opacity: 0.2; }

/* Card Principal (Glassmorphism) */
.login-card {
  width: 100%;
  max-width: 440px;
  background: rgba(255, 255, 255, 0.03);
  backdrop-filter: blur(16px);
  -webkit-backdrop-filter: blur(16px);
  border: 1px solid rgba(255, 255, 255, 0.1);
  border-radius: 28px;
  padding: 3rem 2.5rem;
  z-index: 10;
  box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5);
}

/* Header */
.logo-wrapper {
  background: white;
  width: 70px;
  height: 70px;
  margin: 0 auto;
  border-radius: 18px;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 12px;
}

.system-title { color: white; font-weight: 800; letter-spacing: -0.5px; }
.system-title span { color: #3b82f6; }
.system-subtitle { color: #94a3b8; font-size: 0.85rem; }

/* Custom Inputs */
.text-light-muted { color: #64748b; font-size: 0.7rem; letter-spacing: 1px; }
.input-wrapper {
  position: relative;
  margin-top: 8px;
}
.icon-field {
  position: absolute;
  left: 15px;
  top: 50%;
  transform: translateY(-50%);
  color: #3b82f6;
  font-size: 1.1rem;
}
.input-wrapper input {
  width: 100%;
  background: rgba(255, 255, 255, 0.05);
  border: 1px solid rgba(255, 255, 255, 0.1);
  border-radius: 12px;
  padding: 12px 15px 12px 45px;
  color: white;
  transition: all 0.3s ease;
}
.input-wrapper input:focus {
  outline: none;
  background: rgba(255, 255, 255, 0.08);
  border-color: #3b82f6;
  box-shadow: 0 0 0 4px rgba(59, 130, 246, 0.1);
}
.btn-toggle {
  position: absolute;
  right: 15px;
  top: 50%;
  transform: translateY(-50%);
  background: none;
  border: none;
  color: #64748b;
  cursor: pointer;
}

/* Botão Moderno */
.btn-login-modern {
  background: #3b82f6;
  color: white;
  border: none;
  border-radius: 12px;
  padding: 14px;
  font-weight: 700;
  letter-spacing: 0.5px;
  transition: all 0.3s ease;
  box-shadow: 0 10px 15px -3px rgba(59, 130, 246, 0.3);
}
.btn-login-modern:hover:not(:disabled) {
  background: #2563eb;
  transform: translateY(-2px);
  box-shadow: 0 15px 20px -5px rgba(59, 130, 246, 0.4);
}
.btn-login-modern:disabled { opacity: 0.7; cursor: not-allowed; }

/* Footer */
.divider-text {
  display: flex;
  align-items: center;
  color: #475569;
  font-size: 0.7rem;
  text-transform: uppercase;
  letter-spacing: 1px;
}
.divider-text::before, .divider-text::after {
  content: ""; flex: 1; height: 1px; background: rgba(255,255,255,0.05); margin: 0 10px;
}

.social-item {
  width: 40px; height: 40px;
  display: flex; align-items: center; justify-content: center;
  border-radius: 10px;
  background: rgba(255,255,255,0.03);
  color: #94a3b8;
  border: 1px solid rgba(255,255,255,0.05);
  transition: all 0.2s ease;
  text-decoration: none;
}
.social-item:hover { background: #3b82f6; color: white; transform: scale(1.1); }

.legal-footer {
  position: absolute;
  bottom: 20px;
  color: #475569;
  font-size: 0.75rem;
}
</style>