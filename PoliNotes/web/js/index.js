new WOW().init();
var scroll = new SmoothScroll('a[href*="#"]');
var options = { speed: 1000, easing: 'easeOutQuint' };
scroll.animateScroll(options);

jQuery.validator.setDefaults({
    errorElement: 'div',
    errorPlacement: function (error, element) {
        error.addClass('ml-5 invalid-feedback');
        element.closest('.form-group').append(error);
    },
    highlight: function (element, errorClass, validClass, error) {
        $(element).addClass('invalid');
    },
    unhighlight: function (element, errorClass, validClass) {
        $(element).removeClass('invalid');
    }
});

$(document).ready(function () {
    $('#Form_Registro').validate({
        rules: {
            NOMBRE_USER: { required: true }
        },
        messages: {
            NOMBRE_USER: {
                required: 'El campo es requerido'
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
Login = new Vue({
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
});
