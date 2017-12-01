
$(document).ready(function ()
{

  controlador = $("#controller").val();
  generic_response_form(controlador);
  form_type_of_works_validates();
  
  //md_popover("machine_consumption","Coef consumo lt/hs","Aprox. 0,16% * hp ");
  //md_popover("machine_time_oper","","Si maquinária es pulverizador</br> autopropulsado");
  
});

function form_type_of_works_validates()
{
  $('#form_type_of_works').bootstrapValidator({
    framework: 'bootstrap',
    icon: {
      valid: 'glyphicon glyphicon-ok',
      invalid: 'glyphicon glyphicon-remove',
      validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
      'type_of_work[price_hours]': {
        validators: {
          notEmpty: {
            message: 'Este campo es obligatório'
          }
        }
      },
      'type_of_work[name]': {
        validators: {
          notEmpty: {
            message: 'Este campo es obligatório'
          }
        }
      },
      'type_of_work[description]': {
        validators: {
          stringLength: {
            min: 3,
            max: 100,
            message: 'El nombre no puede ser menor que 3 y mayor que 100 caracteres'
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


/*
*/