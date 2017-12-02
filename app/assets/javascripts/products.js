var price, dosage, result = 0;


$(document).ready(function ()
{
  $('#product_dosage,#product_price').on('focusout', function (e) {
    price_x_dosage();
  });

 
  controlador = $("#controller").val();
  generic_response_form(controlador);
  form_products_validates();

});


function price_x_dosage()
{
  price = $('#product_price').val()
  dosage = $('#product_dosage').val()
  result = price * dosage;
  if (typeof price != "undefined" && dosage != "undefined")
  {
    $('#product_cost_per_hectare').val(result);
    $('form').bootstrapValidator('revalidateField', 'product[cost_per_hectare]');
  }

}

function form_products_validates() {

$('#form_products').bootstrapValidator({
  excluded: [':disabled', ':hidden', ':not(:visible)'],
  framework: 'bootstrap',
    icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
      'product[maker]': {
        validators: {
          notEmpty: {
            message: 'Este campo es obligatório'
          }
        }
      },
      'product[unit_of_measurement_id]': {
        validators: {
          notEmpty: {
            message: 'Este campo es obligatório'
          }
        }
      },
      'product[tradename]': {
        validators: {
          notEmpty: {
            message: 'Este campo es obligatório'
          },
          verify_period: {
            message: 'hay que verificar'
          }
        }
      },
      'product[price]': {
        validators: {
          notEmpty: {
            message: 'Este campo es obligatório'
          },
          stringLength: {
            min: 4,
            max: 25,
            message: 'El campo debe contener entre 4 y 25 valores'
          },
          numeric: {
                        message: 'No es un valor numérico válido',
                        thousandsSeparator: '.',
                        decimalSeparator: ','
          }
        }
      },
      'product[dosage]': {
        validators: {
          notEmpty: {
            message: 'Este campo es obligatorio'
          },
          stringLength: {
            min: 1,
            max: 15,
            message: 'El campo debe contener entre 1 y 15 numeros'
          },
          regexp: {
            regexp: /^[0-9.]+$/,
            message: 'Debe contener solamente numeros'
          }
        }
      },
      'product[cost_per_hectare]': {
        validators: {
          notEmpty: {
            message: 'Este campo es obligatório'
          },
          stringLength: {
            min: 1,
            max: 9,
            message: 'El campo debe contener entre 1 y 15 numeros'
          },
          regexp: {
            regexp: /^[0-9.]+$/,
            message: 'Debe contener números decimales'
          }
        }
      },
      'product[description]': {
        validators: {
          stringLength: {
            max: 150,
            message: 'El campo debe contener entre 150 caracteres'
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
  });
}

