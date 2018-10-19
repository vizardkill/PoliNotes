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
                        <h1 class="h1"><i class="fas fa-graduation-cap"></i><strong> Facultades</strong> </h1>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="Inicio.jsp">Inicio</a></li>
                                <li class="breadcrumb-item ">Universidad</li>
                                <li class="breadcrumb-item active" aria-current="page">Facultades</li>
                            </ol>
                        </nav>

                    </div>
                </div>

                <hr class="hr blue-grey">

                <div class="row">
                    <div class="col">
                        
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