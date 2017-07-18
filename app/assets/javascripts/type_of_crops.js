var _id;
$(document).ready(function ()
{

    validations_type_of_crops();
    //$('#numOrden,#cantidad').validaCleber('0123456789');

    $(".pull-left.pagination-detail").hide();

    $("input").on("focusout", function () {
        return false
    });
    controlador = $("#controller").val();
    pos_charge_table_type_of_crops();
    pos_reset_button();
    
});
function pos_charge_table_type_of_crops()
{
    $("#table_type_of_crops tr").on("mouseenter", function ()
    {
        //controlador = $("#controller").val();
        open_modal(controlador);
    });
}
function validations_type_of_crops()
{
    $('#form_type_of_crop').bootstrapValidator
            ({
                framework: 'bootstrap',
                icon: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    "type_of_crop[name]": {
                        validators: {
                            notEmpty: {
                                message: 'Este campo es obligatorio'
                            },
                            stringLength: {
                                min: 3,
                                max: 50,
                                message: 'El nombre no puede ser menor que 3 y mayor que 50 caracteresl'
                            },
                            regexp: {
                                regexp: /^[a-zA-Z0-9_ ]+$/,
                                message: 'El nombre debe consistir en caracteres alfanumericos'
                            }
                        }
                    }
                }
            });
}
function pos_reset_button()
{
    $("#cancelar").on("click", function ()
    {
        var bv = $("#form_type_of_crop").data('bootstrapValidator');
        bv.updateStatus('type_of_crop[name]', 'INVALID');
    });
}