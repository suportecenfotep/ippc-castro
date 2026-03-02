<template>

    <div class = "fixed-template">
        <div class="row w-100">
            <div class="col-md-6 text-center overflow-hidden pt-5">
                <div style="width:80%; margin-left: 20%; margin-top: 20em;">
                    <h3>A sua licença expirou, por favor contacte o suporte técnico para a renovação da mesma</h3>
                    <p><b>Contactos: </b>+244 934 823 332 || <b>Email: </b><a href="mailto:ajosedomingos231@gmail.com">ajosedomingos231@gmail.com</a></p>
                    <input
                        type="password"
                        class="form-control text-center"
                        placeholder="Insira o código da Licensa"
                        v-model="licence.activation_code"
                        @blur = "generateLicence"
                        style = "display:none"
                    />
                </div>
            </div>

            <div class="col-md-6 text-center overflow-hidden">
                <div style="width:40%; margin-left: 30%; margin-top: 20em;">
                <img class = "w-100" src="../admin/assets/images/castro.jpeg"/>
                </div>
            </div>

            <div class="col-md-12 text-center mt-5">
                <h5>© Instituto Politécnico Privado Castro "A Luz Do Saber" {{ new Date().getFullYear() }}, Todos os Direitos Reservados</h5>
            </div>
        </div>
    </div>
   
</template>

<script>

    import { api } from "@/helpers/api";
    import "./static"

    export default{
        name:"licence_view",
        data(){
            return{
                licence:{
                    activation_code:""
                }
            }
        },
        methods:{
            generateLicence(){
                api
                .post("/license/create/", this.licence)
                .then(res => {
                    if(res.data.message === "Success"){
                        this.$swal.fire({
                            title:"Sucesso",
                            text:"Licença Gerada com sucesso",
                            icon:"success"
                        })
                        .then(() => {
                            this.$router.push("/")
                        })
                    }else{
                        this.$swal.fire({
                            title:"Erro",
                            text:"Não foi possível gerar a licensa",
                            icon:"error"
                        })
                    }
                    console.log(res)
                })
                .catch(err => {
                    console.log(err)
                })
            },
            checkLicence(){
				api
				.get("/license/read/")
				.then(() => {
                    this.$router.push("/")
				})
				.catch(err => {
					console.log(err)
				})
			}
        },
        mounted(){
            this.checkLicence()
        }
    }

</script>

<style>


</style>