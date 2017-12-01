$(document).ready(function ()
{
  controlador = $("#controller").val();   
  generic_response_form(controlador);
  form_history_sales_validates();

});


function form_history_sales_validates()
{
  $('#form_history_sales').bootstrapValidator({
    excluded: [':disabled', ':hidden', ':not(:visible)'],
    fields: {
      "history_sale[period]": {
        validators: {
          notEmpty: {
            message: 'Este campo es obligatório'
          },
          regexp: {
            regexp: /^[0-9.]+$/,
            message: 'No es un año válido.'
          }
        }
      },
      "history_sale[date]": {
        validators: {
          notEmpty: {
            message: 'Este campo es obligatório'
          },
          date: {
            format: 'dd/mm/yyyy',
            message: 'No es una fecha válida'
          }
        }
      },
      "history_sale[quantity]": {
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