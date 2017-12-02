var controlador;
var _id;
$(document).ready(function ()
<<<<<<< HEAD
{  
=======
{
>>>>>>> products
  if (typeof controlador == "undefined")
  {
    alert("variable controlador no declarada");
  }
<<<<<<< HEAD
  //confirm_modal();
  $('.only_numbers').valida_sarah('0123456789.');
  $('.only_letters').valida_sarah('azAZ ');
  $(".pull-left.pagination-detail").hide();

  $('.datepicker').datepicker({
                                format: 'dd/mm/yyyy',
                                rtl: false,
                                language: 'es',
                                orientation: "bottom",
                                todayBtn: true,
                                autoclose: true
                              });

=======
  confirm_modal();
  $('.only_numbers').valida_sarah('0123456789');
  $('.only_letters').valida_sarah('azAZ ');
  $(".pull-left.pagination-detail").hide();

>>>>>>> products
  $(document).on('click', '.pull-right.pagination', {}, function (e) {
    confirm_modal();
  });

  $("#buscar").on("keyup", function ()
  {
    confirm_modal();
  });

  NProgress.configure({
<<<<<<< HEAD
                        showSpinner: false,
                        ease: 'ease',
                        speed: 500
                      });

// colocar texto en mayusculas
  $(".upper_text").on('keyup', function (e) {
    if (e.which >= 97 && e.which <= 122) {
      var newKey = e.which - 32;
      // I have tried setting those
      e.keyCode = newKey;
      e.charCode = newKey;
    }
    $(this).val(($(this).val()).toUpperCase());
  });
  
  /*$(document).ready(function() {
      if (location.hash !== '') $('a[href="' + location.hash + '"]').tab('show');
      return $('a[data-toggle="tab"]').on('shown', function(e) {
        return location.hash = $(e.target).attr('href').substr(1);
      });
  });*/


  //sirve para saber el estado de carga de la tabla
  $('.table').on('load-success.bs.table', function(e, data){
       //console.log('Success', data);
    });

    $('.table').on('load-error.bs.table', function(e, status){
       // console.log('Error tabela', status);
    });

    //desabilita el enter para que pueda validar solamente en evento boton
  disabled_enter();

});

var disabled_enter = function(){
    $('#form_'+controlador).on("keyup keypress", function(e) {
      var code = e.keyCode || e.which; 
      if (code === 13) {               
          form_farming_plots_validates(); 
          e.preventDefault();
          return false;
      }
    });
}

function evt_delete_row(evt)
{
  if(typeof evt != undefined)
  {
    return $(evt).parent().parent().fadeOut();
  }
}

function confirm_modal(id)
{ //console.log(controlador);
  $('#delete_'+id).off().on("click", function (evt) {
    event.preventDefault();
   //console.log(id);
    //_id = $(this).data('id');
    row = this;
    //bt = $(this).parent().parent().fadeOut();
    //bt = $(this).closest('table').attr('id'); //table id
    //no = $(this).parent().parent().data("index"); //to get row number when we remove it
    //console.log(bt);
    //console.log(no);

    dataConfirmModal.confirm({
                                title: 'Eliminar un registro?',
                                text: 'Está seguro que desea eliminar un registro?',
                                commit: 'Eliminar',
                                cancel: 'Salir',
                                zindex: 1055,
                                onConfirm: function () { 
                                                           delete_modal(id);
                                                       },
                                onCancel: function () {
                                                      }
                            });
    });
=======
    showSpinner: false,
    ease: 'ease',
    speed: 500
  });

  $(".upper_text").on('keyup', function (e) {
    if (e.which >= 97 && e.which <= 122) {
      var newKey = e.which - 32;
      // I have tried setting those
      e.keyCode = newKey;
      e.charCode = newKey;
    }
    $(this).val(($(this).val()).toUpperCase());
  });
  
});
function confirm_modal()
{
  $(".delete").on("click", function () {
    _id = $(this).data('id');
    dataConfirmModal.confirm({
      title: 'Eliminar un registro?',
      text: 'Está seguro que desea eliminar un registro?',
      commit: 'Eliminar',
      cancel: 'Salir',
      zindex: 1055,
      onConfirm: function () {
        delete_modal(controlador, _id);
      },
      onCancel: function () {
      }
    });
  });
>>>>>>> products

}


$(".numeric").on({
  "focus": function(event) {
    $(event.target).select();
  },
  "keyup": function(event) {
    $(event.target).val(function(index, value) {
      return value.replace(/\D/g, "")
         .replace(/([0-9])([0-9]{0})$/, '$1')
        .replace(/\B(?=(\d{3})+(?!\d)\.?)/g, ".");
    });
  }
});


function delete_modal(element_id)
{
<<<<<<< HEAD
  progress(true);
  $.ajax({
      url: window.location+'/'+ element_id,
      type: 'POST',
      datatype: 'json',
      data: {"_method":"delete"},
      success: function (resp) {
        progress(false);
        $('table').bootstrapTable('refresh');
        
        evt_delete_row(row);
        //$('#tr_' + element_id).fadeOut();
        alert_sarah("El registro fue eliminado con exito!", "success");
      },
      error: function (resp) {
        progress(false);
        if(resp.status == 400)
        {
           alert_sarah("El registro depende de otros modulos<br> No se puede eliminar!", "info");
        }
        else if(resp.status == 500)
        {
          alert_sarah("Ocurrio un error en el servidor!", "danger");
        }
      }
=======
  $(".commit").addClass('disabled');
  $.ajax({
    type: "POST",
    url: "/" + controlador + "/" + element_id,
    data: {"_method": "delete"},
    success: function (msg) {
      $('#tr_' + element_id).fadeOut();
      alert_sarah("El registro fue eliminado con exito!", "success");
      $("#ajax-loader").addClass('hide');
      $(".commit").removeClass('disabled');
    },
    error: function (msg)
    {
      alert_sarah("Ocurrio un error al eliminar el campo!", "danger");
      $(".commit").removeClass('disabled');
    },
    fail: function (msg)
    {
      alert_sarah("Ocurrio un error en el servidor!", "danger");
      $(".commit").removeClass('disabled');
    }

>>>>>>> products
  });
}


function alert_sarah(contenido, classe, time)
{
  if (typeof time != "undefined")
  {
    time = time;
  }
  else
  {
<<<<<<< HEAD
    time = 3000;
=======
    time = 2000;
>>>>>>> products
  }
  $('#alerta').addClass("alert-" + classe).removeClass("hide");
  $('#alerta span').html(contenido);
  setTimeout(function ()
  {
    $('#alerta').addClass("hide").removeClass("alert-" + classe);
  }, time);

}
<<<<<<< HEAD

/**************funcion para validar datos como acentos etc***************/
$.fn.valida_sarah = function (cadena) {
  $(this).on({
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

validate_generic_form = function (sufixe)
{
  
  $('#btn_submit_' + sufixe).on('click', function (e) {
    
    e.preventDefault();
    progress(true);
    
=======
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

function validate_generic_form(sufixe)
{
  $('#btn_submit_' + sufixe).on('click', function (e) {
    e.preventDefault();
>>>>>>> products
    if ($("#form_" + sufixe).data('bootstrapValidator').isValid())
    {
      $('#btn_submit_' + sufixe).prop("disabled", false);
      $('#btn_submit_' + sufixe).submit();
<<<<<<< HEAD
      delayedRedirect(controlador);

=======
>>>>>>> products
    }
    else
    {
      $('#btn_submit_' + sufixe).prop("disabled", true);
      $("#form_" + sufixe).data('bootstrapValidator').validate();
    }
<<<<<<< HEAD

  });

=======
  });

>>>>>>> products
  $('#btn_cancel_' + sufixe).on('click', function (e) {
    e.preventDefault();
    //$("#form_" + sufixe)[0].reset();
    // $('#form_' + sufixe).data('bootstrapValidator').resetForm();
  });
}

<<<<<<< HEAD
function generic_response_form(sufixe) 
{
    $(document).on("ajax:success", 'form#form_' + sufixe, function (event, data, status, xhr, result) {
    progress(false);
=======
function generic_response_form(sufixe) {

  $(document).on("ajax:success", 'form#form_' + sufixe, function (event, data, status, xhr, result) {
>>>>>>> products
    alert_sarah("El registro fue realizado con exito", "success");
    $("#form_" + sufixe)[0].reset();
    $("#form_" + sufixe).data('bootstrapValidator').resetForm();
    $("#errors").hide();
    $('input:visible:enabled:first').focus();
  });

  $(document).on('ajax:error', 'form#form_' + sufixe, function (event, jqxhr, settings, exception) {
<<<<<<< HEAD
    progress(false);
=======
>>>>>>> products
    alert_sarah("Ocurrió un error al crear el registro!", "danger");
    /*recorrer los errores en caso de tener*/
    $.each(jqxhr.responseJSON, function (index, value) {
      if (typeof index == "string")
      {
        $('#errors').html(index + ": " + value);
      }
    });
  });
}

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
<<<<<<< HEAD
}

function progress(data)
{
  if(data=true)
  {
      NProgress.start();
      NProgress.set(0.4) 
      
   }
   else
  { 
      NProgress.done();
  }

  NProgress.done();
}

function md_popover(_id,_title,_content)
{
  $('#'+_id).popover({ 
                          html : true,
                          title: _title,
                          placement: 'top',
                          trigger: 'click',
                          content: "<b>"+_content+"</b>"
                      }).popover('hide');
}

function actionFormatter(value, row, index) {
  //console.log(row.id);
  
    return [
                '<a class="edit btn btn-primary btn-sm" href="'+window.location.pathname+'/'+row.id+'/edit" title="Editar">',
                '  <i class="fa fa-1x fa-pencil"></i>',
                '</a> ',
                ' <a class="remove  btn btn-primary delete btn-sm" id="delete_'+row.id+'" data-id='+row.id+' title="Eliminar">',
                '  <i class="fa fa-1x fa-trash"></i>',
                '</a>'
            ].join('');
};

function convert_date(fullDate)
{
    var dateTimeSplit = fullDate.split('/');
   
    var day = dateTimeSplit[0];
    var month = dateTimeSplit[1];
    var year = dateTimeSplit[2];

    var currentDate = year + '/' + month+ '/' + day;
  return currentDate;
}

function delayedRedirect(controller){
  setTimeout(function ()
  {
     window.location = "/"+controller;
  }, 50);
}

window.actionEvents = {
    'click .edit': function (e, value, row, index) {
    },
    'click .remove': function (e, value, row, index) { 

       confirm_modal(row.id);
    }
};


function flatJSON(res) {
       return  $.flatJSON({data:res, flat:true});
}

var loadBootstrapTable = function (data) {
    debugger;
  $('table').bootstrapTable({
    data: data.data,
    needFlatJSON: true,
    height: 400,
    width: 400,
    striped: true,
    pagination: true,
    pageSize: 15,
    pageList: [10, 15, 20, 25, 30],
    search: true
  });
};

function totalFormatter(data) {
    console.log(data);
    return data.length;

=======
}
/**************json para traer valores fk de bootstrap table***************/
JSON.unflatten = function (data) {
  "use strict";
  if (Object(data) !== data || Array.isArray(data))
    return data;
  var result = {}, cur, prop, idx, last, temp;
  for ( var p in data ) {
    cur = result, prop = "", last = 0;
    do {
      idx = p.indexOf(".", last);
      temp = p.substring(last, idx !== -1 ? idx : undefined);
      cur = cur[prop] || (cur[prop] = (!isNaN(parseInt(temp)) ? [] : {}));
      prop = temp;
      last = idx + 1;
    }
    while (idx >= 0);
    cur[prop] = data[p];
  }
  return result[""];
}
JSON.flatten = function (data) {
  var result = {};
  function recurse(cur, prop) {
    if (Object(cur) !== cur) {
      result[prop] = cur;
    }
    else if (Array.isArray(cur)) {
      for ( var i = 0, l = cur.length; i < l; i++ )
        recurse(cur[i], prop ? prop + "." + i : "" + i);
      if (l == 0)
        result[prop] = [];
    }
    else {
      var isEmpty = true;
      for ( var p in cur ) {
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
  for ( var x = 0; x < tries; x++ ) {
    noOpt = [];
    time = Date.now();
    for ( var i = 0; i < count; i++ ) {
      temp = JSON.parse(JSON.stringify(fillObj({}, 4)));
      touchObj(temp, noOpt);
    }
    time = Date.now() - time;
    result.push("Nested : " + noOpt.length + " : " + time);
    //
    noOpt = [];
    time = Date.now();
    for ( var i = 0; i < count; i++ ) {
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
    for ( var i = 0; i < obj["bar5"].length; i++ ) {
      fillObj(obj["bar5"][i], depth - 1);
    }
  }
  return obj;
}
function touchObj(obj, noOpt) {
  if (Array.isArray(obj)) {
    for ( var i = 0; i < obj.length; i++ ) {
      touchObj(obj[i], noOpt);
    }
  }
  else if (typeof obj === "object" && obj !== null) {
    for ( var i in obj ) {
      touchObj(obj[i], noOpt);
    }
  }
  else {
    noOpt.push(true);
  }
  return noOpt;
>>>>>>> products
}

$(document).on('turbolinks:click', function() {
  setTimeout(function() {
                            NProgress.start();    
                         }, 600)

});

$(document).on('turbolinks:render', function() {
setTimeout(function() {
                          NProgress.done();
                          NProgress.remove();
                      }, 600)
  
});