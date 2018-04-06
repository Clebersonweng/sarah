$(document).ready(function ()
{
  controlador = $("#controller").val();   
  generic_response_form(controlador);
  form_type_machines_validates();

});

function form_type_machines_validates()
{
  $('#form_type_machines').bootstrapValidator({
    excluded: [':disabled', ':hidden', ':not(:visible)'],
    fields: {
      "type_machine[description]": {
        validators: {
          notEmpty: {
            message: 'Este campo es obligatório'
          },
          stringLength: {
            min: 3,
            max: 30,
            message: 'El campo debe contener como minimo tres caracteres'
          },
          regexp: {
            regexp: /^[a-zA-Z ]+$/,
            message: 'Debe contener solamente letras'
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
    if (data.fv.getInvalidFields().length > 0) 
    {    // There is invalid field
      data.fv.disableSubmitButtons(true);
    }
  }).on('change', 'form', function (e) {
    e.preventDefault();
  });
}
