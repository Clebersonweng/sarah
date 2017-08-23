$(document).ready(function ()
{
  
  controlador = $("#controller").val();
  validate_generic_form(controlador);
  generic_response_form(controlador);
  form_type_of_crops_validates();
  confirm_modal();
  
  $("#buscar").on("keyup", function ()
  {
    confirm_modal();
  });

});

function form_type_of_crops_validates()
{
  $('#form_type_of_crops').bootstrapValidator({
    excluded: [':disabled', ':hidden', ':not(:visible)'],
    fields: {
      "type_of_crop[name]": {
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
