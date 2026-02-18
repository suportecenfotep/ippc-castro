<template>
    <div class="login-page vh-100 d-flex align-items-center justify-content-center">
        <form @submit.prevent="signin" class="">
            <div class="login-box">
                <div class="login-form">
                    <router-link to="#" class="login-logo">
                        <img src="./assets/images/nl.png" alt="Vico Admin" />
                    </router-link>
                    <div class="login-welcome mb-1">
                        Bem vindo ao sistema de gestão integrada do IPPC, <br /> 
                        Por favor insira as suas credencias para aceder a sua conta.
                    </div>
                    <div class="mb-3">
                        <label class="form-label"><span class="fas fa-user"></span> Utilizador</label>
                        <input type="text" class="form-control" v-model="auth.email">
                    </div>
                    <div class="mb-3">
                        <label class="form-label"><span class="fas fa-key"></span> Palavra-Passe</label>
                        <input type="password" class="form-control" v-model="auth.senha">
                    </div>
                </div>
                
                <button type="submit" class="btn btn-secondary shadow-sm w-100 border-0 rounded-3 text-uppercase">
                    Iniciar Sessão <span class="fas fa-sign-in-alt"></span>
                </button>

                <div class="social-icons d-flex justify-content-center mt-4">
                    <a href="#" class="mx-3 text-secondary shadow-sm"><i class="fab fa-facebook-f fs-5"></i></a>
                    <a href="#" class="mx-3 text-secondary shadow-sm"><i class="fab fa-instagram fs-5"></i></a>
                    <a href="#" class="mx-3 text-secondary shadow-sm"><i class="fab fa-whatsapp fs-5"></i></a>
                </div>
            </div>

            <h3 style="font-size: 20px; margin-top: 40px; text-align: center; color:white">
                © Núcleo Lógico, {{ new Date().getFullYear() }} <br/> 
                Todos os Direitos Reservados
            </h3>
        </form>
    </div>
</template>
<script>
    import { api, url } from '@/helpers/api';
	import './static'
	import { mapMutations } from 'vuex'
	import axios from 'axios';

    export default{
		name:"login_view",
		data(){
			return{
				auth:{
					email:'',
					senha:'',
				}
			}
		},
		mounted(){
			this.checkLicence()
		},
		methods:{
			...mapMutations(['login']),
			signin(e){
				e.preventDefault()
				if(this.auth.email === "" || this.auth.senha === ""){
					this.$swal.fire({
						title:"Alerta",
						icon:"warning",
						text:"Preencha Todos os campos"
					})
				}else{
					axios
					.post(`${url}/api/utilizadores/login`, this.auth)
					.then(res => {
						if(res.data.token){
							localStorage.setItem("usuario", JSON.stringify(res.data))
							localStorage.setItem("user", JSON.stringify(res.data.data))
							this.login({user:res.data.data,token:res.data.token});
							this.$router.push("/dashboard")
						}else{
							this.$swal.fire({
								title:"Erro",
								text:"Utilizador ou Palavra-Passe Incorrectos",
								icon:"warning"
							})
						}
					})
					.catch(() => {
						this.$swal.fire({
							title:"Erro",
							text:"Utilizador ou Palavra-Passe Incorrectos",
							icon:"warning"
						})
					})
				}
			},
			checkLicence(){
				api
				.get("/license/read/")
				.then(res => {
					console.log(res.data)
				})
				.catch(err => {
					if(err.response.data.message === "Licença não encontrada"){
						this.$router.push("/licence")
					}else if (err.response.data.message === "Licença Expirada"){
						this.$router.push("/licence")
					}
				})
			}
		}
    }

</script>
<style scoped>
.login-page {
    background: #005F6B;
}
.form-label {
    color: black;
}
/* Estilo para os links das redes sociais */
.social-icons a {
    transition: transform 0.2s;
    background: white;
    width: 40px;
    height: 40px;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 50%;
    text-decoration: none;
}
.social-icons a:hover {
    transform: scale(1.1);
    color: #005F6B !important;
}
</style>