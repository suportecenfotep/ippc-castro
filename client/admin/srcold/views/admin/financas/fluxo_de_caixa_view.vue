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
        <Navbar page = "Tesouraria / Fluxo de Caixa"/>
        <!-- Page header ends -->

        <!-- Content wrapper scroll start -->
        <div class="content-wrapper-scroll">

          <!-- Content wrapper start -->
          <div class="content-wrapper">

            <!-- Row start -->
            <div class="row">
              <div class="col-12">
                <div class="card p-2">
                  <div class="row p-2">
                          <div class="col-md-6">
                            <label class="mb-1">Selecione o período</label><br>
                            <div class="d-flex align-items-center">
                                <b class="me-1">DE</b>
                                <input
                                    type="date"
                                    class="form-control"
                                    v-model="filter_data.start_date"
                                >
                                <b class="mx-1">A</b>
                                <input
                                    type="date"
                                    class="form-control"
                                    v-model="filter_data.end_date"
                                >
                            </div>
                          </div>

                          <div class="col-md-6">
                            <label class="text-white mb-1">.</label><br>
                            <button @click = "filterFluxo" class="btn btn-info text-uppercase fw-bold">
                                <span class="fas fa-search"></span> Filtrar
                            </button>
                            <button @click = "generatePDF" v-if="entradas.length > 0" class="btn btn-danger mx-2 text-uppercase fw-bold ">
                                <span class="fas fa-file-pdf"></span> Imprimir
                            </button>
                            <button @click="exportSAFT" v-if="entradas.length > 0" class="btn btn-success text-uppercase fw-bold">
                                <span class="fas fa-file-code"></span> Exportar SAF-T
                            </button>
                            <!-- <button @click="repairHistory" class="btn btn-warning mx-2 text-uppercase fw-bold">
                                <span class="fas fa-tools"></span> Reparar Hash
                            </button> -->
                          </div>
                      </div>
                </div>
                <div class="card">
                  <div class="card-header">
                    <h5>ENTRADAS</h5>
                  </div>
                  <div class="card-body">
                    <DataTable 
                      ref="table"
                      :data = "entradas" 
                      :columns = "entradasColums" 
                      :options="{ select: true, language:language }"
                      class="display table table-striped table-bordered">
                        <thead>
                          <tr class = "bg-secondary">
                            <th>DESCRIÇÃO</th>
                            <th>ESTUDANTE</th>
                            <th>VALOR</th>
                            <th>FUNCIONARIO</th>
                            <th>DATA</th>
                          </tr>
                        </thead>
                      </DataTable>

                  </div>
                  <div class="card-footer">
                      <div class="float-end">
                          <p>Resultado: <b>{{numberFormat(totalReceita,2,',','.')}}Kz</b></p>
                      </div>
                  </div>
                </div>

                 <div class="card">
                  <div class="card-header">
                    <h5>SAIDAS</h5>
                  </div>
                  <div class="card-body">
                    <DataTable 
                      ref="table"
                      :data = "despesas" 
                      :columns = "saidasColums" 
                      :options="{ select: true, language:language }"
                      class="display table table-striped table-bordered"
                      >
                        <thead>
                          <tr class = "bg-secondary">
                            <th>DESCRIÇÃO</th>
                            <th>REFERÊNCIA</th>
                            <th>VALOR</th>
                            <th>FUNCIONARIO</th>
                            <th>DATA</th>
                          </tr>
                        </thead>
                      </DataTable>
                  </div>
                  <div class="card-footer">
                      <div class="float-end">
                          <p>Resultado: <b>{{numberFormat(totalDespesa,2,',','.')}}Kz</b></p>
                      </div>
                  </div>
                </div>
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
        <Loader v-if="isLoading"/>
      </div>
    </div>
    <!-- Page wrapper end -->
</template>

<script>
    import '../static';
    import Sidebar from '../components/Sidebar.vue';
    import Navbar from '../components/Navbar.vue';
    import Footer from '../components/Footer.vue';
    import Loader from '../components/Loader.vue';
    import {api,numberFormat,language, url} from '../../../helpers/api';
    import moment from 'moment';
    import DataTable from 'datatables.net-vue3';
    import DataTablesCore from 'datatables.net';
    import Select from 'datatables.net-select';
    import jsPDF from 'jspdf';
    import 'jspdf-autotable';

    DataTable.use(DataTablesCore);
    DataTable.use(Select);

    export default{
        name:"fluxo_de_caixa_view",
        components:{Sidebar,Navbar,Footer,Loader,DataTable},
        data(){
          return{
              title:"Fluxo de Caixa",
              dataTable:null,
              selectedRow: null,
              despesas:[],
              entradas:[],
              isLoading:false,
              totalDespesa:0,
              totalReceita:0,
              entradasColums: [
                  { data: 'descricao' },
                  { 
                    data: null,
                    render:(data)=>{
                      return `${data.Estudante.nome}`
                    }
                  },
                  { 
                    data: "totalPrice",
                    render:(data)=>{
                      return `${numberFormat(data,2,',','.')}`
                    }
                  },
                  { 
                    data: null,
                    render:(data)=>{
                      return `${data.User.nome}`
                    }
                  },
                  { 
                    data: "createdAt",
                    render:(data)=>{
                      return `${moment(data.createdAt).format("DD-MM-YYYY HH:mm:ss")}`
                    }
                  }
              ],
              saidasColums: [
                  { data: 'descricao' },
                  { data: 'referencia' },
                  { 
                    data: "valor",
                    render:(data)=>{
                      return `${numberFormat(data,2,',','.')}`
                    }
                  },
                  { 
                    data: null,
                    render:(data)=>{
                      return `${data.User.nome}`
                    }
                  },
                  { 
                    data: "createdAt",
                    render:(data)=>{
                      return `${moment(data.createdAt).format("DD-MM-YYYY HH:mm:ss")}`
                    }
                  }
              ],
              filter_data:{
                  start_date:'',
                  end_date:''
              },
              language:language
          }
        },
        mounted() {
        },
        methods:{
            filterFluxo(){
             this.totalDespesa = 0;
             this.totalReceita = 0;
             const {start_date, end_date} = this.filter_data;
              if(!start_date || !end_date){
                  this.$swal.fire({
                    title:"Notificação",
                    icon:"warning",
                    text:"Preencha todos os campos"
                  })
              }else{
                api
                .get(`/fluxo-de-caixa/start/${start_date}/end/${end_date}`)
                .then(res => {
                    this.despesas = res.data.saidas;
                    this.entradas = res.data.entradas;
                    res.data.saidas.map(item => {
                        this.totalDespesa += item.valor;
                    })
                    res.data.entradas.map(item => {
                        this.totalReceita += item.totalPrice;
                    })
                })
                .catch(err => {
                    console.log(err)
                })
              }
            },

            async repairHistory() {
              // Confirmação de segurança antes de prosseguir
              const result = await this.$swal.fire({
                  title: 'Reparar Histórico?',
                  text: "Isso irá gerar números e assinaturas digitais para todos os pagamentos pendentes. Esta ação é irreversível!",
                  icon: 'warning',
                  showCancelButton: true,
                  confirmButtonColor: '#f1f1f1',
                  cancelButtonColor: '#d33',
                  confirmButtonText: 'Sim, reparar agora!',
                  cancelButtonText: 'Cancelar'
              });

              if (result.isConfirmed) {
                  this.isLoading = true;
                  try {
                      const response = await api.post('/pagamentos/admin/repair-history');
                      
                      await this.$swal.fire({
                          title: 'Concluído!',
                          text: response.data.message,
                          icon: 'success'
                      });

                      // Recarregar os dados se houver filtro ativo
                      if (this.filter_data.start_date) this.filterFluxo();

                  } catch (error) {
                      console.error(error);
                      this.$swal.fire({
                          title: 'Erro na Reparação',
                          text: error.response?.data?.error || 'Erro interno ao processar documentos.',
                          icon: 'error'
                      });
                  } finally {
                      this.isLoading = false;
                  }
              }
          },

            async exportSAFT() {
            const { start_date, end_date } = this.filter_data;

            if (!start_date || !end_date) {
                return this.$swal.fire({
                    title: "Atenção",
                    icon: "warning",
                    text: "Selecione o período para exportar o SAF-T"
                });
            }

            this.isLoading = true;

            try {
                // Chamada à rota que configuramos no backend
                const response = await api.get(`/pagamentos/export/saft`, {
                    params: { start_date, end_date },
                    responseType: 'blob' // Importante para lidar com arquivos
                });

                // Criar um link temporário para download
                const urlBlob = window.URL.createObjectURL(new Blob([response.data]));
                const link = document.createElement('a');
                link.href = urlBlob;
                
                // Nome do arquivo: SAFT_Instituicao_Data.xml
                const fileName = `SAFT_EXPORT_${start_date}_A_${end_date}.xml`;
                link.setAttribute('download', fileName);
                
                document.body.appendChild(link);
                link.click();
                
                // Limpeza
                link.remove();
                window.URL.revokeObjectURL(urlBlob);

                this.$swal.fire({
                    title: "Sucesso",
                    icon: "success",
                    text: "Ficheiro SAF-T gerado com sucesso!"
                });

            } catch (error) {
                console.error("Erro ao exportar SAF-T:", error);
                this.$swal.fire({
                    title: "Erro",
                    icon: "error",
                    text: "Não foi possível gerar o ficheiro SAF-T. Verifique se existem documentos no período selecionado."
                });
            } finally {
                this.isLoading = false;
            }
        },

            gerarDocumento() {
              this.isLoading = true;
              
              const doc = new jsPDF();

              const columnsEntradas = [
                { header: 'DESCRIÇÃO', dataKey: 'descricao' },
                { header: 'ESTUDANTE', dataKey: 'estudante' },
                { header: 'VALOR', dataKey: 'totalPrice' },
                { header: 'FUNCIONÁRIO', dataKey: 'funcionario' },
                { header: 'DATA', dataKey: 'createdAt' }
              ];

              const columnsSaidas = [
                { header: 'DESCRIÇÃO', dataKey: 'descricao' },
                { header: 'REFERÊNCIA', dataKey: 'referencia' },
                { header: 'VALOR', dataKey: 'valor' },
                { header: 'FUNCIONÁRIO', dataKey: 'funcionario' },
                { header: 'DATA', dataKey: 'createdAt' }
              ];

              // Prepare data rows
              const rowsEntradas = this.entradas.map(item => ({
                descricao: item.descricao || '',
                estudante: item.Estudante?.nome || '',
                totalPrice: numberFormat(item.totalPrice, 2, ',', '.'),
                funcionario: item.User?.nome || '',
                createdAt: moment(item.createdAt).format('DD-MM-YYYY HH:mm:ss') || ''
              }));

              const rowsSaidas = this.despesas.map(item => ({
                descricao: item.descricao || '',
                referencia: item.referencia || '',
                valor: numberFormat(item.valor, 2, ',', '.'),
                funcionario: item.User?.nome || '',
                createdAt: moment(item.createdAt).format('DD-MM-YYYY HH:mm:ss') || ''
              }));

              // Adicionar o logotipo
              doc.addImage(`${url}/api/mediafiles/castro.jpeg`, 'JPEG', 90, 15, 25, 25);

              // Adicionar o cabeçalho com informações da empresa
              doc.setFontSize(12);
              doc.text('INSTITUTO POLITÉCNICO PRIVADO CASTRO', 58, 50);
              doc.text('"A Luz do Saber"', 85, 56);

              // Adicionar título
              doc.setFontSize(14);
              doc.text('FLUXO DE CAIXA', 20, 64);

              // Adicionar tabela de entradas
              doc.setFontSize(12);
              doc.text('ENTRADAS', 20, 80);
              doc.autoTable({
                columns: columnsEntradas,
                body: rowsEntradas,
                margin: { top: 90 },
                theme: 'grid'
              });

              // Adicionar tabela de saídas
              doc.setFontSize(12);
              doc.text('SAÍDAS', 20, doc.autoTable.previous.finalY + 20);
              doc.autoTable({
                columns: columnsSaidas,
                body: rowsSaidas,
                margin: { top: 90 },
                theme: 'grid'
              });

              // Adicionar totais
              const totalEntradas = this.totalReceita;
              const totalSaidas = this.totalDespesa;
              const saldo = totalEntradas - totalSaidas;

              doc.setFontSize(12);
              doc.text('TOTAL ENTRADAS:', 20, doc.autoTable.previous.finalY + 20);
              doc.text(numberFormat(totalEntradas, 2, ',', '.'), 120, doc.autoTable.previous.finalY + 20);

              doc.text('TOTAL SAÍDAS:', 20, doc.autoTable.previous.finalY + 30);
              doc.text(numberFormat(totalSaidas, 2, ',', '.'), 120, doc.autoTable.previous.finalY + 30);

              doc.text('SALDO A TRANSITAR:', 20, doc.autoTable.previous.finalY + 40);
              doc.text(numberFormat(saldo, 2, ',', '.'), 120, doc.autoTable.previous.finalY + 40);

              // Gerar e abrir o PDF
              this.isLoading = false;
              doc.output('dataurlnewwindow');
        },
        generatePDF() {
          this.isLoading = true;
          const {start_date, end_date} = this.filter_data;
          window.open(`${url}/api/documentos/fluxo-de-caixa/start/${start_date}/end/${end_date}`, "_blank")
          this.isLoading = false;
        },
        moment,
        numberFormat,
    },
    }

</script>

<style>
.selected {
  background-color: blue; 
}
</style>