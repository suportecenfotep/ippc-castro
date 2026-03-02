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
        <Navbar page = "Definições do Sistema"/>
        <!-- Page header ends -->

        <!-- Content wrapper scroll start -->
        <div class="content-wrapper-scroll">

          <!-- Content wrapper start -->
          <div class="content-wrapper">

            <!-- Row start -->
            <div class="row">
               <div class="col-xxl-12">
                <div class="card overflow-auto">
                  <div class="card-body">
                    <div class="custom-tabs-container">
                      <ul class="nav nav-tabs d-flex" id="customTab" role="tablist">
                        <li class="nav-item" role="presentation">
                          <a class="nav-link active" id="tab-one" data-bs-toggle="tab" href="#one" role="tab"
                            aria-controls="one" aria-selected="true">
                            <span class = "fas fa-database"></span> A. Lectivo</a>
                        </li>
                        <li class="nav-item" role="presentation">
                          <a class="nav-link" id="tab-four" data-bs-toggle="tab" href="#four" role="tab"
                            aria-controls="four" aria-selected="false">
                            <span class = "fas fa-database"></span> E. Natureza</a>
                        </li>
                        <li class="nav-item" role="presentation">
                          <a class="nav-link" id="tab-five" data-bs-toggle="tab" href="#five" role="tab"
                            aria-controls="five" aria-selected="false">
                            <span class = "fas fa-database"></span> E. Nome</a>
                        </li>
                        <li class="nav-item" role="presentation">
                          <a class="nav-link" id="tab-eigth" data-bs-toggle="tab" href="#eigth" role="tab"
                            aria-controls="eigth" aria-selected="false">
                            <span class = "fas fa-database"></span> Classes
                            </a>
                        </li>
                        <li class="nav-item" role="presentation">
                          <a class="nav-link" id="tab-six" data-bs-toggle="tab" href="#six" role="tab"
                            aria-controls="six" aria-selected="false">
                            <span class = "fas fa-database"></span> Cursos
                          </a>
                        </li>
                        <li class="nav-item" role="presentation">
                          <a class="nav-link" id="tab-nine" data-bs-toggle="tab" href="#nine" role="tab"
                            aria-controls="nine" aria-selected="false">
                            <span class = "fas fa-database"></span> Periodos
                            </a>
                        </li>
                        <li class="nav-item" role="presentation">
                          <a class="nav-link" id="tab-seven" data-bs-toggle="tab" href="#seven" role="tab"
                            aria-controls="seven" aria-selected="false">
                            <span class = "fas fa-database"></span> Turmas
                            </a>
                        </li>
                        <li class="nav-item" role="presentation">
                          <a class="nav-link" id="tab-ten" data-bs-toggle="tab" href="#ten" role="tab"
                            aria-controls="ten" aria-selected="false">
                            <span class = "fas fa-database"></span> Disciplinas
                            </a>
                        </li>
                        <li class="nav-item" role="presentation">
                          <a class="nav-link" id="tab-twelve" data-bs-toggle="tab" href="#twelve" role="tab"
                            aria-controls="twelve" aria-selected="false">
                            <span class = "fas fa-database"></span> D. Classe
                            </a>
                        </li>
                      </ul>
                      <div class="tab-content" id="customTabContent">
                        <div class="tab-pane fade show active" id="one" role="tabpanel">
                          <Ano/>
                        </div>
                        <div class="tab-pane fade" id="three" role="tabpanel">
                          <CategoriaSala/>
                        </div>
                        <div class="tab-pane fade" id="four" role="tabpanel">
                          <EmolumentoNatureza/>
                        </div>
                        <div class="tab-pane fade" id="five" role="tabpanel">
                          <Emolumento/>
                        </div>
                        <div class="tab-pane fade" id="six" role="tabpanel">
                           <Curso/>
                        </div>
                        <div class="tab-pane fade" id="seven" role="tabpanel">
                           <Turma/>
                        </div>
                        <div class="tab-pane fade" id="eigth" role="tabpanel">
                           <Classe/>
                        </div>
                        <div class="tab-pane fade" id="nine" role="tabpanel">
                           <Periodo/>
                        </div>
                        <div class="tab-pane fade" id="ten" role="tabpanel">
                           <Disciplina/>
                        </div>
                        <div class="tab-pane fade" id="twelve" role="tabpanel">
                           <DisciplinaClasse/>
                        </div>
                      </div>
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

      </div>
    </div>
    <!-- Page wrapper end -->
</template>

<script>
    import '../static';
    import Sidebar from '../components/Sidebar.vue';
    import Navbar from '../components/Navbar.vue';
    import Footer from '../components/Footer.vue';
    import Ano from './ano_view'    
    import EmolumentoNatureza from './emolumento_natureza_view'    
    import Emolumento from './emolumento_view'    
    import Curso from './curso_view'    
    import Turma from './turma_view'    
    import Classe from './classe_view'    
    import Periodo from './periodo_view'    
    import Disciplina from './disciplina_view'    
    import DisciplinaClasse from './disciplina_classe_view'    
    export default{
        name:"config_view",
        components:{
            Sidebar,
            Navbar,
            Footer,
            Ano,
            EmolumentoNatureza,
            Emolumento,
            Curso,
            Turma,
            Classe,
            Periodo,
            Disciplina,
            DisciplinaClasse
        },
    }

</script>

<style>
.selected {
  background-color: blue; 
}
</style>