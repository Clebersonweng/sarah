var id_farm;
$(document).ready(function ()
{
    /*boton click lista de parcela para abrir modal de eliminar*/
    btn_evt_charge_modal();

});

function btn_evt_charge_modal() {
    $(".btn_md_parcela").on("click", function (event) {
        event.preventDefault();
        id_farm = $(this).data('id_parcela');
        delete_farm_plot(id_farm);
        $('#md_farming_plot').modal('show');
    });
}
function delete_farm_plot(n_id) {

    $("#btn_md_confirm").on("click", function (e)
    {
        $("#ajax-loader").removeClass('hide');
        $.ajax({
            type: "POST",
            url: "/farming_plots/" + n_id,
            data: {"_method": "delete"},
            complete: function (msg) {
                alert_sarah("Eliminado con exito!", "success");
                $("#ajax-loader").addClass('hide');
            }
        });
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