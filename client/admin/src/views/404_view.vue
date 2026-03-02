<template>
    <div class="error-page" style="position:fixed; top:0; left:0; bottom:0; right:0">
         <div class="countdown-bg"></div>

		<div class="error-screen">
			<h1>404</h1>
			<h5 class="fw-bold">Pedimos desculpas!!!<br />Mas a pagina solicitada não foi encontrada.</h5>
			<a @click = "goBack" class="btn btn-outline-white ">Voltar a pagina anterior</a>
		</div>
    </div>
</template>
<script>
    import './admin/static'
    export default{
        name:'not_found',
        methods:{
            goBack(){
                this.$router.go(-1)
            }
        }
    }

</script>

<style scoped>
</style>