
$(document).ready(function ()
{

  controlador = $("#controller").val();
  generic_response_form(controlador);
  form_machines_validates();
  
  md_popover("machine_consumption","Coef consumo lt/hs","Aprox. 0,16% * hp ");
  md_popover("machine_time_oper","","Si maquinária es pulverizador</br> autopropulsado");
  
  $('#md_consumption').on("show.bs.modal",function(){
    $("#hp_cons_machine").val($("#machine_hp").val());
  });

  $('#md_consumption').on("hidden.bs.modal",function(){
    calc_cons_fuel_per_hours();
  });

});

function form_machines_validates()
{
  $('#form_machines').bootstrapValidator({
    framework: 'bootstrap',
    icon: {
      valid: 'glyphicon glyphicon-ok',
      invalid: 'glyphicon glyphicon-remove',
      validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
      'machine[name]': {
        validators: {
          notEmpty: {
            message: 'Este campo es obligatório'
          }
        }
      },
      'machine[brand_id]': {
        validators: {
          notEmpty: {
            message: 'Este campo es obligatório'
          }
        }
      },
      'machine[model_id]': {
        validators: {
          notEmpty: {
            message: 'Este campo es obligatório'
          },
          verify_period: {
            message: 'hay que verificar'
          }
        }
      },
      'machine[hp]': {
        validators: {
          notEmpty: {
            message: 'Este campo es obligatório'
          },
          stringLength: {
            min: 1,
            max: 5,
            message: 'El campo debe contener entre 1 y 4 valores'
          },
          numeric: {
                        message: 'No es un valor numérico válido',
                        thousandsSeparator: '.',
                        decimalSeparator: ','
                    }
        }
      },
      'machine[price]': {
        validators: {
          notEmpty: {
            message: 'Este campo es obligatorio'
          },
          stringLength: {
            min: 5,
            max: 15,
            message: 'El campo debe contener entre 1 y 15 numeros'
          },
          regexp: {
            regexp: /^[0-9.]+$/,
            message: 'Debe contener solamente numeros'
          }
        }
      },
      'machine[coeficient_cccr]': {
        validators: {
          notEmpty: {
            message: 'Este campo es obligatório'
          },
          stringLength: {
            min: 1,
            max: 9,
            message: 'El campo debe contener entre 1 y 15 numeros'
          },
          regexp: {
            regexp: /^[0-9.]+$/,
            message: 'Debe contener números decimales'
          }
        }
      },
      'machine[consumption]': {
        validators: {
          notEmpty: {
            message: 'Este campo es obligatório'
          },
          stringLength: {
            min: 1,
            max: 9,
            message: 'El campo debe contener entre 1 y 10 numeros'
          },
          regexp: {
            regexp: /^[0-9.]+$/,
            message: 'Debe contener solamente numeros'
          }
        }
      },
      'machine[time_oper]': {
        validators: {
          stringLength: {
            min: 1,
            max: 9,
            message: 'El campo debe contener el tiempo operativo con maximo 10 numeros'
          },
          regexp: {
            regexp: /^[0-9.]+$/,
            message: 'Debe contener solamente numero y punto decimal'
          }
        }
      },
      'machine[year_purchase]': {
        validators: {
          notEmpty: {
            message: 'Este campo es obligatório'
          },
          stringLength: {
            min: 4,
            max: 4,
            message: 'El campo debe contener el año de la maquinária'
          },
          regexp: {
            regexp: /^[0-9.]+$/,
            message: 'Debe contener solamente numeros'
          }
        }
      },
      'machine[fuel_id]': {
        validators: {
          notEmpty: {
            message: 'Este campo es obligatório'
          },
          stringLength: {
            min: 1,
            max: 9,
            message: 'El campo debe contener entre 1 y 10 numeros'
          },
          regexp: {
            regexp: /^[0-9.]+$/,
            message: 'Debe contener solamente numeros'
          }
        }
      },
    }

  })
  .on('status.field.bv', function (e, data) {
    if (data.bv.getSubmitButton()) {
      data.bv.disableSubmitButtons(false);
    }
  });
}

function calc_cons_fuel_per_hours()
{
 
  if(typeof $("#machine_hp").val() != "undefined" && $("#machine_hp").val() != "" || typeof $("#coef_cons_mach").val() != "undefined"  && $("#coef_cons_mach").val() != "")
  {
    
    var result  = $("#machine_hp").val() * $("#coef_cons_cccr").val();
    $("#machine_consumption").val(result); 
    $('form').bootstrapValidator('revalidateField', 'machine[consumption]');  }
  
}
/*
*/
