<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% if(session.getAttribute("DOC_USER") == null) 
   {
     response.sendRedirect("../index.html");
   }
%>
<!DOCTYPE html>
<html>

<%@include file="Head.jsp" %>

<body>
    <!--Bloque necesario para El efecto Sidebar-->
    <div class="page-wrapper chiller-theme sidebar-bg bg3 toggled">
        <!--Sidebar Menu-->
        <header>
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
        </header>
        <!--/Sidebar Menu-->

        <!-- Contenido  -->
        <main class="page-content">
            <div class="container-fluid">

                <section>
                    <div class="row">
                        <div class="col">
                            <h1 class="h1"><i class="fas fa-desktop"></i><strong> Panel de Administración</strong> </h1>
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item active" aria-current="page">Inicio</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </section>

                <hr class="hr blue-grey">

                <section>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card-deck">
                                <div class="card stylish-color  text-white">
                                    <div class="card-body">
                                        <div class="clearfix">
                                            <div class="float-left">
                                                <i class="fa fa-user-check fa-5x" style="color: green"></i>
                                            </div>
                                            <div class="float-right">
                                                <p><strong>Usuarios en Linea</strong></p>
                                                <h1 class="h1 text-center">5</h1>
                                            </div>
                                        </div>
                                        <p class="card-text mt-3"><span style="color:white"><i class="fa fa-question-circle"></i>
                                                Todos
                                                los usuarios conectados en la plataforma</span></p>
                                    </div>
                                </div>

                                <div class="card info-color text-white">
                                    <div class="card-body">
                                        <div class="clearfix">
                                            <div class="float-left">
                                                <i class="fas fa-graduation-cap fa-5x"></i>
                                            </div>
                                            <div class="float-right">
                                                <p><strong>Facultades Registradas</strong></p>
                                                <h1 class="h1 text-center">1</h1>
                                            </div>
                                        </div>
                                        <p class="card-text mt-3"><span class="text-white"><i class="fa fa-question-circle"></i>
                                                Todas las facultades registrados en la plataforma</span> </p>
                                    </div>
                                </div>

                                <div class="card unique-color text-white">
                                    <div class="card-body">
                                        <div class="clearfix">
                                            <div class="float-left">
                                                <i class="fa fa-user-tie fa-5x"></i>
                                            </div>
                                            <div class="float-right">
                                                <p><strong>Profesores Registrados</strong></p>
                                                <h1 class="h1 text-center">1</h1>
                                            </div>
                                        </div>
                                        <p class="card-text mt-3"><span class="text-white"><i class="fa fa-question-circle"></i>
                                                Todos los profesores registrados en la plataforma</span> </p>
                                    </div>
                                </div>

                                <div class="card rgba-indigo-strong">
                                    <div class="card-body">
                                        <div class="clearfix">
                                            <div class="float-left">
                                                <i class="fa fa-user-graduate fa-5x"></i>
                                            </div>
                                            <div class="float-right">
                                                <p><strong>Estudiantes Registrados</strong></p>
                                                <h1 class="h1 text-center">1</h1>
                                            </div>
                                        </div>
                                        <p class="card-text mt-3"><span class="text-white"><i class="fa fa-question-circle"></i>
                                                Todos los estudiantes registrados en la plataforma</span> </p>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </section>

                <hr class="hr blue-grey">

                <section>
                    <div class="row">
                        <div class="col-8">
                            <h4 class="flex-column align-items-start"><i class="fas fa-bug"></i> Logs</h4>
                            <table id="Table_Logs" class="table table-striped table-hover table-responsive-md">
                                <thead class="thead-dark">
                                    <tr>
                                        <th>Nombre y Apellidos</th>
                                        <th>Tipo de Usuario</th>
                                        <th><i class="fas fa-cogs"></i> Accion</th>
                                        <th>Descripcion</th>
                                        <th><i class="far fa-calendar-alt"></i> Fecha</th>
                                    </tr>
                                </thead>
                                <tfoot class="thead-dark">
                                    <tr>
                                        <th>Nombre y Apellidos</th>
                                        <th>Tipo de Usuario</th>
                                        <th><i class="fas fa-cogs"></i> Accion</th>
                                        <th>Descripcion</th>
                                        <th><i class="far fa-calendar-alt"></i> Fecha</th>
                                    </tr>
                                </tfoot>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                        <div class="col-4 d-none d-md-block">
                            <div class="list-group">
                                <h4 class="flex-column align-items-start"><i class="fas fa-clipboard-check"></i>
                                    Novedades</h4>
                                <a href="" class="list-group-item list-group-item-action flex-column align-items-start">
                                    <div class="d-flex w-100 justify-content-between">
                                        <h5 class="mb-1"><strong>PoliNotes v1.2</strong></h5>
                                        <small><span class="badge badge-success">Nuevo</span></small>
                                    </div>
                                    <p class="mb-1">Descubre las novedades de las ultimas actualizaciones</p>
                                    <small>Administrador</small>
                                </a>
                                <a href="" class="list-group-item list-group-item-action flex-column align-items-start">
                                    <div class="d-flex w-100 justify-content-between">
                                        <h5 class="mb-1"><strong>Nuevos miembros del grupo</strong></h5>
                                    </div>
                                    <p class="mb-1">Integrantes del grupo:
                                        <ul>
                                            <li>Santiago Cardona</li>
                                            <li>Juan Pablo Maso</li>
                                            <li>Alejandro</li>
                                        </ul>
                                    </p>
                                    <small>Administrador</small>
                                </a>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </main>
        <!--/Contenido  -->
    </div>
    <!--/Bloque necesario para El efecto Sidebar-->
</body>

<%@include file="Footer.jsp" %>

</html>