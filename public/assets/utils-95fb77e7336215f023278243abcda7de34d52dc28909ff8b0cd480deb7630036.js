function evt_delete_row(e){if(void 0!=typeof e)return $(e).parent().parent().fadeOut()}function confirm_modal(e){$("#delete_"+e).off().on("click",function(){event.preventDefault(),row=this,dataConfirmModal.confirm({title:"Eliminar un registro?",text:"Est\xe1 seguro que desea eliminar un registro?",commit:"Eliminar",cancel:"Salir",zindex:1055,onConfirm:function(){delete_modal(e)},onCancel:function(){}})})}function delete_modal(e){progress(!0),$.ajax({url:window.location+"/"+e,type:"POST",datatype:"json",data:{_method:"delete"},success:function(){progress(!1),$("table").bootstrapTable("refresh"),evt_delete_row(row),alert_sarah("El registro fue eliminado con exito!","success")},error:function(e){progress(!1),400==e.status?alert_sarah("El registro depende de otros modulos<br> No se puede eliminar!","info"):500==e.status&&alert_sarah("Ocurrio un error en el servidor!","danger")}})}function alert_sarah(e,t,o){o="undefined"!=typeof o?o:3e3,$("#alerta").addClass("alert-"+t).removeClass("hide"),$("#alerta span").html(e),setTimeout(function(){$("#alerta").addClass("hide").removeClass("alert-"+t)},o)}function generic_response_form(e){$(document).on("ajax:success","form#form_"+e,function(t,o){progress(!1),alert_sarah("El registro fue realizado con exito","success"),$("#form_"+e)[0].reset(),$("#form_"+e).data("bootstrapValidator").resetForm(),$("input:visible:enabled:first").focus(),$.rails.enableElement($("a[data-disable-with]")),seta_valores(o),console.log(o)}).on("ajax:error","form#form_"+e,function(t,o){alert_sarah("Ocurri\xf3 un error al crear el registro!","danger"),progress(!1),$model=$("form#form_"+e).data("model"),$.each(o.responseJSON,function(e,t){$input=$('input[name="'+$model+"["+e+']"]'),$input.closest(".form-group").addClass("has-error").find(".help-block").html(t.join(" & "))}),$.rails.enableElement($("a[data-disable-with]"))})}function progress(e){(e=!0)?(NProgress.start(),NProgress.set(.4)):NProgress.done(),NProgress.done()}function md_popover(e,t,o){$("#"+e).popover({html:!0,title:t,placement:"top",trigger:"click",content:"<b>"+o+"</b>"}).popover("hide")}function actionFormatter(e,t){return['<a class="edit btn btn-primary btn-sm" href="'+window.location.pathname+"/"+t.id+'/edit" title="Editar" >','  <i class="fa fa-1x fa-pencil"></i>',"</a> ",' <a class="remove  btn btn-primary delete btn-sm" id="delete_'+t.id+'" data-id='+t.id+' title="Eliminar">','  <i class="fa fa-1x fa-trash"></i>',"</a>"].join("")}function btn_income(e,t){return['<a class="edit btn btn-info btn-sm btn_statistics" title="grafico de gastos" data-id='+t.type_of_crop_id+" >",'  <i class="fa fa-line-chart" aria-hidden="true"></i>',"</a> ",'<a class="edit btn btn-warning btn-sm btn_income" title="ver cuenta de resultados" data-id='+t.type_of_crop_id+" >",'  <i class="fa fa-table" aria-hidden="true"></i>',"</a> "].join("")}function convert_date(e){var t=e.split("/"),o=t[0],a=t[1],n=t[2],r=n+"/"+a+"/"+o;return r}function delayedRedirect(){setTimeout(function(){},70)}function enabled_button_add_item(e,t){" undefined"!=typeof $("#"+e).val()&&""!=$("#"+e).val()?$("#"+t).removeClass("disabled"):$("#"+t).addClass("disabled")}function flatJSON(e){return $.flatJSON({data:e,flat:!0})}function totalTextFormatter(){return"Total :"}function footerStyle(e,t,o){return o="0"+o}function index(){return index="0"+index}function seta_valores(){}function cellStyle(e,t,o){var a=["active","success","info","warning","danger"];return o%2===0&&o/2<a.length?{classes:a[o/2]}:{}}function set_numeric(e){var t=e.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g,"$1.");return t}function set_numeric(e){var t=e.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g,"$1.");return t}var controlador,_id,TOTAL=0;$(document).ready(function(){$("form").bootstrapValidator(),$("#btn_submit_"+controlador).on("click",function(e){e.preventDefault(),progress(!0);var t=$("#form_"+controlador).data("bootstrapValidator").isValid();t?(console.log("es valido"),$("#btn_submit_"+controlador).submit(),delayedRedirect(controlador)):(console.log("no es valido"),$("#form_"+controlador).data("bootstrapValidator").validate(),$.rails.enableElement($("a[data-disable-with]")))}),$(".change_status").on("click",function(){console.log("click evento cambiar")}),$(".tabs_sarah").on("click",function(){function e(){$("table").bootstrapTable()}$(".panel-body").fadeOut(1600,"linear",e),$(".panel-body").fadeIn("slow",3e3)}),"undefined"==typeof controlador&&alert("variable controlador no declarada"),$(".only_numbers").valida_sarah("0123456789."),$(".only_letters").valida_sarah("azAZ "),$(".pull-left.pagination-detail").hide(),$(".datepicker").datepicker({format:"dd/mm/yyyy",rtl:!1,language:"es",orientation:"bottom",todayBtn:!0,autoclose:!0}),$(document).on("click",".pull-right.pagination",{},function(){confirm_modal()}),$("#buscar").on("keyup",function(){confirm_modal()}),NProgress.configure({showSpinner:!1,ease:"ease",speed:500}),$(".upper_text").on("keyup",function(e){if(e.which>=97&&e.which<=122){var t=e.which-32;e.keyCode=t,e.charCode=t}$(this).val($(this).val().toUpperCase())}),$(".replace_comma").on("keyup",function(e){(e.which=44)&&$(this).val($(this).val().replace(/,/g,"."))}),$(".table").on("load-success.bs.table",function(){}),$(".table").on("load-error.bs.table",function(){}),$(".numeric").on({focus:function(e){$(e.target).select()},keyup:function(e){$(e.target).val(function(e,t){return t.replace(/\D/g,"").replace(/([0-9])([0-9]{0})$/,"$1").replace(/\B(?=(\d{3})+(?!\d)\.?)/g,".")})}}),disabled_enter()});var disabled_enter=function(){$("#form_"+controlador).on("keyup keypress",function(e){var t=e.keyCode||e.which;if(13===t)return form_farming_plots_validates(),e.preventDefault(),!1})};$.fn.valida_sarah=function(e){$(this).on({keypress:function(t){var o=t.which,a=t.keyCode,n=String.fromCharCode(o).toLowerCase(),r=e;(r.indexOf(n)!=-1||9==a||37!=o&&37==a||39==a&&39!=o||8==a||46==a&&46!=o)&&161!=o||t.preventDefault()}})},window.actionEvents={"click .edit":function(e,t,o){console.log(o)},"click .remove":function(e,t,o){confirm_modal(o.id)}},window.formatter={"click .edit":function(e,t,o){console.log(o)},"click .remove":function(e,t,o){confirm_modal(o.id)}};