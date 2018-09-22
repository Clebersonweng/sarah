const KILOMETER = 1000;  //1 km = 1000 m
const HECTARE   = 10000; // 10000 metros cuadrados

var controlador;
var _id;
var TOTAL = 0;



$(document).ready(function ()
{
   $("form").bootstrapValidator();

   /*validacion para el formulario no enviar vacio debido al ajax verifica si es valido envia caso contrario muestra los mensajes */
   $('#btn_submit_' + controlador).on('click', function (e) 
   {
      e.preventDefault();
      progress(true);
      var es_valido = $("#form_"+controlador).data('bootstrapValidator').isValid();

      if (es_valido)
      {
         $(this).button('loading');
         $('form').submit();
      }
      else
      {
         
         $("#form_" + controlador).data('bootstrapValidator').validate();
         $(this).button('reset');
         //$("#btn_submit_unit_of_measurements").html("<i class='fa fa-floppy-o' aria-hidden='true'></i>  Guardar");
      }
   });

   $( ".change_status" ).on("click",function() 
   {
      console.log("click evento cambiar");
   });

  $( "#submenu_index" ).on("click",function() 
   {
      function complete() 
      {
         $("table").bootstrapTable();
      }

      $(".panel-body").fadeOut( 500, "linear", complete );
      $(".panel-body").fadeIn("slow",500);

   });
  $( "#submenu_new" ).on("click",function() 
   {
      function complete() 
      {
         $("table").bootstrapTable();
      }

      $(".panel-body").fadeOut( 500, "linear", complete );
      $(".panel-body").fadeIn("slow",500);

   });


   if (typeof controlador == "undefined")
   {
      alert("variable controlador no declarada");
   }

   //confirm_modal();
   $('.only_numbers').valida_sarah('0123456789.');
   $('.only_letters').valida_sarah('azAZ ');
   $(".pull-left.pagination-detail").hide();

   $('.datepicker').datepicker(
   {
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
   $(".upper_text").on('keyup', function (e)
   {
      if (e.which >= 97 && e.which <= 122) {
         var newKey = e.which - 32;
         // I have tried setting those
         e.keyCode = newKey;
         e.charCode = newKey;
      }
      $(this).val(($(this).val()).toUpperCase());
   });

   $(".replace_comma").on('keyup', function (e) {
      if (e.which = 44) 
      {
         $(this).val($(this).val().replace(/,/g, '.'));
      }
   });

   $('.datepicker')
                  .datepicker({
                     format: 'dd/mm/yyyy'
                  }).on('changeDate', function(e) {
                                                      $(e.currentTarget.form.id).bootstrapValidator('revalidateField', 'e.target.id');  
                                                   });   

   //sirve para saber el estado de carga de la tabla
   $('.table').on('load-success.bs.table', function(e, data)
   {
   //console.log('Success', data);
   });

   $('.table').on('load-error.bs.table', function(e, status){
   // console.log('Error tabela', status);
   });

   $(".numeric").on({
      "focus": function(event) {
         $(event.target).select();
      },
      "keyup": function(event) {
         $(event.target).val(function(index, value) 
         {
            return value.replace(/\D/g, "")
            .replace(/([0-9])([0-9]{0})$/, '$1')
            .replace(/\B(?=(\d{3})+(?!\d)\.?)/g, ".");
         });
      }
   });
   //desabilita el enter para que pueda validar solamente en evento boton
   disabled_enter();
   /*$("#submenu_new").on("click",function()
   {
      $.each($('#side-menu li a'),function(index,valor)
      {
         if($(this).hasClass("active"))
         {
            $(this).removeClass("active");   
         }
         if(window.location.pathname == $(valor).attr("href"))
         {
            console.log($(valor).attr("href"));
            $(valor).addClass("active");   
         }
      });
   });*/

});

function replace_comma(var_string)
{
   var_string.replace(',','.')
}

function replace_point(var_string)
{
   var_string.replace('.',',');
}
function evt_delete_row(evt)
{
   if(typeof evt != undefined)
   {
      return $(evt).parent().parent().fadeOut();
   }
}

function confirm_modal(id)
{ 
   $('#delete_'+id).off().on("click", function (evt) {
      evt.preventDefault();

      dataConfirmModal.confirm({
      title: 'Eliminar un registro?',
      text: 'Está seguro que desea eliminar un registro?',
      commit: 'Eliminar',
      cancel: 'Salir',
      zindex: 1055,
      onConfirm: function () { 
                                delete_modal(id);
                            },
      onCancel: function ()   {

                              }
      });
   });

}

var disabled_enter = function()
{
   $('#form_'+controlador).on("keyup keypress", function(e) {
      var code = e.keyCode || e.which; 
      if (code === 13) 
      {               
         form_farming_plots_validates(); 
         e.preventDefault();
         return false;
      }
   });
}

function delete_modal(element_id)
{
   progress(true);
   $.ajax({
      url: window.location+'/'+ element_id,
      type: 'POST',
      datatype: 'json',
      data: {"_method":"delete"},
      success: function (resp) 
      {
         progress(false);
         $('table').bootstrapTable('refresh');
         evt_delete_row(row);
         alert_sarah("El registro fue eliminado con exito!", "success");
      },
      error: function (resp) 
      {
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


function generic_response_form(sufixe,force) 
{
   $(document).on("ajax:success", 'form#form_' + sufixe, function (e, data, status) 
   {
      progress(false);
      //delayedRedirect();
      setTimeout(function ()
      {
         alert_sarah("El registro fue realizado con exito", "success");
      }, 500);

      $("#form_" + sufixe)[0].reset();
      $("#form_" + sufixe).data('bootstrapValidator').resetForm();
      $('input:visible:enabled:first').focus();
      $('#btn_submit_'+sufixe).button('reset');
      seta_valores(data);
   })
   .on('ajax:error', 'form#form_' + sufixe, function (e, data, status) 
   {
      alert_sarah("Ocurrió un error al crear el registro!", "danger");
      progress(false);
      $model = $('form#form_'+sufixe).data("model");
      $.each(data.responseJSON, function (field, messages) 
      {
         $input = $('input[name="' + $model + '[' + field + ']"]');
         $input.closest('.form-group').addClass('has-error').find('.help-block').html( messages.join(' & ') );
      });
      $('#btn_submit_'+sufixe).button('reset');
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
                           trigger: 'focusin',
                           content: "<b>"+_content+"</b>"
                     }).popover('hide');
}

function actionFormatter(value, row, index) 
{  
   return [
   '<a class="edit btn btn-primary btn-sm" href="'+window.location.pathname+'/'+row.id+'/edit" title="Editar" >',
   '  <i class="fa fa-1x fa-pencil"></i>',
   '</a> ',
   ' <a class="remove  btn btn-primary delete btn-sm" id="delete_'+row.id+'" data-id='+row.id+' title="Eliminar">',
   '  <i class="fa fa-1x fa-trash"></i>',
   '</a>'
   ].join('');
};

function btn_income(value, row, index) 
{  
   return   [
               '<a class="edit btn btn-info btn-sm btn_statistics hide" title="grafico de gastos" data-id='+row.id+' >',
               '  <i class="fa fa-line-chart" aria-hidden="true"></i>',
               '</a> ',
               '<a class="edit btn btn-warning btn-sm btn_income" title="ver cuenta de resultados" data-id='+row.id+' >',
               '  <i class="fa fa-table" aria-hidden="true"></i>',
               '</a> '

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

function delayedRedirect()
{
   setTimeout(function ()
   {
      url = "/"+controlador;
      $(location).attr("href", url);       
   }, 1500);
}

function enabled_button_add_item(input_id,id)
{
   if(typeof input_id != "undefined" || typeof input_id != "" )
   {

   }
   if(typeof $("#"+input_id).val() != " undefined" && $("#"+input_id).val() != "")
   {
      $("#"+id).removeClass("disabled");
   }
   else
   {
      $("#"+id).addClass("disabled");
   }

}

window.actionEvents = {
   'click .edit': function (e, value, row, index) {
      console.log(row);
   },
   'click .remove': function (e, value, row, index) 
   { 
      confirm_modal(row.id);
   }
};

window.formatter = {
   'click .edit': function (e, value, row, index) 
   {
      console.log(row);
   },
   'click .remove': function (e, value, row, index) { 
      confirm_modal(row.id);
   }
};


function flatJSON(res) 
{
   return  $.flatJSON({data:res, flat:true});
}


function totalTextFormatter(data)
{
   return 'Total :';
}

function footerStyle(value, row, index) {
   index = '0'+index;
   return index;
}

function index(data) {
   index = '0'+index;
   return index;
}

function seta_valores(_data_)
{
   /*console.log(_data_);
   if(typeof _data_ == "object")
   {
      $.each(_data_, function (field, value) 
      {
         console.log($("#"+field));
         $("#"+field).val(value);
      });
   }*/
  
}

function cellStyle(value, row, index) {
    var classes = ['active', 'success', 'info', 'warning', 'danger'];
    
    if (index % 2 === 0 && index / 2 < classes.length) {
        return {
            classes: classes[index / 2]
        };
    }
    return {};
}

function set_numeric(value)
{
   var  n_value = value.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.")
   return n_value;
}
function set_numeric(value)
{
   var  n_value = value.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.")
   return n_value;
}

total_working_capacity = function(width_machine,velocity)
{
   var  result = (width_machine * velocity * KILOMETER) / HECTARE;
   return result;
}

total_working_capacity_efective = function(real_width_machine,real_velocity)
{
   var result = (real_width_machine * real_velocity * KILOMETER) / HECTARE;
   return result;
}

total_time_oper = function(work_capacity_total_efective,work_capacity_total)
{
   if(work_capacity_total != "" && work_capacity_total_efective != "") 
   {
      var efficient_field     = (work_capacity_total_efective) / (work_capacity_total);
      var result              = (efficient_field/work_capacity_total_efective);
      return result; 
   }
   else
   {
      console.log("no realizo el calculo de tiempo operativo");
   }

} 


/*
var loadBootstrapTable = function (data) {

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
*/

/*
validate_generic_form = function (sufixe,force)
{
if(typeof sufixe == "undefined") 
console.log("No contiene sufijo");


$('#btn_submit_' + sufixe).on('click', function (e) 
{
e.preventDefault();
progress(true);
var es_valido = $("#form_"+sufixe).data('bootstrapValidator').isValid();

if (es_valido)
{
//$('#btn_submit_' + sufixe).prop("disabled", false);
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
$("#form_" + sufixe)[0].reset();
$('#form_' + sufixe).data('bootstrapValidator').resetForm();
});
}
*/

/*
window.sumFormatter(data) 
{
console.log(data);
//field = this.field;
//return data.reduce(function (sum, row) {
//   return sum + (+row[field]);
// }, 0);
}
*//*
$(document).on('turbolinks:request-end', function(event) 
{
console.log("req end :"+event);
progress(false);
});

$(document).on('page:fetch', function(event) {
console.log("req fetch :"+event);
NProgress.start();
setTimeout(function(){
NProgress.done();
},500);
});


//turbolinks para recargar los eventos de la pagina
$(document).on ("turbolinks:load", function(event)
{
console.log("req load :"+event);
formBindings();
//$("table").bootstrapTable();
});

$(document).on('page:change', function(event) {
console.log("req change :"+event);

NProgress.set(0.4);
setTimeout(function(){
NProgress.done();
},500);
});

$(document).on('page:restore', function(event) 
{
console.log("req restore :"+event);
NProgress.remove();
});

$(document).on('turbolinks:request-start', function(event) 
{
console.log("req start :"+event);
NProgress.set(0.4);

$(".panel-body", this).fadeOut(500,function()
{
$(".panel-body").fadeIn(1000);
NProgress.done();
});
});

$(document).on('turbolinks:render', function(event) 
{
NProgress.done();
NProgress.remove();
});
*/
;
