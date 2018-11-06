$(document).ready(function () {
    $('#select_decano').select2({
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
            data: "Decanos",
            dataType: "json"
        }
    });

    $('[data-toggle="tooltip"]').tooltip();

    //DataTable de Logs
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
    //--Fin

    //DataTable de Facultad
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
            { data: "NOMBRE_FACULTAD" }
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
        return '<table>' +
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
    //--Fin
});


