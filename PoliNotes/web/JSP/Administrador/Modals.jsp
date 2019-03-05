<!--Modal Sucess-->
<div class="modal fade right" id="Mod_Sucess" tabindex="-1" role="dialog" aria-labelledby="Mod_Sucess"
    aria-hidden="true" data-backdrop="false">
    <div class="modal-dialog modal-side modal-top-right modal-notify modal-success" role="document">

        <!--Content-->
        <div class="modal-content">
            <!--Header-->
            <div class="modal-header d-flex align-items-center">
                <i class="fas fa-check animated rotateIn text-white"></i>
                <p class="heading lead text-left " id="Text_Sucess"></p>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true" class="white-text">&times;</span>
                </button>
            </div>
        </div>
        <!--/.Content-->
    </div>
</div>
<!--Modal de Registro de Usuario-->
<div class="modal fade" id="Mod_Reg_Usuario" tabindex="-1" role="dialog" aria-labelledby="Mod_Reg_Usuario"
    aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content rounded ">
            <form id="Form_Registro_Usuario" name="Form_Registro_Usuario" method="POST"
                action="../../Registro?Peticion=Registro_Usuario">
                <!--Header-->
                <div class="modal-header bg-dark d-block">
                    <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="text-center text-white"><strong>Registro de
                            Usuario</strong></h4>
                </div>
                <!--/Header-->
                <!--Body-->
                <div class="modal-body mx-3">
                    <div class="container">
                        <div class="row">
                            <div class="col justify-content-center align-items-center">
                                <div id="msg_SucessRegistro_usuario" class="alert alert-success d-none" role="alert">
                                    <h6 class="h6 text-center">Usuario registrado con ex&#237to</h6>
                                </div>
                                <div class="md-form">
                                    <div class="select">
                                        <select id="ID_PERFIL_USER" name="ID_PERFIL_USER" class="select-text" required>
                                            <option disabled selected></option>
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
                                <h4 class="h1" class="text-center" style="font-family: P_cursive">Informaci&#243n
                                    de Contacto</h4>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 col-lg-4">
                                <div class="md-form">
                                    <i class="fa fa-user-circle prefix grey-text"></i>
                                    <input type="text" id="NOMBRE_USER" name="NOMBRE_USER" class="form-control validate"
                                        aria-describedby="NOMBRE_USER">
                                    <label data-success="" for="NOMBRE_USER">Nombres</label>
                                </div>
                            </div>
                            <div class="col-12 col-lg-4">
                                <div class="md-form">
                                    <input type="text" id="APELLIDOS_USER" name="APELLIDOS_USER"
                                        class="form-control validate" aria-describedby="APELLIDOS_USER">
                                    <label data-success="" for="APELLIDOS_USER">Apellidos</label>
                                </div>
                            </div>
                            <div class="col-12 col-lg-4">
                                <div class="md-form">
                                    <i class="fas fa-address-card prefix grey-text"></i>
                                    <input type="text" id="DOC_USER" name="DOC_USER" class="form-control validate"
                                        aria-describedby="DOC_USER">
                                    <label data-success="" for="DOC_USER">Documento</label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 col-lg-6">
                                <div class="md-form">
                                    <i class="fas fa-envelope prefix grey-text"></i>
                                    <input type="email" id="CORREO_USER" name="CORREO_USER"
                                        class="form-control validate" aria-describedby="CORREO_USER">
                                    <label data-success="" for="CORREO_USER">Correo Electron&#237co</label>
                                </div>
                            </div>
                            <div class="col-12 col-lg-6">
                                <div class="md-form">
                                    <i class="fa fa-user prefix grey-text"></i>
                                    <input type="text" id="R_NICK_USER" name="R_NICK_USER" class="form-control validate"
                                        aria-describedby="R_NICK_USER">
                                    <label data-success="" for="R_NICK_USER">Usuario</label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 col-lg-6">
                                <div class="md-form">
                                    <i class="fa fa-lock prefix grey-text"></i>
                                    <input type="password" id="R_PASSWORD_USER" name="R_PASSWORD_USER"
                                        class="form-control validate">
                                    <label data-success="" for="R_PASSWORD_USER">Contrase&#241a</label>
                                </div>
                            </div>
                            <div class="col-12 col-lg-6">
                                <div class="md-form">
                                    <i class="fa fa-lock prefix grey-text"></i>
                                    <input type="password" id="pwd" name="pwd" class="form-control validate">
                                    <label data-success="" for="pwd">Confirmar Contrase&#241a</label>
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
                            <div class="col d-flex flex-center mx-auto">
                                <button id="btn_registro_usuario" class="btn btn-secondary"
                                    type="submit">Registrar</button>
                                <i id="icon_load_usuario" class="fa fa-spinner fa-spin d-none text-center mx-auto"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <!--/Footer-->

            </form>

        </div>
    </div>
</div>
<!--/Modal de Registro de Usuario-->

<!--#################################################### CRUD de Facultad ###########################################################-->

<!--Modal Registro de Facultad-->
<div class="modal fade" id="Mod_Reg_Facultad" tabindex="-1" role="dialog" aria-labelledby="Mod_Reg_Facultad"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content rounded ">

            <form id="Form_Registro_Facultad" name="Form_Registro_Facultad" method="POST"
                action="../../Registro?Peticion=Registro_Facultad">

                <!--Header-->
                <div class="modal-header bg-dark d-block">
                    <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="text-center text-white"><strong>Registro de
                            Facultad</strong></h4>
                </div>
                <!--/Header-->

                <!--Body-->
                <div class="modal-body mx-3">
                    <div id="msg_SucessRegistro_facultad" class="alert alert-success d-none" role="alert">
                        <h6 class="h6 text-center">Facultad registrada con ex&#237to</h6>
                    </div>

                    <!--Simple Select with Search-->
                    <div class="form-group w-100">
                        <label>Decano de la Facultad</label>
                        <select id="DECANO_FACULTAD" name="DECANO_FACULTAD">
                            <option></option>
                        </select>
                    </div>

                    <div class="md-form">
                        <input type="text" id="CODIGO_FACULTAD" name="CODIGO_FACULTAD" class="form-control validate">
                        <label data-success="" for="CODIGO_FACULTAD">Codigo de la Facultad</label>
                    </div>

                    <div class="md-form">
                        <input type="text" id="NOMBRE_FACULTAD" name="NOMBRE_FACULTAD" class="form-control validate">
                        <label data-success="" for="NOMBRE_FACULTAD">Nombre de la Facultad</label>
                    </div>

                    <p class="text-mute">*Nota: Solo se mostrar&#225n los decanos que aun no han sido asignados a
                        alguna facultad</p>

                </div>
                <!--/Body-->
                <!--Footer-->
                <div class="modal-footer">
                    <div class="container">
                        <div class="row">
                            <div class="col d-flex flex-center mx-auto">
                                <button id="btn_registro_facultad" class="btn btn-secondary"
                                    type="submit">Registrar</button>
                                <i id="icon_load_facultad" class="fa fa-spinner fa-spin d-none text-center mx-auto"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <!--/Footer-->


            </form>

        </div>
    </div>
</div>
<!--/Modal Registro de Facultad-->

<!--Modal Moficiar Facultad-->
<div class="modal fade" id="Mod_Modi_Facultad" tabindex="-1" role="dialog" aria-labelledby="Mod_Modi_Facultad"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content rounded ">

            <form id="Form_Modificar_Facultad" name="Form_Modificar_Facultad" method="POST"
                action="../../Registro?Peticion=Modificar_Facultad">

                <!--Header-->
                <div class="modal-header bg-dark d-block">
                    <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="text-center text-white"><strong>Modificar
                            Facultad</strong></h4>
                </div>
                <!--/Header-->

                <!--Body-->
                <div class="modal-body mx-3">
                    <!--Simple Select with Search-->
                    <div class="form-group w-100">
                        <label>Decano de la Facultad</label>
                        <select id="MOD_DECANO_FACULTAD" name="MOD_DECANO_FACULTAD">
                            <option></option>
                        </select>
                        <p class="text-success" id="Decano_Actual"></p>
                    </div>

                    <div class="md-form">
                        <input type="text" id="MOD_CODIGO_FACULTAD" name="MOD_CODIGO_FACULTAD"
                            class="form-control validate">
                        <label data-success="" for="MOD_CODIGO_FACULTAD">Codigo de la Facultad</label>
                    </div>
                    <p class="text-success" id="Codigo_Actual"></p>

                    <div class="md-form">
                        <input type="text" id="MOD_NOMBRE_FACULTAD" name="MOD_NOMBRE_FACULTAD"
                            class="form-control validate">
                        <label data-success="" for="MOD_NOMBRE_FACULTAD">Nombre de la Facultad</label>
                    </div>
                    <p class="text-success" id="Facultad_Actual"></p>

                </div>
                <!--/Body-->
                <!--Footer-->
                <div class="modal-footer">
                    <div class="container">
                        <div class="row">
                            <div class="col d-flex flex-center mx-auto">
                                <button id="btn_modificar_facultad" class="btn btn-secondary"
                                    type="submit">Modificar</button>
                                <i id="icon_modificar_load_facultad"
                                    class="fa fa-spinner fa-spin d-none text-center mx-auto"></i>
                                <input id="MOD_ID_FACULTAD" name="MOD_ID_FACULTAD" type="hidden">
                            </div>
                        </div>
                    </div>
                </div>
                <!--/Footer-->
            </form>
        </div>
    </div>
</div>
<!--/Modal Moficiar Facultad-->

<!--Modal Eliminar Facultad-->
<div class="modal fade" id="Mod_Elim_Facultad" tabindex="-1" role="dialog" aria-labelledby="Mod_Elim_Facultad"
    aria-hidden="true">
    <div class="modal-dialog" role="document">

        <div class="modal-content rounded ">
            <form id="Form_Eliminar_Facultad" name="Form_Eliminar_Facultad" method="POST"
                action="../../Registro?Peticion=Eliminar_Facultad">
                <!--Header-->
                <div class="modal-header bg-dark d-block">
                    <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="text-center text-white"><strong>Eliminar Facultad</strong></h4>
                </div>
                <!--/Header-->

                <!--Body-->
                <div class="modal-body mx-3 text-center">
                    <p id="Facultad_Eliminar"></p>
                    <input id="ID_FACULTAD" name="ID_FACULTAD" type="hidden">
                </div>
                <!--/Body-->

                <!--Footer-->
                <div class="modal-footer">
                    <div class="container">
                        <div class="row">
                            <div class="col d-flex flex-center mx-auto">
                                <button id="btn_eliminar_facultad" class="btn btn-secondary"
                                    type="submit">Aceptar</button>
                                <button id="btn_cancelarEliminar_facultad" class="btn btn-secondary"
                                    data-dismiss="modal" aria-label="Close">Cancelar</button>
                                <i id="icon_loadEliminar_facultad"
                                    class="fa fa-spinner fa-spin d-none text-center mx-auto"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <!--/Footer-->
            </form>
        </div>
    </div>
</div>
<!--/Modal Eliminar Facultad-->


<!--#################################################### CRUD de Materias ##############################################################-->

<div class="modal fade" id="Mod_Reg_Materia" tabindex="-1" role="dialog" aria-labelledby="Mod_Reg_Materia"
    aria-hidden="true">
    <div class="modal-dialog" role="dialog">
        <div class="modal-content">
            <form action="" id="Form_Registro_Materia">
                <!--Header-->
                <div class="modal-header bg-dark d-block">
                    <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="text-center text-white">
                        <strong>Registro de Materias</strong>
                    </h4>
                </div>
                <!--/Header-->

                <!--Body-->
                <div class="modal-body">
                    <div class="container">
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group w-100">
                                    <label>Facultad</label>
                                    <select id="FACULTAD_MATERIA" name="FACULTAD_MATERIA">
                                        <option></option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="md-form">
                                    <input type="text" id="CODIGO_MATERIA" name="CODIGO_MATERIA"
                                        class="form-control validate">
                                    <label data-success="" for="CODIGO_MATERIA">Codigo de la materia</label>
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="md-form">
                                    <input type="text" id="NOMBRE_MATERIA" name="NOMBRE_MATERIA"
                                        class="form-control validate">
                                    <label data-success="" for="NOMBRE_MATERIA">Nombre de la materia</label>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <!--/Body-->

                <!--Modal Footer-->
                <div class="modal-footer">
                    <div class="container">
                        <div class="row">
                            <div class="col d-flex flex-center mx-auto">
                                <button id="btn_registro_materia" class="btn btn-secondary"
                                    type="submit">Registrar</button>
                                <i id="icon_load_materia" class="fa fa-spinner fa-spin d-none text-center mx-auto"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <!--/Modal Footer-->
            </form>
        </div>
    </div>
</div>