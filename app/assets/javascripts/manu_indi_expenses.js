$(document).ready(function () {
 
   controlador = $("#controller").val();
   generic_response_form(controlador);
   form_manu_indirect_expense_validates();

});

function form_manu_indirect_expense_validates()
{
   $('#form_manu_indi_expenses').bootstrapValidator({
         framework: 'bootstrap',
         icon: {
         valid: 'glyphicon glyphicon-ok',
         invalid: 'glyphicon glyphicon-remove',
         validating: 'glyphicon glyphicon-refresh'
      },
      fields: 
      {
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
         'machine[hp]': {
           validators: {
                           notEmpty: 
                           {
                              message: 'Este campo es obligatório'
                           },
                           stringLength:
                           {
                              min: 1,
                              max: 5,
                              message: 'El campo debe contener entre 1 y 4 valores'
                           },
                           numeric: 
                           {
                              message: 'No es un valor numérico válido',
                              thousandsSeparator: '.',
                              decimalSeparator: ','
                           }
                        }
         }
      }

  })
  .on('status.field.bv', function (e, data) {
    if (data.bv.getSubmitButton()) {
      data.bv.disableSubmitButtons(false);
    }
  });
}
