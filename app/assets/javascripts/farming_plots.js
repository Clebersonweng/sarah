
$(document).ready(function ()
{     
   $("#btn_md_confirm").on("click", function ()
    {
        if (typeof _id != "undefined")
        {
            delete_modal(controlador, _id);
            console.log("clicko");
        }
    });
    controlador = $("#controller").val();
    pos_charge_table_farming_plots();
    form_farming_plot_validates();
});
function pos_charge_table_farming_plots()
{
    $("#table_farming_plots tr").on("mouseenter", function ()
    {   
     open_modal(controlador);
    });
}
function form_farming_plot_validates()
{
    $('#form_farming_plot').bootstrapValidator({
        framework: 'bootstrap',
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            'farming_plot[name]': {
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
                        regexp: /^[a-zA-Z0-9 ]+$/,
                        message: 'Debe contener numeros y letras'
                    }
                }
            },
            'farming_plot[area]': {
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
                        regexp: /^[0-9.]+$/,
                        message: 'Debe contener solamente numeros'
                    }
                }
            },
            'farming_plot[person_id]': {
                validators: {
                    notEmpty: {
                        message: 'Este campo es obligatorio'
                    }
                }
            }
            
        }
    });
           
}
/**
 var delete_parcela = function (n_id) {
 $('#md_farming_plot').modal('show');
 $("#btn_md_confirm").on("click", function (event)
 {
 $("#ajax-loader").removeClass('hide');
 $.ajax({
 type: "POST",
 url: "/farming_plots/" + n_id,
 data: {"_method": "delete"},
 complete: function (msg) {
 var respuesta_json = jQuery.parseJSON(JSON.stringify(msg));
 if (respuesta_json === 1)
 {
 //$('#tr_'+n_id).remove();
 alert_sarah("Eliminado con exito!", "success");
 } else if (respuesta_json === 0)
 {
 alert_sarah("Ocurrio un error al eliminar!", "error");
 }
 }
 });
 event.preventDefault();
 });
 }*/