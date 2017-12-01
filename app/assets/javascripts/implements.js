$(document).ready(function ()
{

  controlador = $("#controller").val();
  generic_response_form(controlador);
  form_implements_validates();

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



