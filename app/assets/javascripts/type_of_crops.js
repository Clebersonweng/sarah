var id_cultivo;
$(document).ready(function ()
{
    //$('#numOrden,#cantidad').validaCleber('0123456789');
    
    $('#type_crop').validator().on('submit', function (e) {
        if (e.isDefaultPrevented()) {
            // handle the invalid form...
        } else {
            // everything looks good!
        }
    })

    $("#success-alert").fadeTo(2000, 500).slideUp(500, function () {
        $("#success-alert").slideUp(500);
    });


    $('.fa.fa-2x.fa-minus').on("click", function (event) {
        event.preventDefault();
        $('#md_controllerName').modal('show');
    });
   

    /*boton click lista de cultivo para abrir modal de eliminar*/
    $(".btn_md_crop.btn.btn-primary").on("click", function (event) {
        event.preventDefault();
        id_cultivo = $(this).data('id_cultivo');
        delete_crop(id_cultivo);
    });

    $(".pull-left.pagination-detail").hide();

    $("input").on("focusout", function () {
        return false
    });

// fin de carga de la pagina
});


var delete_crop = function (n_id) {
    $('#md_cultivo').modal({
        show: true
    });
    $("#btn_md_confirm").on("click", function (event)
    {
        $.ajax({
            type: "POST",
            url: "/type_of_crops/" + n_id,
            dataType: "json",
            data: {"_method": "delete"},
            success: function (msg) {
                var respuesta_json = jQuery.parseJSON(JSON.stringify(msg));
                if (respuesta_json === 1)
                {
                    $('#tr_' + n_id).remove();
                    alert_sarah("Eliminado con exito!", "success");
                } else if (respuesta_json === 0)
                {
                    alert_sarah("Ocurrio un error al eliminar!", "danger");
                }
            }
        });
        event.preventDefault();
    });
}