$(document).ready(function () {
  
  
  controlador = $("#controller").val();
   generic_response_form(controlador); 

    
  $("#program_production_stock_initial,#program_production_stock_end").off("change").on("change", function () {
    calculate_variation_stock();
    calculate_program_production();
  });
  
  form_validate_program_production();
  
});

function calculate_variation_stock()
{
  /**tomo el area de la parcela para multiplicar por la estimacion de produccion segun el precio  determinando el ingreso bruto de las ventas**/
  var variation_stock = 0;
  variation_stock = ((parseInt($("#program_production_stock_end").val()) - (parseInt($("#program_production_stock_initial").val()))));
  if (variation_stock >= 0 || typeof variation_stock !== "undefined" && !isNaN(variation_stock))
  {
    $("#program_production_variation_stock").val(variation_stock);
    $('form').bootstrapValidator('revalidateField', 'program_production[variation_stock]');
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
    $('form').bootstrapValidator('revalidateField', 'program_production[program_production]');
  }
  else
  {
    $("#program_production_program_production").val(0);
  }
}

function form_validate_program_production()
{
  $('#form_program_productions').bootstrapValidator({
    framework: 'bootstrap',
    excluded: [':disabled', ':hidden', ':not(:visible)'],
    icon: {
              valid: 'fa fa-check',
              invalid: 'fa fa-times',
              validating: 'fa fa-refresh'
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
      'program_production[variation_stock]': {
        validators: {
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

