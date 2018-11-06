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

        <!--Modal Registro de Facultad-->
        <div class="modal fade" id="Mod_Reg_Facultad" tabindex="-1" role="dialog" aria-labelledby="Mod_Reg_Facultad"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content rounded ">

                    <form id="Reg_Facultad" name="Reg_Facultad" method="POST" action="../../Registro?Peticion=RegistroFac">
                        <div class="form-group">

                            <!--Header-->
                            <div class="modal-header bg-dark d-block flex-center">
                                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                <h2 class="text-center text-white" style="font-family: cursive"><strong>Registro de
                                        Facultad</strong></h2>
                            </div>
                            <!--/Header-->

                            <!--Body-->
                            <div class="modal-body mx-3">
                                <div id="errorReg_Facultad" class="alert alert-danger d-none" role="alert">
                                    <h6 class="h6 text-center">Usuario o contraseña incorrecta</h6>
                                </div>

                                <!--Simple Select with Search-->
                                <div class="form-group w-100">
                                    <i class="fa fa-lock"></i>
                                    <label>Decano de la Facultad</label>
                                    <select class="" id="select_decano">
                                        <option></option>
                                    </select>
                                </div>



                                <div class="md-form mb-4">
                                    <i class="fa fa-lock prefix grey-text"></i>
                                    <input type="password" id="PASSWORD_USER" name="PASSWORD_USER" class="form-control validate">
                                    <label data-success="" for="PASSWORD_USER">Contraseña</label>
                                </div>

                                <div class="justify-content-center align-items-center">
                                    <button id="ingreso" class="btn btn-blue d-block mx-auto" type="submit">Ingresar</button>
                                    <i id="load" class="fa fa-spinner fa-spin d-none text-center mx-auto"></i>
                                </div>


                            </div>
                            <!--/Body-->

                            <!--Footer-->
                            <div class="modal-footer">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-12 text-center">
                                            <p class="p">¿No tienes un usuario?
                                                <a href="" data-toggle="modal" data-target="#Registro" data-dismiss="modal">Registrate</a>
                                            </p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 text-center">
                                            <p class="p mx-auto"><a href="">Olvidaste tu contraseña?</a></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--/Footer-->

                        </div>
                    </form>

                </div>
            </div>
        </div>
        <!--/Modal Registro de Facultad-->

        <!--Modal de Registro de Usuario-->
        <div class="modal fade" id="Mod_Reg_Usuario" tabindex="-1" role="dialog" aria-labelledby="Mod_Reg_Usuario"
            aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content rounded ">

                    <form id="Form_Registro" name="Form_Registro" method="POST" action="../../Registro?Peticion=RegistroUser">
                        <div class="form-group">

                            <!--Header-->
                            <div class="modal-header bg-dark d-block flex-center">
                                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                <h2 class="text-center text-white" style="font-family: cursive"><strong>Registro de
                                        Usuario</strong></h2>
                            </div>
                            <!--/Header-->

                            <!--Body-->
                            <div class="modal-body mx-3">
                                <div class="container">
                                    <div class="row">
                                        <div class="col justify-content-center align-items-center">
                                            <div id="Sucess" class="alert alert-success d-none" role="alert">
                                                <h6 class="h6 text-center">Usuario registrado con exito</h6>
                                            </div>
                                            <div class="md-form">
                                                <div class="select">
                                                    <select id="ID_PERFIL_USER" name="ID_PERFIL_USER" class="select-text"
                                                        required>
                                                        <option value="" disabled selected></option>
                                                        <option value="1">Administrador</option>
                                                        <option value="2">Alumno</option>
                                                        <option value="3">Profesor</option>
                                                        <option value="4">Decano</option>
                                                    </select>
                                                    <span class="select-highlight"></span>
                                                    <span class="select-bar"></span>
                                                    <label class="select-label">Seleccione el Tipo de Usuario</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col d-flex justify-content-center">
                                            <h4 class="h1" class="text-center" style="font-family: P_cursive">Informacion
                                                de Contacto</h4>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-4">
                                            <div class="md-form">
                                                <i class="fa fa-user-circle prefix grey-text"></i>
                                                <input type="text" id="NOMBRE_USER" name="NOMBRE_USER" class="form-control validate"
                                                    aria-describedby="NOMBRE_USER">
                                                <label data-success="" for="NOMBRE_USER">Nombres</label>
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <div class="md-form">
                                                <input type="text" id="APELLIDOS_USER" name="APELLIDOS_USER" class="form-control validate"
                                                    aria-describedby="APELLIDOS_USER">
                                                <label data-success="" for="APELLIDOS_USER">Apellidos</label>
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <div class="md-form">
                                                <i class="fas fa-address-card prefix grey-text"></i>
                                                <input type="text" id="DOC_USER" name="DOC_USER" class="form-control validate"
                                                    aria-describedby="DOC_USER">
                                                <label data-success="" for="DOC_USER">Documento</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-6">
                                            <div class="md-form">
                                                <i class="far fa-envelope prefix grey-text"></i>
                                                <input type="text" id="CORREO_USER" name="CORREO_USER" class="form-control validate"
                                                    aria-describedby="CORREO_USER">
                                                <label data-success="" for="CORREO_USER" class="mt-2">Correo
                                                    Electronico</label>

                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="md-form mb-5">
                                                <i class="fa fa-user prefix grey-text"></i>
                                                <input type="text" id="R_NICK_USER" name="R_NICK_USER" class="form-control validate"
                                                    aria-describedby="R_NICK_USER">
                                                <label data-success="" for="R_NICK_USER">Usuario</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-6">
                                            <div class="md-form mb-4">
                                                <i class="fa fa-lock prefix grey-text"></i>
                                                <input type="password" id="R_PASSWORD_USER" name="R_PASSWORD_USER"
                                                    class="form-control validate">
                                                <label data-success="" for="R_PASSWORD_USER">Contraseña</label>

                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="md-form mb-4">
                                                <i class="fa fa-lock prefix grey-text"></i>
                                                <input type="password" id="pwd" name="pwd" class="form-control validate">
                                                <label data-success="" for="pwd">Confirmar Contraseña</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--/Body-->

                            <!--Footer-->
                            <div class="modal-footer">
                                <div class="container">
                                    <div class="row">
                                        <div class="d-block flex-center mx-auto">
                                            <button id="R_ingreso" class="btn btn-secondary" type="submit">Registrar</button>
                                            <i id="R_load" class="fa fa-spinner fa-spin d-none text-center mx-auto"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--/Footer-->

                        </div>
                    </form>

                </div>
            </div>
        </div>
        <!--/Modal de Registro de Usuario-->

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

                <section>
                    <div class="row">
                        <div class="col">
                            <div class="btn-group btn-group-sm" role="group" aria-label="Basic example">
                                <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#Mod_Reg_Facultad">Registrar
                                    Facultad</button>
                                <button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#Mod_Reg_Usuario">Registrar
                                    Usuario</button>
                            </div>
                        </div>
                    </div>
                    <br>
                </section>

                <section>
                    <div class="row">
                        <div class="col">
                            <table id="Table_Facultad" class="table table-striped table-hover table-responsive-md">
                                <thead class="thead-dark">
                                    <tr>
                                        <th></th>
                                        <th><i class="fas fa-user"></i> Decano</th>
                                        <th>Código</th>
                                        <th>Facultad</th>
                                    </tr>
                                </thead>
                                <tfoot class="thead-dark">
                                    <tr>
                                        <th></th>
                                        <th><i class="fas fa-user"></i> Decano</th>
                                        <th>Código</th>
                                        <th>Facultad</th>
                                    </tr>
                                </tfoot>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </section>


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
    <%@include file="Scripts.jsp" %>
</body>

</html>