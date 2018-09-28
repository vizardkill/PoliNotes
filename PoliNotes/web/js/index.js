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

$(document).ready(function () {
    /** Se configura el Ajax para que permita redirigir las solicitudes a travez del servlet */
    $('#Login').validate({
        rules: {
            NICK_USER: { required: true },
            PASSWORD_USER: { required: true }

        },
        messages: {
            NICK_USER: {
                required: 'Por favor coloca tu usuario'
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
                        window.location.href = "JSP/Inicio.jsp";
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
            NOMBRE_USER: { required: true, minlength: 3, maxlength: 20 },
            APELLIDOS_USER: { required: true, minlength: 5, maxlength: 20 }
        },
        messages: {
            NOMBRE_USER: {
                required: 'El campo es requerido',
                minlength: 'El campo debe contener un minimo de 3 caracteres',
                maxlength: 'El campo solo puede contener un maximo de 20 caracteres'
            },
            APELLIDOS_USER: {
                required: 'El campo es requerido',
                minlength: 'El campo debe contener un minimo de 3 caracteres',
                maxlength: 'El campo solo puede contener un maximo de 20 caracteres'
            }
        },

        submitHandler: function (form) {
            $.ajax({
                url: $("#Form_Registro").action,
                type: $("#Form_Registro").method,
                data: $("#Form_Registro").serialize(),
                beforeSend: function () {
                    $('#R_load').removeClass('d-none').addClass('d-block');
                    $('#R_ingreso').removeClass('d-block').addClass('d-none');
                },
                complete: function (response) {
                    $('#R_load').removeClass('d-block').addClass('d-none');
                    $('#R_ingreso').removeClass('d-none').addClass('d-block');
                }
            });
        }
    });
});

/** Function de Login */
/*Login = new Vue({
    el: "#Inicio",
    methods: {
        sendForm: function () {
            $('#load').removeClass('d-none').addClass('d-block');
            $('#ingreso').removeClass('d-block').addClass('d-none');

            axios({
                method: 'post',
                url: $('#Login').attr('action'),
                data: $('#Login').serialize(),
                config: { headers: { 'Content-Type': 'multipart/form-data' } }
            })
                .then(function (response) {
                    $('#load').removeClass('d-block').addClass('d-none');
                    $('#ingreso').removeClass('d-none').addClass('d-block');

                    //handle success
                    console.log(response);
                    if (!response.data.HTTP[0].response) {
                        $('#errorLogin').slideDown('slow').removeClass('d-none');
                        function error() {
                            $('#errorLogin').slideUp('slow');
                        } setTimeout(error, 4000);

                    }

                    else {
                        alert('usuario correcto');
                    };
                })
                .catch(function (response) {
                    $('#load').removeClass('d-block').addClass('d-none');
                    $('#ingreso').removeClass('d-none').addClass('d-block');

                    alert('Existen problemas con el servidor');
                    console.log(response);
                });
        }
    }
});*/



