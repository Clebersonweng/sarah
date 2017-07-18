var stock_end = 0;
var stock_start = 0;
var variation_stock = 0;
var estimateUnits;
var program_production = 0;
var total_production = 0;

$(document).ready(function () {
    form_validates();
    calculate_variation_stock();

});
function calculate_new_program_production()
{
    
}
function calculate_variation_stock()
{
    /**tomo el area de la parcela para multiplicar por la estimacion de produccion,
     segun el precio  determinando el ingreso bruto de las ventas**/

    $("#program_production_stock_initial").change(function () {
        stock_end = $("#program_production_stock_end").val();
        stock_start = $("#program_production_stock_initial").val();
        variation_stock = (parseInt(stock_end) - (parseInt(stock_start)));
        $("#program_production_variation_stock").val(variation_stock);

        if (variation_stock < 0) {
            total_production = $("#program_production_estimate_sale_id option:selected").data('total-production');
            variation_stock = $("#program_production_variation_stock").val();
            program_production = (parseInt(total_production) - (parseInt(-variation_stock)));
            $("#program_production_program_production").val(program_production);
        } else {
            total_production = $("#program_production_estimate_sale_id option:selected").data('total-production');
            variation_stock = $("#program_production_variation_stock").val();
            program_production = (parseInt(total_production) - (parseInt(variation_stock)));
            $("#program_production_program_production").val(program_production);
        }
    });
}


function form_validates()
{
    $('#form_program_production').bootstrapValidator({
        framework: 'bootstrap',
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            'program_production[stock_end]': {
                validators: {
                    notEmpty: {
                        message: 'Este campo es obligatorio'
                    },
                    stringLength: {
                        min: 1,
                        max: 9,
                        message: 'El campo debe contener entre 1 y 9 numeros'
                    },
                    regexp: {
                        regexp: /^[0-9]+$/,
                        message: 'Debe contener solamente numeros'
                    }
                }
            },
            'program_production[stock_initial]': {
                validators: {
                    notEmpty: {
                        message: 'Este campo es obligatorio'
                    },
                    stringLength: {
                        min: 1,
                        max: 9,
                        message: 'El campo debe contener entre 1 y 9 numeros'
                    },
                    regexp: {
                        regexp: /^[0-9]+$/,
                        message: 'Debe contener solamente numeros'
                    }
                }
            },
            'program_production[variation_stock]': {
                validators: {
                    notEmpty: {
                        message: 'Este campo es obligatorio'
                    },
                    stringLength: {
                        min: 1,
                        max: 9,
                        message: 'El campo debe contener entre 1 y 9 numeros'
                    },
                    regexp: {
                        regexp: /^[0-9]+$/,
                        message: 'Debe contener solamente numeros'
                    }
                }
            },
            'program_production[program_production]': {
                validators: {
                    notEmpty: {
                        message: 'Este campo es obligatorio'
                    },
                    stringLength: {
                        min: 1,
                        max: 9,
                        message: 'El campo debe contener entre 1 y 9 numeros'
                    },
                    regexp: {
                        regexp: /^[0-9]+$/,
                        message: 'Debe contener solamente numeros'
                    }
                }
            }
        }
    })
          /*  .on('success.field.fv', function (e, data) {
                if (data.fv.getInvalidFields().length > 0) {    // There is invalid field
                    data.fv.disableSubmitButtons(true);
                }
            });*/
}