$(document).ready(function ()
{
   controlador = $("#controller").val();   
   generic_response_form(controlador);
   form_history_sales_validates();
   $('.datepicker')
      .datepicker({
         format: 'dd/mm/yyyy'
      })
      .on('changeDate', function(e) {
         $('form').bootstrapValidator('revalidateField', 'history_sale[date]');  
      });
});


function form_history_sales_validates()
{
   $('#form_history_sales').bootstrapValidator({
      excluded: [':disabled', ':hidden', ':not(:visible)'],
      fields: 
      {
            "history_sale[period]": {
            validators: {
              notEmpty: {
               message: 'Este campo es obligatório'
               },
               regexp: {
                  regexp: /^[0-9.]+$/,
                  message: 'No es un año válido.'
               }
            }
         },
         "history_sale[date]": {
             validators: {
                  notEmpty: {
                     message: 'Este campo es obligatório'
                  },
                  date: {
                     format: 'DD/MM/YYYY',
                     message: 'La fecha no es valida',
                     min: '01/01/2010',
                     max: '20/12/2050'
                  }
               }
         },
         "history_sale[quantity]": {
            validators: {
                  notEmpty: {
                     message: 'Este campo es obligatório'
                  },
                  regexp: {
                     regexp: /^[0-9.]+$/,
                     message: 'Sólo es permitido números'
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
