$(document).ready(function ()
{
    //hace desaparecer el alert por defecto
    $(".desaparecer").fadeTo(2000, 500).slideUp(1000, function () {
        $(".alert-dismissible").alert('close');
    });

    $('.fa.fa-2x.fa-minus').on("click", function (event) {
        event.preventDefault();
        $('#md_controllerName').modal({
            show: true
        });

    });

// fin de carga de la pagina
});




function alert_sarah(contenido, classe)
{
    $('#alerta').addClass("alert-" + classe).removeClass("hide");
    $('#alerta span').html(contenido);
    setTimeout(function ()
    {
        $('#alerta').addClass("hide").removeClass("alert-" + classe);
    }
    , 2000);

}
$.fn.valida_sarah = function (cadena) {
    $(this)
            .on(
                    {
                        keypress: function (e) {
                            var key = e.which, keye = e.keyCode, tecla = String
                                    .fromCharCode(key)
                                    .toLowerCase(), letras = cadena;
                            if (letras.indexOf(tecla) == -1
                                    && keye != 9
                                    && (key == 37 || keye != 37)
                                    && (keye != 39 || key == 39)
                                    && keye != 8
                                    && (keye != 46 || key == 46)
                                    || key == 161) {
                                e.preventDefault();
                            }
                        }
                    });
};