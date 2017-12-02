$(document).ready(function ()
{
  controlador = $("#controller").val();   
  generic_response_form(controlador);
  form_farming_plots_validates();
});


function form_farming_plots_validates()
{
  $('#form_farming_plots').bootstrapValidator({
    excluded: [':disabled', ':hidden', ':not(:visible)'],
    fields: {
      "farming_plot[name]": {
        validators: {
          notEmpty: {
            message: 'Este campo es obligatório'
          },
          regexp: {
            regexp: /^[a-zA-Z0-9_ ]+$/,
            message: 'El nombre debe consistir en caracteres alfanuméricos'
          }
        }
      },
      "farming_plot[area]": {
        validators: {
          notEmpty: {
            message: 'Este campo es obligatório'
          },
          stringLength: {
            min: 1,
            max: 30,
            message: 'El nombre no puede ser menor que 3 y mayor que 50 caracteres'
          },
          greaterThan: {
            value: 1,
            message: 'El campo debe contener un valor mayor que 0 !'
          },
          regexp: {
            regexp: /^[0-9.]+$/,
            message: 'El área debe consistir en números'
          }
        }
      },
      "farming_plot[person_id]": {
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