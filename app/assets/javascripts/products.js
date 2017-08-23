var price, dosage, result = 0;

$(document).ready(function ()
{
  controlador = $("#controller").val();
  //form_farming_plot_validates();
  $('#product_dosage').on('focusout', function (e) {
    price_x_dosage();
  });

  validate_generic_form(controlador);
  generic_response_form(controlador);
  form_products_validates(); /*es obligatório que contenga required en el form para funcionar*/

});





$('#product_cost_per_hectare').on('dp.change dp.show', function (e)
{ // Revalidate the date when user change it
  if ($('#product_cost_per_hectare').val() != "")
  {
    $('#form_products').bootstrapValidator('revalidateField', $('#product_cost_per_hectare'));
  }
})

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
  $("#form_products").bootstrapValidator({
    excluded: [':disabled', ':hidden', ':not(:visible)'],
    fields: {
      'product[maker]': {
        row: '.col-xs-4',
        validators: {
          notEmpty: {
            message: 'Este campo es obligatório!'
          },
          stringLength: {
            min: 1,
            max: 30,
            message: 'La descripción debe contener entre 3 y 30 caracteres'
          },
          regexp: {
            regexp: /^[a-zA-Z0-9 ]+$/,
            message: 'La descripción debe contener numeros o letras!'
          }
        }
      },
      'product[tradename]': {
        row: '.col-xs-4',
        validators: {
          notEmpty: {
            message: 'Este campo es obligatório!'
          }
        }
      },
      'product[price]': {
        validators: {
          notEmpty: {
            message: 'Este campo es obligatório!'
          },
          stringLength: {
            min: 3,
            max: 20,
            message: 'Debe contener min 3 y max 20 caracteres'
          },
          regexp: {
            regexp: /^[0-9]+$/,
            message: 'Solo es permitido números!'
          }
        }
      },
      'product[unit_of_measurement_id]': {
        validators: {
          notEmpty: {
            message: 'Este campo es obligatório!'
          }
        }
      },
      'product[dosage]': {
        validators: {
          notEmpty: {
            message: 'Este campo es obligatório!'
          }
        }
      },
      'product[cost_per_hectare]': {
        validators: {
          notEmpty: {
            message: 'Este campo es obligatório!'
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
    alert("hola mndd");
    //$("#form_products").bootstrapValidator('revalidateField', 'investments');
  });
}
