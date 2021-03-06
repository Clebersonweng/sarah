var width=0;
var velocity=0;
var kilometer = 1000;  //1 km = 1000 m
var hectare  = 10000; // 10000 metros cuadradosvar cte = 0;  /*capacidad de trabajo efectiva**/
var to = 0; /**tiempo operativo*/
var timeOperative;
var field_eficient; //eficiencia de campo, tiempo perdido para recarga, tierra con curvas y remates normal 85% de 100
$(document).ready(function ()
{

	controlador = $("#controller").val();
	generic_response_form(controlador);
	form_implements_validates();
   $('#width_machine_impl,#work_velocity_impl,#real_width_machine_impl,#real_work_velocity_impl').valida_sarah('0123456789.,');
	
   $('#save_ctt_impl').on("click",function()
   {
      var ctt = total_working_capacity($("#width_machine_impl").val(),$("#work_velocity_impl").val());
      $("#implement_working_capacity").val(ctt.toFixed(4)).focus();
      $('form').bootstrapValidator('revalidateField', 'implement[working_capacity]');  
   });

   $('#save_cte_impl').on("click",function()
   {
      var cte = total_working_capacity_efective($("#real_width_machine_impl").val(),$("#real_work_velocity_impl").val());
      $("#implement_working_capacity_effective").val(cte.toFixed(4)).focus();
      $('form').bootstrapValidator('revalidateField', 'implement[working_capacity_effective]');  

      var result = total_time_oper( $('#implement_working_capacity_effective').val(),$("#implement_working_capacity").val() );
      $("#implement_oper_time").val(result.toFixed(4));

   });

	$('#implement_working_capacity_effective').on("focusout",function()
	{
		var result = total_time_oper( $('#implement_working_capacity_effective').val(),$("#implement_working_capacity").val() );
		$("#implement_oper_time").val(result.toFixed(4));
		$('form').bootstrapValidator('revalidateField', 'implement[time_oper]');  
	});

});

function form_implements_validates()
{
  $('#form_implements').bootstrapValidator({
    excluded: [':disabled', ':hidden', ':not(:visible)'],
	    fields: {
				      "implement[name]": {
				        validators: {
				          notEmpty: {
				            message: 'Este campo es obligatório'
				          }
				        }
				      },
				    "implement[model]": {
				        validators: {
				          notEmpty: {
				            message: 'Este campo es obligatório'
				          }
				        }
				      },
				   "implement[oper_time]": {
				        validators: {
				          notEmpty: {
				            message: 'Este campo es obligatório'
				          }
				        }
				      },
				    "implement[machine_id]": {
				        validators: {
				          notEmpty: {
				            message: 'Este campo es obligatório'
				          }
				        }
				      },
				    "implement[coef_cccr]": {
				        validators: {
				          notEmpty: {
				            message: 'Este campo es obligatório'
				          }
				        }
				      },
				      "implement[brand]": {
				        validators: {
				          notEmpty: {
				            message: 'Este campo es obligatório'
				          }
				        }
				     },
				      "implement[year]": {
				        validators: {
				          notEmpty: {
				            message: 'Este campo es obligatório'
				          }
				        }
				     },
				      "implement[price]": {
				        validators: {
				          notEmpty: {
				            message: 'Este campo es obligatório'
				          }
				        }
				    }/*,
		           'machine[working_capacity]': {
		                    validators: {
		                        numeric: {
		                            message: 'El valor no es un número válido'
		                    }
		                }
		            },
		           'machine[working_capacity_effective]': {
		                    validators: {
		                        numeric: {
		                            message: 'El valor no es un número válido'
		                        }
		                    }
		            }*/
		    	}

  }).on('init.field.fv', function (e, data) {
    e.preventDefault();
    if (data.fv.getInvalidFields().length > 0) {    // There is invalid field
      data.fv.disableSubmitButtons(true);
    }
  }).on('success.field.fv', function (e, data) {
    e.preventDefault();
    if (data.fv.getInvalidFields().length > 0) {    // There is invalid field
      data.fv.disableSubmitButtons(true);
    }
  }).on('change', 'form', function (e) {
    e.preventDefault();
    //$("#form_products").bootstrapValidator('revalidateField', 'investments');
  });
}


function total_working_capacity(width_machine,velocity)
{
  var  result = (width_machine * velocity * kilometer) / hectare;
  return result;
}

function total_working_capacity_efective(real_width_machine,real_velocity)
{
  var result = (real_width_machine * real_velocity * kilometer) / hectare;
  return result;
}




