<template>
    <div class="text-center">
        <Loader/>
    </div>
</template>
<script>
import Loader from './components/Loader.vue'
import { mapMutations, mapState } from "vuex";
import axios from 'axios'
import { url } from '@/helpers/api';
export default {
    name:"logout_view",
    components:{Loader},
    data(){
        return{
            showLoader:false
        }
    },
    computed:{
        ...mapState(['user']),
        ...mapMutations(['logout'])
    },
    mounted(){
        axios
        .put(`${url}/api/utilizadores/status/${this.$store.state.user.id}/`, {
            status:0
        })
        .then((res) => {
            if(res.data.message === "Success"){
                localStorage.clear()
                this.$router.push("/")
            }else{
                this.$swal.fire({
                    title:"Erro",
                    text:"Não foi possível terminar sessão, por favor tente novamente",
                    icon:"error",
                })
                .then(()=> {
                    this.$router.push('/dashboard')
                })
            }
        })
        
    }
}
</script>