//################################## Configuraciones de JQuery Validator
jQuery.validator.setDefaults({
    errorElement: 'p',
    errorPlacement: function (error, element) {
        error.addClass('invalid-feedback');
        element.closest('.md-form').append(error);
        element.closest('.form-group').append(error);
    },
    highlight: function (element, errorClass, validClass, error) {
        $(element).addClass('invalid');
    },
    unhighlight: function (element, errorClass, validClass) {
        $(element).removeClass('invalid');
    }
});

//################################## Metodos Adicionales para JQuery Validator
$.validator.addMethod("especial", function (value) {
    return /[\@\#\$\%\^\&\*\(\)\_\+\!]/.test(value)
});
$.validator.addMethod("minuscula", function (value) {
    return /[a-z]/.test(value)
});
$.validator.addMethod("mayuscula", function (value) {
    return /[A-Z]/.test(value)
});
$.validator.addMethod("digito", function (value) {
    return /[0-9]/.test(value)
});
$.validator.addMethod("letras", function (value) {
    return /^[a-zA-Z]+(\s*[a-zA-Z]*)*[a-zA-Z]+$/.test(value)
});

$(document).ready(function () {
    //################################## Iniciar mensajes Tooltip de Bootstrap 
    $('[data-toggle="tooltip"]').tooltip();

    //################################## Select del Formulario de Registro de Facultad (Busca los Decanos existentes dentro de la universidad)
    $('#DECANO_FACULTAD').select2({
        language: {
            errorLoading: function () {
                return 'No se pudieron cargar los resultados';
            },
            inputTooLong: function (args) {
                var remainingChars = args.input.length - args.maximum;

                var message = 'Por favor, elimine ' + remainingChars + ' car';

                if (remainingChars == 1) {
                    message += 'ácter';
                } else {
                    message += 'acteres';
                }

                return message;
            },
            inputTooShort: function (args) {
                var remainingChars = args.minimum - args.input.length;

                var message = 'Por favor, introduzca ' + remainingChars + ' car';

                if (remainingChars == 1) {
                    message += 'ácter';
                } else {
                    message += 'acteres';
                }

                return message;
            },
            loadingMore: function () {
                return 'Cargando más resultados…';
            },
            maximumSelected: function (args) {
                var message = 'Sólo puede seleccionar ' + args.maximum + ' elemento';

                if (args.maximum != 1) {
                    message += 's';
                }

                return message;
            },
            noResults: function () {
                return 'No se encontraron resultados';
            },
            searching: function () {
                return 'Buscando…';
            },
            removeAllItems: function () {
                return 'Eliminar todos los elementos';
            }
        },
        dropdownParent: $('#Mod_Reg_Facultad'),
        theme: "bootstrap",

        ajax: {
            type: "GET",
            url: "../../Datos?Peticion=data_Decanos",
            dataType: "json",
            processResults: function (data) {
                return {
                    results: $.map(data.Decanos, function (Decanos) {
                        return {
                            text: Decanos.NOMBRE_USER + ' ' + Decanos.APELLIDOS_USER,
                            id: Decanos.DOC_USER
                        }
                    })
                };
            }
        }
    });

    //################################## Select del Formulario de Modificación de Facultad (Busca los Decanos existentes dentro de la universidad)
    $('#MOD_DECANO_FACULTAD').select2({
        language: {
            errorLoading: function () {
                return 'No se pudieron cargar los resultados';
            },
            inputTooLong: function (args) {
                var remainingChars = args.input.length - args.maximum;

                var message = 'Por favor, elimine ' + remainingChars + ' car';

                if (remainingChars == 1) {
                    message += 'ácter';
                } else {
                    message += 'acteres';
                }

                return message;
            },
            inputTooShort: function (args) {
                var remainingChars = args.minimum - args.input.length;

                var message = 'Por favor, introduzca ' + remainingChars + ' car';

                if (remainingChars == 1) {
                    message += 'ácter';
                } else {
                    message += 'acteres';
                }

                return message;
            },
            loadingMore: function () {
                return 'Cargando más resultados…';
            },
            maximumSelected: function (args) {
                var message = 'Sólo puede seleccionar ' + args.maximum + ' elemento';

                if (args.maximum != 1) {
                    message += 's';
                }

                return message;
            },
            noResults: function () {
                return 'No se encontraron resultados';
            },
            searching: function () {
                return 'Buscando…';
            },
            removeAllItems: function () {
                return 'Eliminar todos los elementos';
            }
        },
        dropdownParent: $('#Mod_Modi_Facultad'),
        theme: "bootstrap",

        ajax: {
            type: "GET",
            url: "../../Datos?Peticion=data_Decanos",
            dataType: "json",
            processResults: function (data) {
                return {
                    results: $.map(data.Decanos, function (Decanos) {
                        return {
                            text: Decanos.NOMBRE_USER + ' ' + Decanos.APELLIDOS_USER,
                            id: Decanos.DOC_USER
                        }
                    })
                };
            }
        }
    });

    //################################## Esta Seccion establece la validacion de los diferentes Formularios del Sistema a travez de JQuery Validator

    //Carga los perfiles en el elemento Select del Formulario de Creación de Usuario
    $.ajax({
        type: "GET",
        url: "../../Datos?Peticion=data_perfiles",
        dataType: "json",
        success: function (Data) {
            $.each(Data.Perfiles, function (i, item) {
                $("#ID_PERFIL_USER").append('<option value=' + item.ID_TIPO_PERFIL + '>' + item.NOMBRE_TIPO_PERFIL + '</option>');
            });
        },
        error: function (response) {
            alert('Error interno con el servidor, intentalo de nuevo más tarde')
            console.log(response);
        }
    });
    //Validacion del Formulario para el registro de un usuario
    $('#Form_Registro_Usuario').validate({
        rules: {
            ID_PERFIL_USER: { required: true },
            NOMBRE_USER: { required: true, minlength: 3, maxlength: 20 },
            APELLIDOS_USER: { required: true, minlength: 5, maxlength: 20 },
            DOC_USER: {
                required: true,
                minlength: 5,
                maxlength: 15,
                remote: {
                    url: "../../Ingreso?Peticion=ValidarDoc",
                    type: "GET",
                    data: {
                        DOC_USER: function () {
                            return $("#DOC_USER").val()
                        }
                    }
                }
            },
            CORREO_USER: {
                required: true,
                email: true,
                remote: {
                    url: "../../Ingreso?Peticion=ValidarEmail",
                    type: "GET",
                    data: {
                        CORREO_USER: function () {
                            return $("#CORREO_USER").val();
                        }
                    }
                }
            },
            R_NICK_USER: {
                required: true,
                minlength: 4,
                maxlength: 10,
                remote: {
                    url: "../../Ingreso?Peticion=ValidarNick",
                    type: "GET",
                    data: {
                        R_NICK_USER: function () {
                            return $("#R_NICK_USER").val();
                        }
                    }
                }
            },
            R_PASSWORD_USER: { required: true, minlength: 8, maxlength: 20, especial: true, minuscula: true, mayuscula: true, digito: true },
            pwd: { required: true, equalTo: '#R_PASSWORD_USER' }
        },
        messages: {
            ID_PERFIL_USER: { required: 'Por favor seleccione un perfil' },
            NOMBRE_USER: {
                required: 'El campo es requerido',
                minlength: 'El campo debe contener un minimo de 3 caracteres',
                maxlength: 'El campo solo puede contener un maximo de 20 caracteres'
            },
            APELLIDOS_USER: {
                required: 'El campo es requerido',
                minlength: 'El campo debe contener un minimo de 3 caracteres',
                maxlength: 'El campo solo puede contener un maximo de 20 caracteres'
            },
            DOC_USER: {
                required: 'El campo es requerido',
                minlength: 'El campo debe contener un minimo de 5 caracteres',
                maxlength: 'El campo solo puede contener un maximo de 15 caracteres',
                remote: 'Este documento ya se encuentra en uso'
            },
            CORREO_USER: {
                required: 'El campo es requerido',
                email: 'El correo electronico introducido es incorrecto',
                remote: 'Este correo ya se encuentra en uso'
            },
            R_NICK_USER: {
                required: 'El campo es requerido',
                minlength: 'El campo debe contener un minimo de 4 caracteres',
                maxlength: 'El campo solo puede contener un maximo de 10 caracteres',
                remote: 'Este nick ya se encuentra en uso por favor usa uno diferente'
            },
            R_PASSWORD_USER: {
                required: 'La contraseña es obligatoria',
                minlength: 'La contraseña debe ser de almenos 8 digitos',
                maxlength: 'La contraseña no puede sobrepasar los 20 digitos',
                especial: 'La contraseña debe contener almenos un caracter especial',
                minuscula: 'La contraseña debe contener una letra minuscula',
                mayuscula: 'La contraseña debe contener una letra mayuscula'
            },
            pwd: {
                required: 'Es obligatorio que confirmes tu contraseña',
                equalTo: 'Las contraseñas no coinciden'
            }
        },

        submitHandler: function () {
            $.ajax({
                url: $("#Form_Registro_Usuario").attr('action'),
                type: $("#Form_Registro_Usuario").attr('method'),
                data: $("#Form_Registro_Usuario").serialize(),
                dataType: "text",

                beforeSend: function () {
                    $('#icon_load_usuario').removeClass('d-none').addClass('d-block');
                    $('#btn_registro_usuario').removeClass('d-block').addClass('d-none');
                },
                success: function (response) {
                    if (response == 'true') {
                        $('#msg_SucessRegistro_usuario').slideDown('slow').removeClass('d-none');
                        function ShowSucess() {
                            $('#msg_SucessRegistro_usuario').slideUp('slow');
                        } setTimeout(ShowSucess, 4000);
                        $("#Form_Registro_Usuario")[0].reset();
                    }
                },
                error: function (response) {
                    console.log(response);
                    alert('Error con el servidor, por favor intentalo de nuevo mas tarde');
                },
                complete: function () {
                    $('#icon_load_usuario').removeClass('d-block').addClass('d-none');
                    $('#btn_registro_usuario').removeClass('d-none').addClass('d-block');
                }
            });
        }
    });

    //Validacion del Formulario para el registro de una Facultad
    $('#Form_Registro_Facultad').validate({
        ignore: [],
        rules: {
            DECANO_FACULTAD: {
                required: true,
                remote: {
                    url: "../../Ingreso?Peticion=ValidarDecano",
                    type: "GET",
                    data: {
                        DECANO_FACULTAD: function () {
                            return $("#DECANO_FACULTAD").val()
                        }
                    }
                }
            },
            CODIGO_FACULTAD: { required: true, maxlength: 15, minlength: 5 },
            NOMBRE_FACULTAD: { required: true, minlength: 5, maxlength: 20, letras: true }
        },
        messages: {
            DECANO_FACULTAD: {
                required: 'El campo es requerido',
                remote: 'Este decano ya esta asignado a otra facultad'
            },
            CODIGO_FACULTAD: {
                required: 'El campo es requerido',
                minlength: 'El campo debe contener un minimo de 5 caracteres',
                maxlength: 'El campo solo puede contener un maximo de 5 caracteres'
            },
            NOMBRE_FACULTAD: {
                required: 'El campo es requerido',
                minlength: 'El campo debe contener un minimo de 5 caracteres',
                maxlength: 'El campo solo puede contener un maximo de 20 caracteres',
                letras: 'El campo no puede contener caracteres especiales ni numeros'
            }
        },

        submitHandler: function () {
            $.ajax({
                type: $('#Form_Registro_Facultad').attr('method'),
                url: $('#Form_Registro_Facultad').attr('action'),
                data: $("#Form_Registro_Facultad").serialize(),
                dataType: "text",

                beforeSend: function () {
                    $('#icon_load_facultad').removeClass('d-none').addClass('d-block');
                    $('#btn_registro_facultad').removeClass('d-block').addClass('d-none');
                },
                success: function (response) {
                    if (response == 'true') {
                        $('#msg_SucessRegistro_facultad').slideDown('slow').removeClass('d-none');
                        function ShowSucess() {
                            $('#msg_SucessRegistro_facultad').slideUp('slow');
                        } setTimeout(ShowSucess, 4000);
                        $("#Form_Registro_Facultad")[0].reset();
                        $('#Table_Facultad').DataTable().ajax.reload();
                    }
                },
                error: function (response) {
                    console.log(response);
                    alert('Error con el servidor, por favor intentalo de nuevo mas tarde');
                },
                complete: function () {
                    $('#icon_load_facultad').removeClass('d-block').addClass('d-none');
                    $('#btn_registro_facultad').removeClass('d-none').addClass('d-block');
                }
            });
        }
    });
    //Validacion del Formulario para la eliminacion de una Facultad
    $("#Form_Eliminar_Facultad").submit(function (e) {
        e.preventDefault();
        $.ajax({
            type: $('#Form_Eliminar_Facultad').attr('method'),
            url: $('#Form_Eliminar_Facultad').attr('action'),
            data: $('#Form_Eliminar_Facultad').serialize(),
            dataType: "text",

            beforeSend: function () {
                $('#icon_loadEliminar_facultad').removeClass('d-none').addClass('d-block');
                $('#btn_eliminar_facultad').removeClass('d-block').addClass('d-none');
                $('#btn_cancelarEliminar_facultad').removeClass('d-block').addClass('d-none');
            },
            success: function (response) {
                if (response == 'true') {
                    $('#Mod_Elim_Facultad').modal('hide');
                    $('#Table_Facultad').DataTable().ajax.reload();
                    $('#Mod_Sucess').modal('show');
                    $('#Text_Sucess').text('Facultad eliminada con éxito');
                    function ShowSucess() {
                        $('#Mod_Sucess').modal('hide');
                    } setTimeout(ShowSucess, 3000);
                }
            },
            error: function (response) {
                console.log(response);
                alert('Error con el servidor, por favor intentalo de nuevo mas tarde');
            },
            complete: function () {
                $('#icon_loadEliminar_facultad').removeClass('d-block').addClass('d-none');
                $('#btn_eliminar_facultad').removeClass('d-none').addClass('d-block');
                $('#btn_cancelarEliminar_facultad').removeClass('d-none').addClass('d-block');
            }
        });
    });

    //################################## Esta seccion establece las configuraciones para los diferentes Tables del sisterma a travez del Framework DataTable de JQuery

    //Tabla de Logs
    var Table_Logs = $('#Table_Logs').DataTable({
        language: {
            sProcessing: "Procesando...",
            sLengthMenu: "Mostrar _MENU_  Registros",
            sZeroRecords: "No se encontraron resultados",
            sEmptyTable: "Ningún dato disponible en esta tabla",
            sInfo: "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
            sInfoEmpty: "Mostrando registros del 0 al 0 de un total de 0 registros",
            sInfoFiltered: "(filtrado de un total de _MAX_ registros)",
            sInfoPostFix: "",
            sSearch: "Buscar:",
            sUrl: "",
            sInfoThousands: ",",
            sLoadingRecords: "Cargando...",
            oPaginate: {
                sFirst: "Primero",
                sLast: "Último",
                sNext: "Siguiente",
                sPrevious: "Anterior"
            },
            oAria: {
                sSortAscending: ": Activar para ordenar la columna de manera ascendente",
                sSortDescending: ": Activar para ordenar la columna de manera descendente"
            }
        },
        ajax: {
            method: "GET",
            url: "../../Datos?Peticion=data_logs",
            dataSrc: "Logs"
        },
        select: "single",
        columns: [
            { data: "NOMBRE_USER" },
            { data: "NOMBRE_TIPO_PERFIL" },
            { data: "ACCCION_LOGS" },
            { data: "DESCRIPCION_LOGS" },
            { data: "FECHA_LOGS" }
        ],
        order: [[1, 'asc']],
        dom: 'Bfrtip',
        buttons: [
            {
                extend: 'excelHtml5',
                text: '<i class="fa fa-file-excel"></i><span> Generar Informe</span>',
                titleAttr: 'Excel',
                className: 'btn-sm',
                action: function (e, dt, node, config) {
                    $('#Table_Logs').DataTable().ajax.reload();

                    $.fn.DataTable.ext.buttons.excelHtml5.action.call(this, e, dt, node, config);
                }
            }
        ]
    });

    //################################## Seccion extendida para adicionar configuracion a la Tabla de Facultad

    //Tabla de Facultad
    var Table_Facultad = $('#Table_Facultad').DataTable({
        language: {
            sProcessing: "Procesando...",
            sLengthMenu: "Mostrar _MENU_  Registros",
            sZeroRecords: "No se encontraron resultados",
            sEmptyTable: "Ningún dato disponible en esta tabla",
            sInfo: "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
            sInfoEmpty: "Mostrando registros del 0 al 0 de un total de 0 registros",
            sInfoFiltered: "(filtrado de un total de _MAX_ registros)",
            sInfoPostFix: "",
            sSearch: "Buscar:",
            sUrl: "",
            sInfoThousands: ",",
            sLoadingRecords: "Cargando...",
            oPaginate: {
                sFirst: "Primero",
                sLast: "Último",
                sNext: "Siguiente",
                sPrevious: "Anterior"
            },
            oAria: {
                sSortAscending: ": Activar para ordenar la columna de manera ascendente",
                sSortDescending: ": Activar para ordenar la columna de manera descendente"
            }
        },
        ajax: {
            method: "GET",
            url: "../../Datos?Peticion=data_facultad",
            dataSrc: "Facultades"
        },
        select: "single",
        columns: [
            {
                className: 'details-control',
                orderable: false,
                data: null,
                defaultContent: '',
                render: function () {
                    return '<i class="fa fa-plus-square" aria-hidden="true"></i>';
                },
                width: '15px'
            },
            { data: "NOMBRE_APELLIDOS_USER" },
            { data: "CODIGO_FACULTAD" },
            { data: "NOMBRE_FACULTAD" },
            {
                orderable: false,
                data: null,
                defaultContent: '',
                render: function () {
                    return '<div class="btn-group btn-group-sm" role="group" aria-label="Botones de Accion"> ' +
                        '<button type="button" class="btn btn-sm danger-color" title="Eliminar"><i class="fas fa-trash"></i></button>' +
                        '<button type="button" class="btn btn-sm success-color" title="Modificar"><i class="fas fa-marker"></i></button>' +
                        '</div>';
                }
            }
        ],
        order: [[1, 'asc']],
        dom: 'Bfrtip',
        buttons: [
            {
                extend: 'excelHtml5',
                text: '<i class="fa fa-file-excel"></i><span> Generar Informe</span>',
                titleAttr: 'Excel',
                className: 'btn-sm',
                action: function (e, dt, node, config) {
                    $('#Table_Facultad').DataTable().ajax.reload();

                    $.fn.DataTable.ext.buttons.excelHtml5.action.call(this, e, dt, node, config);
                }
            }
        ]
    });
    //Script para ampliar la informacion de la tabla Facultad
    $('#Table_Facultad tbody').on('click', 'td.details-control', function () {
        var tr = $(this).closest('tr');
        var tdi = tr.find('i.fa');
        var row = Table_Facultad.row(tr);

        if (row.child.isShown()) {

            row.child.hide();
            tr.removeClass('shown');
            tdi.first().removeClass('fa-minus-square');
            tdi.first().addClass('fa-plus-square');

        } else {

            row.child(Table_Facultad_Format(row.data())).show();
            tr.addClass('shown');
            tdi.first().removeClass('fa-plus-square');
            tdi.first().addClass('fa-minus-square');
        }
    });
    Table_Facultad.on('user-select', function (e, dt, type, cell, originalEvent) {
        if ($(cell.node()).hasClass('details-control')) {
            e.preventDefault();
        }
    });
    function Table_Facultad_Format(d) {
        // `d` is the original data object for the row
        return '<table class="w-100">' +
            '<tr>' +
            '<td><b>Documento del Decano:</b></td>' +
            '<td>' + d.DECANO_FACULTAD + '</td>' +
            '</tr>' +
            '<tr>' +
            '<td><b>Correo:</b></td>' +
            '<td>' + d.CORREO_USER + '</td>' +
            '</tr>' +
            '<td><b>Celular:</b></td>' +
            '<td>' + d.CELULAR_USER + '</td>' +
            '</tr>' +
            '</table>';
    }
    //Fin del Script
    
    //Script para ejecutar la eliminacion y modificacion de los registros en la Tabla Facultad
    $(document).on('click', '.danger-color', function () {
        var data = Table_Facultad.row($(this).parents('tr')).data();
        $('#Mod_Elim_Facultad').modal('show');
        $('#Facultad_Eliminar').text('¿Estas seguro de eliminar la facultad de ' + data.NOMBRE_FACULTAD + '?');
        $('#ID_FACULTAD').val(data.ID_FACULTAD);
    });
    $(document).on('click', '.success-color', function () {
        var data = Table_Facultad.row($(this).parents('tr')).data();
        $('#Mod_Modi_Facultad').modal('show');
        $('#Decano_Actual').text('Decano Actual: ' + data.NOMBRE_APELLIDOS_USER);
        $('#Codigo_Actual').text('Código Actual: ' + data.CODIGO_FACULTAD);
        $('#Facultad_Actual').text('Nombre Actual: ' + data.NOMBRE_FACULTAD);
        $('#MOD_ID_FACULTAD').val(data.ID_FACULTAD);
    });
    //Fin del Script
});


