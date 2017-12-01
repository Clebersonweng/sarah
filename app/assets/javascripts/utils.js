var controlador;
var _id;
$(document).ready(function ()
{  
  if (typeof controlador == "undefined")
  {
    alert("variable controlador no declarada");
  }
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

  $(document).on('click', '.pull-right.pagination', {}, function (e) {
    confirm_modal();
  });

  $("#buscar").on("keyup", function ()
  {
    confirm_modal();
  });

  NProgress.configure({
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
    time = 3000;
  }
  $('#alerta').addClass("alert-" + classe).removeClass("hide");
  $('#alerta span').html(contenido);
  setTimeout(function ()
  {
    $('#alerta').addClass("hide").removeClass("alert-" + classe);
  }, time);

}

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
    
    if ($("#form_" + sufixe).data('bootstrapValidator').isValid())
    {
      $('#btn_submit_' + sufixe).prop("disabled", false);
      $('#btn_submit_' + sufixe).submit();
      delayedRedirect(controlador);

    }
    else
    {
      $('#btn_submit_' + sufixe).prop("disabled", true);
      $("#form_" + sufixe).data('bootstrapValidator').validate();
    }

  });

  $('#btn_cancel_' + sufixe).on('click', function (e) {
    e.preventDefault();
    //$("#form_" + sufixe)[0].reset();
    // $('#form_' + sufixe).data('bootstrapValidator').resetForm();
  });
}

function generic_response_form(sufixe) 
{
    $(document).on("ajax:success", 'form#form_' + sufixe, function (event, data, status, xhr, result) {
    progress(false);
    alert_sarah("El registro fue realizado con exito", "success");
    $("#form_" + sufixe)[0].reset();
    $("#form_" + sufixe).data('bootstrapValidator').resetForm();
    $("#errors").hide();
    $('input:visible:enabled:first').focus();
  });

  $(document).on('ajax:error', 'form#form_' + sufixe, function (event, jqxhr, settings, exception) {
    progress(false);
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