$(document).ready(function () {
  form_validates();
  
  controlador = $("#controller").val();
    
  $("#program_production_stock_initial,#program_production_stock_end").off("change").on("change", function () {
    calculate_variation_stock();
    calculate_program_production();
  });
  /*$('#form_program_production').on('status.field.bv', function (e, data) {
   formIsValid = true;
   $('.form-group', $(this)).each(function () {
   $(this).addClass('has-success')
   formIsValid = formIsValid && $(this).hasClass('has-success');
   });
   
   if (formIsValid) {
   $('.submit-button', $(this)).attr('disabled', false);
   } else {
   $('.submit-button', $(this)).attr('disabled', true);
   }
   });*/
});

function calculate_variation_stock()
{
  /**tomo el area de la parcela para multiplicar por la estimacion de produccion segun el precio  determinando el ingreso bruto de las ventas**/
  var variation_stock = 0;
  variation_stock = ((parseInt($("#program_production_stock_end").val()) - (parseInt($("#program_production_stock_initial").val()))));
  if (variation_stock >= 0 || typeof variation_stock !== "undefined" && !isNaN(variation_stock))
  {
    $("#program_production_variation_stock").val(variation_stock);
    $('form').bootstrapValidator('revalidateField', 'estimate_sale[variation_stock]');
  }
  else
  {
    $("#program_production_variation_stock").val(0);
  }
}
function calculate_program_production()
{
  var prog_production = 0;
  prog_production = ((parseInt($("#estimate_sale").val()) - (parseInt($("#program_production_variation_stock").val()))));
  if (prog_production >= 0 || typeof prog_production !== "undefined" && !isNaN(prog_production))
  {
    $("#program_production_program_production").val(prog_production);
    $('form').bootstrapValidator('revalidateField', 'estimate_sale[program_production]');
  }
  else
  {
    $("#program_production_program_production").val(0);
  }
}

function form_validates()
{
  $('#form_program_production').bootstrapValidator({
    framework: 'bootstrap',
    excluded: [':disabled', ':hidden', ':not(:visible)'],
    icon: {
      valid: 'glyphicon glyphicon-ok',
      invalid: 'glyphicon glyphicon-remove',
      validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
      'program_production[stock_end]': {
        validators: {
          notEmpty: {
            message: 'Este campo es obligatorio'
          },
          stringLength: {
            min: 1,
            max: 9,
            message: 'El campo debe contener entre 1 y 9 numeros'
          },
          regexp: {
            regexp: /^[0-9]+$/,
            message: 'Debe contener solamente numeros'
          }
        }
      },
      'program_production[stock_initial]': {
        validators: {
          notEmpty: {
            message: 'Este campo es obligatorio'
          },
          stringLength: {
            min: 1,
            max: 9,
            message: 'El campo debe contener entre 1 y 9 numeros'
          },
          regexp: {
            regexp: /^[0-9]+$/,
            message: 'Debe contener solamente numeros'
          }
        }
      },
      'program_production[variation_stock]': {
        validators: {
          notEmpty: {
            message: 'Este campo es obligatorio'
          },
          stringLength: {
            min: 1,
            max: 9,
            message: 'El campo debe contener entre 1 y 9 numeros'
          },
          regexp: {
            regexp: /^[0-9]+$/,
            message: 'Debe contener solamente numeros'
          }
        }
      },
      'program_production[program_production]': {
        validators: {
          notEmpty: {
            message: 'Este campo es obligatorio'
          },
          stringLength: {
            min: 1,
            max: 9,
            message: 'El campo debe contener entre 1 y 9 numeros'
          },
          regexp: {
            regexp: /^[0-9]+$/,
            message: 'Debe contener solamente numeros'
          }
        }
      }
    }
  }).on('status.field.bv', function (e, data) {
    if (data.bv.getSubmitButton()) {
      data.bv.disableSubmitButtons(false);
    }
  });

  /*.on('keyup', '[name="program_production[variation_stock]"]', function() {
   var isEmpty = $(this).val() == '';
   $('#form_program_production')
   .formValidation('enableFieldValidators', 'program_production[variation_stock]', !isEmpty)
   .formValidation('enableFieldValidators', 'program_production[program_production]', !isEmpty);
   
   // Revalidate the field when user start typing in the password field
   if ($(this).val().length == 1) {
   $('#form_program_production').formValidation('validateField', 'program_production[variation_stock]')
   .formValidation('validateField', 'program_production[program_production]');
   }
   });
   /*  .on('success.field.fv', function (e, data) {
   if (data.fv.getInvalidFields().length > 0) {    // There is invalid field
   data.fv.disableSubmitButtons(true);
   }
   });*/
}