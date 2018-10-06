new WOW().init();
var scroll = new SmoothScroll('a[href*="#"]');
var options = { speed: 1000, easing: 'easeOutQuint' };
scroll.animateScroll(options);


jQuery.validator.setDefaults({
    errorElement: 'p',
    errorPlacement: function (error, element) {
        error.addClass('invalid-feedback');
        element.closest('.md-form').append(error);
    },
    highlight: function (element, errorClass, validClass, error) {
        $(element).addClass('invalid');
    },
    unhighlight: function (element, errorClass, validClass) {
        $(element).removeClass('invalid');
    }
});

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

$(document).ready(function () {

    /** Se configura el Ajax para que permita redirigir las solicitudes a travez del servlet */
    $('#Login').validate({
        rules: {
            NICK_USER: { required: true },
            PASSWORD_USER: { required: true }
        },
        messages: {
            NICK_USER: {
                required: 'Por favor ingresa tu usuario'
            },
            PASSWORD_USER: { required: 'Por favor suministra tu contraseña' }
        },

        submitHandler: function () {

            $.ajax({
                type: $("#Login").attr('method'),
                url: $("#Login").attr('action'),
                data: $("#Login").serialize(),
                dataType: "text",

                beforeSend: function () {
                    $('#load').removeClass('d-none').addClass('d-block');
                    $('#ingreso').removeClass('d-block').addClass('d-none');
                },
                success: function (response) {
                    if (response == 'false') {
                        $('#errorLogin').slideDown('slow').removeClass('d-none');
                        function error() {
                            $('#errorLogin').slideUp('slow');
                        } setTimeout(error, 4000);
                    } else {
                        window.location.href = "JSP/Administrador/Inicio.jsp";
                    }
                },
                error: function (response) {
                    console.log(response);
                    alert('Error con el servidor, por favor intentalo de nuevo mas tarde');
                },
                complete: function () {
                    $('#load').removeClass('d-block').addClass('d-none');
                    $('#ingreso').removeClass('d-none').addClass('d-block');
                }
            });
        }
    });


    $('#Form_Registro').validate({
        rules: {
            ID_PERFIL_USER: { required: true },
            NOMBRE_USER: { required: true, minlength: 3, maxlength: 20 },
            APELLIDOS_USER: { required: true, minlength: 5, maxlength: 20 },
            DOC_USER: {
                required: true,
                minlength: 5,
                maxlength: 15,
                remote: {
                    url: "Ingreso?Peticion=ValidarDoc",
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
                    url: "Ingreso?Peticion=ValidarEmail",
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
                    url: "Ingreso?Peticion=ValidarNick",
                    type: "GET",
                    data: {
                        R_NICK_USER: function () {
                            return $("#R_NICK_USER").val();
                        }
                    }
                }
            },
            R_PASSWORD_USER: { required: true, minlength: 8, maxlength: 20, especial: true, minuscula: true, mayuscula: true },
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
                url: $("#Form_Registro").attr('action'),
                type: $("#Form_Registro").attr('method'),
                data: $("#Form_Registro").serialize(),
                dataType: "text",

                beforeSend: function () {
                    $('#R_load').removeClass('d-none').addClass('d-block');
                    $('#R_ingreso').removeClass('d-block').addClass('d-none');
                },
                success: function (response) {
                    if (response == 'true') {
                        $('#Sucess').slideDown('slow').removeClass('d-none');
                        function ShowSucess() {
                            $('#Sucess').slideUp('slow');
                        } setTimeout(ShowSucess, 4000);
                        $("#Form_Registro")[0].reset();
                        function modals() {
                            $("#Registro").modal('hide');
                            $("#Ingresar").modal('show');
                        } setTimeout(modals, 4000);
                    }
                },
                error: function (response) {
                    console.log(response);
                    alert('Error con el servidor, por favor intentalo de nuevo mas tarde');
                },
                complete: function () {
                    $('#R_load').removeClass('d-block').addClass('d-none');
                    $('#R_ingreso').removeClass('d-none').addClass('d-block');
                }
            });
        }
    });
});




