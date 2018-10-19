<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% if(session.getAttribute("DOC_USER") == null) 
   {
     response.sendRedirect("../index.html");
   }
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>PoliNotes</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../../css/font-awesome-5.css">
    <!-- Bootstrap core CSS -->
    <link href="../../css/bootstrap.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="../../css/mdb.min.css" rel="stylesheet">
    <!-- Estilos personalizados -->
    <link href="../../css/select.css" rel="stylesheet">
    <link href="../../css/jqueryScrollBar.min.css" rel="stylesheet">
    <!-- Sidebar -->
    <link href="../../css/sidebar.css" rel="stylesheet">
    <link href="../../css/sidebar-themes.css" rel="stylesheet">
    <!-- DataTable -->
    <link rel="stylesheet" href="../../addons/DataTables/datatables.min.css">
</head>

<body>
    <!--Bloque necesario para El efecto Sidebar-->
    <div class="page-wrapper chiller-theme sidebar-bg bg3 toggled">
        <header>
            <!--Sidebar Menu-->
            <a id="show-sidebar" class="btn btn-sm btn-dark" href="#">
                <i class="fas fa-bars"></i>
            </a>
            <nav id="sidebar" class="sidebar-wrapper">

                <div class="sidebar-content">
                    <!--Logo-->
                    <div class="sidebar-brand">
                        <a href=""> <img class=" img-fluid" src="../../img/web/Index/logo-white.png" alt=""></a>
                        <div id="close-sidebar">
                            <i class="fas fa-times"></i>
                        </div>
                    </div>
                    <!--/Logo-->

                    <!--Header-->
                    <div class="sidebar-header">
                        <div class="user-pic rounded-circle">
                            <img class="img-fluid img-thumbnail rounded-circle" src="../../img/web/Sidebar/user.jpg"
                                alt="User picture">
                        </div>
                        <div class="user-info">
                            <span class="user-name">
                                <strong>${sessionScope['NICK_USER']}</strong>
                            </span>
                            <span class="user-role">Administrador</span>
                            <span class="user-status">
                                <i class="fa fa-circle"></i>
                                <span>En línea</span>
                            </span>
                        </div>
                    </div>
                    <!--/Header-->


                    <!--Buscador-->
                    <div class="sidebar-search">
                        <div>
                            <div class="input-group">
                                <input type="text" class="form-control search-menu sidebar-search-box" placeholder="Buscar...">
                                <div class="input-group-append">
                                    <span class="input-group-text">
                                        <i class="fa fa-search" aria-hidden="true"></i>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--/Buscador-->


                    <!--Menu-->
                    <div class="sidebar-menu">
                        <ul class="sidebar-search-list">

                            <li class="header-menu">
                                <span>General</span>
                            </li>
                            <li>
                                <a href="Inicio.jsp">
                                    <i class="fa fa-home"></i>
                                    <span>Inicio</span>
                                </a>
                            </li>

                            <li class="sidebar-dropdown">
                                <a href="#">
                                    <i class="fas fa-graduation-cap"></i>
                                    <span>Universidad</span>
                                </a>
                                <div class="sidebar-submenu">
                                    <ul>
                                        <li>
                                            <a href="Facultades.jsp">Facultades</a>
                                        </li>
                                        <li>
                                            <a href="#">Materias</a>
                                        </li>
                                        <li>
                                            <a href="#">Profesores</a>
                                        </li>
                                        <li>
                                            <a href="#">Estudiantes</a>
                                        </li>
                                        <li>
                                            <a href="AcercaDe.jsp">Acerca de</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>



                            <li class="header-menu">
                                <span>Extra</span>
                            </li>

                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-book"></i>
                                    <span>Documentación</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <!--Menu-->

                </div>

                <!--Footer-->
                <div class="sidebar-footer">

                    <div class="dropdown">
                        <a href="#" class="" id="dropdownMenuMessage" data-toggle="dropdown" aria-haspopup="true"
                            aria-expanded="false">
                            <i class="fa fa-cog" data-toggle="tooltip" title="Opciones"></i>
                            <span class="badge-sonar"></span>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuMessage">
                            <a class="dropdown-item" href="#"><i class="fa fa-user"></i> Mi perfil</a>
                            <a class="dropdown-item" href="#"><i class="fa fa-question"></i> Acerca de</a>
                        </div>
                    </div>
                    <div>
                        <a href="#">
                            <i class="fa fa-power-off" data-toggle="tooltip" title="Salir"></i>
                        </a>
                    </div>
                </div>
                <!--Footer-->


            </nav>
            <!--/Sidebar Menu-->
        </header>

        <!-- Contenido  -->
        <main class="page-content">
            <div class="container-fluid">

                <div class="row">
                    <div class="col">
                        <img src="../../img/web/Index/logo-uni.png" alt="" class="img-fluid">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="Inicio.jsp">Inicio</a></li>
                                <li class="breadcrumb-item" aria-current="page">Universidad</li>
                                <li class="breadcrumb-item active" aria-current="page">Acerca de</li>
                            </ol>
                        </nav>

                    </div>
                </div>

                <hr class="hr blue-grey">

                <div class="row">
                    <div class="col">
                        <div id="Banner_AcercaDe" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#Banner_AcercaDe" data-slide-to="0" class="active"></li>
                            </ol>
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img class="d-block w-100" src="../../img/web/Administracion/inscripciones.png" alt="First slide">
                                </div>
                            </div>
                            <a class="carousel-control-prev" href="#Banner_AcercaDe" role="button" data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#Banner_AcercaDe" role="button" data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                    </div>
                </div>

                <hr class="hr blue-grey">

                <div class="row">
                    <div class="col-8">
                        <h4 class="flex-column align-items-start"><i class="fas fa-book-reader"></i> Historia</h4>
                        <div class="card">
                            <div class="card-body">
                                <p class="card-text">El Politécnico Colombiano Jaime Isaza Cadavid es una Institución
                                    Universitaria de Colombia, con sede principal en la ciudad de Medellín. Se
                                    encuentra adscrita al Gobierno Departamental de Antioquia y fue fundada en marzo de
                                    1963. Ofrece educación superior en los niveles técnico, tecnológico y universitario
                                    mediante una oferta de programas académicos de pregrado y posgrado en distintas
                                    áreas de la ingeniería, la administración, las ciencias agrarias, la comunicación
                                    audiovisual, el deporte y la recreación. Su oferta académica incluye cursos de
                                    educación continuada y educación no formal.</p>
                            </div>
                            <div class="card-body">
                                <a href="https://es.wikipedia.org/wiki/Polit%C3%A9cnico_Colombiano_Jaime_Isaza_Cadavid"
                                    class="card-link"><span>Mas informacion</span></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-4">
                        <h4 class="flex-column align-items-start"><i class="fas fa-history"></i> Uso Frecuente</h4>
                        <div class="list-group-flush">
                            <a href="http://www2.politecnicojic.edu.co/polidinamico/polidinamico.php" class="list-group-item list-group-item-action flex-column align-items-start">
                                <div class="d-flex w-100 justify-content-between">
                                    <img src="../../img/web/Administracion/polidinamico.png" alt="" class=" img-fluid">
                                </div>
                            </a>
                            <a href="http://www.politecnicojic.edu.co/index.php/bibliotecas" class="list-group-item list-group-item-action flex-column align-items-start">
                                <div class="d-flex w-100 justify-content-between">
                                    <img src="../../img/web/Administracion/biblioteca.png" alt="" class=" img-fluid">
                                </div>
                            </a>
                            <a href="http://elpolivirtual.elpoli.edu.co/login/index.php" class="list-group-item list-group-item-action flex-column align-items-start">
                                <div class="d-flex w-100 justify-content-between">
                                    <img src="../../img/web/Administracion/polivirtual.png" alt="" class=" img-fluid">
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <!-- /Contenido" -->
        <footer class="page-footer font-small unique-color-dark">

            <!-- Copyright -->
            <div class="footer-copyright text-center py-3">© 2018 Copyright:
                <a href="http://www.politecnicojic.edu.co/"> Politecnico Colombiano Jaime Isaza Cadavid</a>
            </div>
            <!-- Copyright -->

        </footer>

    </div>
    <!--/Bloque necesario para El efecto Sidebar-->


    <!--JQuery-->
    <script type="text/javascript" src="../../js/jquery-3.3.1.min.js"></script>
    <!--JQuery Validation-->
    <script type="text/javascript" src="../../js/jquery.validate.js"></script>
    <script type="text/javascript" src="../../js/additional-methods.js"></script>
    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="../../js/popper.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="../../js/bootstrap.js"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="../../js/mdb.min.js"></script>
    <!--SmoothScroll-->
    <script type="text/javascript" src="../../js/modules/smooth-scroll.polyfills.js"></script>
    <!--Sidebar-->
    <script type="text/javascript" src="../../js/jqueryScrollBar.min.js"></script>
    <script type="text/javascript" src="../../js/sidebar.js"></script>
    <script type="text/javascript" src="../../js/inicio.js"></script>
    <!--DataTable-->
    <script type="text/javascript" src="../../addons/DataTables/datatables.min.js"></script>
    <script type="text/javascript" src="../../js/DataTables.js"></script>

</body>

</html>