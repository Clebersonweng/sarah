$(document).ready(function ()
{

  controlador = $("#controller").val();
  generic_response_form(controlador);
  form_models_validates();
//nameFormatter();
});

function form_models_validates()
{
  $('#form_models').bootstrapValidator({
    excluded: [':disabled', ':hidden', ':not(:visible)'],
    fields: {
      "model[name]": {
        validators: {
          notEmpty: {
            message: 'Este campo es obligatório'
          },
          stringLength: {
            min: 3,
            max: 30,
            message: 'El nombre no puede ser menor que 3 y mayor que 30 caracteres'
          },
          regexp: {
            regexp: /^[a-zA-Z0-9_ ]+$/,
            message: 'El nombre debe consistir en caracteres alfanuméricos'
          }
        }
      },
      "model[brand_id]": {
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
  });
}

/*function nameFormatter(value, row) {
        var icon = row % 2 === 0 ? 'glyphicon-star' : 'glyphicon-star-empty'
        return '<i class="glyphicon ' + icon + '"></i> ' + value;
    }
*/