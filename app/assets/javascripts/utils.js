var controlador;
$(document).ready(function ()
{
    
// fin de carga de la pagina
});
function open_modal(sufixe) {
    if (typeof sufixe == "undefined" || typeof sufixe == "")
    {
        sufixe = "";
    }
    if (sufixe != "")
    {
        console.log("tiene evento");
        $(".btn_delete_" + sufixe).off("click").on("click", function ()
        {
            _id = $(this).data('id');
            $('.modal.fade').modal("show");
        }
        );
    } else
    {
        //console.log("tiene evento");
        $(".btn_delete_" + sufixe).off("click").on("click", function ()
        {
            _id = $(this).data('id');
            // console.log(_id);
            $('.modal.fade').modal("show");
        }
        );
    }
}
function delete_modal(controlador, element_id) {
    $("#btn_md_confirm").addClass('disabled');
    $.ajax({
        type: "POST",
        url: "/" + controlador + "/" + element_id,
        data: {"_method": "delete"},
        success: function (msg) {
            $('#myModal').modal("hide");
            $('.modal-backdrop').remove();
            alert_sarah("El registro fue eliminado con exito!", "success");
            console.log(msg);
            $("#ajax-loader").addClass('hide');
            $("#btn_md_confirm").removeClass('disabled');
        },
        error: function (msg)
        {
            console.log(msg);
            $('#myModal').modal("hide");
            $('.modal-backdrop').remove();
            alert_sarah("Ocurrio un error al eliminar el campo!", "danger");
            $("#ajax-loader").addClass('hide');
            $("#btn_md_confirm").removeClass('disabled');
        },
        fail: function (msg)
        {
            $('#myModal').modal("hide");
            $('.modal-backdrop').remove();
            alert_sarah("Ocurrio un error en el servidor!", "danger");
            $("#ajax-loader").addClass('hide');
            $("#btn_md_confirm").removeClass('disabled');
        }

    });
}


function alert_sarah(contenido, classe, time)
{
    if (typeof time != "undefined")
    {
        time = time;
    } else
    {
        time = 2000;
    }
    $('#alerta').addClass("alert-" + classe).removeClass("hide");
    $('#alerta span').html(contenido);
    setTimeout(function ()
    {
        $('#alerta').addClass("hide").removeClass("alert-" + classe);
    }
    , time);

}
/**************funcion para validar datos como acentos etc***************/
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
function add_errors(id)
{
    $("#gr_" + id).addClass("has-error");
    $("#gr_" + id).removeClass("has-success");

}
function reset_errors(id)
{
    $("#gr_" + id).removeClass("has-error");
    $("#gr_" + id).addClass("has-success");
    $('.help-block').each(function () {
        $(this).remove();
    });


}
/**************json para traer valores fk de bootstrap table***************/
JSON.unflatten = function (data) {
    "use strict";
    if (Object(data) !== data || Array.isArray(data))
        return data;
    var result = {}, cur, prop, idx, last, temp;
    for (var p in data) {
        cur = result, prop = "", last = 0;
        do {
            idx = p.indexOf(".", last);
            temp = p.substring(last, idx !== -1 ? idx : undefined);
            cur = cur[prop] || (cur[prop] = (!isNaN(parseInt(temp)) ? [] : {}));
            prop = temp;
            last = idx + 1;
        } while (idx >= 0);
        cur[prop] = data[p];
    }
    return result[""];
}
JSON.flatten = function (data) {
    var result = {};
    function recurse(cur, prop) {
        if (Object(cur) !== cur) {
            result[prop] = cur;
        } else if (Array.isArray(cur)) {
            for (var i = 0, l = cur.length; i < l; i++)
                recurse(cur[i], prop ? prop + "." + i : "" + i);
            if (l == 0)
                result[prop] = [];
        } else {
            var isEmpty = true;
            for (var p in cur) {
                isEmpty = false;
                recurse(cur[p], prop ? prop + "." + p : p);
            }
            if (isEmpty)
                result[prop] = {};
        }
    }
    recurse(data, "");
    return result;
}

function benchmark() {
    var tries = 2;
    var count = 5;
    var result = [];
    var time, temp, noOpt;
    for (var x = 0; x < tries; x++) {
        noOpt = [];
        time = Date.now();
        for (var i = 0; i < count; i++) {
            temp = JSON.parse(JSON.stringify(fillObj({}, 4)));
            touchObj(temp, noOpt);
        }
        time = Date.now() - time;
        result.push("Nested : " + noOpt.length + " : " + time);
        //
        noOpt = [];
        time = Date.now();
        for (var i = 0; i < count; i++) {
            temp = JSON.parse(JSON.stringify(fillObj({}, 4)));
            temp = JSON.flatten(temp);
            touchObj(temp, noOpt);
            temp = JSON.unflatten(temp);
        }
        time = Date.now() - time;
        result.push("Flattened : " + noOpt.length + " : " + time);
    }
    //alert(result.join("\n"));
}
function fillObj(obj, depth) {
    obj["foo0"] = 1;
    obj["bar0"] = false;
    obj["foo2"] = -99999;
    obj["bar2"] = true;
    obj["foo3"] = 10002525.10002525;
    obj["bar3"] = "test";
    obj["foo4"] = "hello world hello world hello world hello world";
    obj["bar4"] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];
    if (depth > 0) {
        obj["foo5"] = {};
        fillObj(obj["foo5"], depth - 1);
        obj["bar5"] = [{}, {}, {}, {}, {}];
        for (var i = 0; i < obj["bar5"].length; i++) {
            fillObj(obj["bar5"][i], depth - 1);
        }
    }
    return obj;
}
function touchObj(obj, noOpt) {
    if (Array.isArray(obj)) {
        for (var i = 0; i < obj.length; i++) {
            touchObj(obj[i], noOpt);
        }
    } else if (typeof obj === "object" && obj !== null) {
        for (var i in obj) {
            touchObj(obj[i], noOpt);
        }
    } else {
        noOpt.push(true);
    }
    return noOpt;
}
benchmark();
