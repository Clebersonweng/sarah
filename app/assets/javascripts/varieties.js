$(document).ready(function ()
{

  controlador = $("#controller").val();
  form_varieties_validates();
  generic_response_form(controlador);
  $("#bt_varieties").bootstrapTable();
});

function form_varieties_validates()
{
  $('#form_varieties').bootstrapValidator({
    excluded: [':disabled', ':hidden', ':not(:visible)'],
    fields: {
      "variety[descr]": {
        validators: {
          notEmpty: {
            message: 'Este campo es obligatório'
          },
          stringLength: {
            min: 3,
            max: 30,
            message: 'El nombre no puede ser menor que 3 y mayor que 50 caracteres'
          },
          regexp: {
            regexp: /^[a-zA-Z0-9_ ]+$/,
            message: 'El nombre debe consistir en caracteres alfanuméricos'
          }
        }
      }
    }
  }).on('init.field.fv', function (e, data) 
  {
    e.preventDefault();
    data.fv.disableSubmitButtons(true);
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


