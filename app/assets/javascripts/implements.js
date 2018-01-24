var width=0;
var velocity=0;
var hectare = 10000; /**un hectarea consiste en 10000 m2*/
var cte = 0;  /*capacidad de trabajo efectiva**/
var to = 0; /**tiempo operativo*/
var meterPerKm = 1000; /**cantidad de metros que contiene un kilometro*/
var timeOperative;

$(document).ready(function ()
{

	controlador = $("#controller").val();
	generic_response_form(controlador);
	form_implements_validates();

	$('#velocity').on("focusout",function(event){
		width = $("#width").val();
		velocity = $("#velocity").val();
		cte = (width * velocity * meterPerKm)/hectare;
		cte.toFixed(4);
		to = 1/cte;
		timeOperative = to.toFixed(4);
		$("#implement_oper_time").val(timeOperative);
	});

    /**limpiar los campos cargados al hacer click en salir*/
    $('#exit').on("click",function(event){
        $("#velocity").val("");
        $("#width").val("");
        $("#implement_oper_time").val("");
    });

    $('#openBtn').on("click",function(event){
        event.preventDefault();
		$('#myModal').modal({show:true})
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
			     }
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



