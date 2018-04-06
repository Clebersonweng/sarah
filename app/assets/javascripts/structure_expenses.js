var  COUNT  = 0;
var  TOTAL  = 0;

$(document).ready(function () {
 
   controlador = $("#controller").val();
   generic_response_form(controlador);

   form_manu_indirect_expense_validates();
   $("#tb_manu_indi_expense").bootstrapTable();

      $("#btn_add_structure").on("click",function() 
      {
         var descr_expense         = $("#struc_expense_descr_expense").val();
         var amount                = $("#struc_expense_subtotal").val();

         if(typeof descr_expense != "undefined" || descr_expense != ""  && typeof amount != "undefined" || amount != "")
         {
            row_bt_structure_expense(descr_expense,amount);
            COUNT++;   
         }
      });

      $('#tb_structure_expense').on('check.bs.table', function (e, row) 
      {
         TOTAL_FIXE_AND_VARIABLE =  parseFloat($(".manu_indi_expe_total_fixed_and_variable").text());
         
         $fixe_to_delete = row.total_fixed; // tomo el elemento
         $value_fixe = $($fixe_to_delete).attr("value"); // agarro el valor para restar del total

         $variable_to_delete = row.total_variable;
         $value_variable = $($variable_to_delete).attr("value");
         
         //verify_type_expense(type_expense_id,amount,"new");

            $remove = $('.remove');
            selections = [];
         $remove.click(function () {
            //var ids = getIdSelections($('#tb_suppy_detail'));
            $('#tb_manu_indi_expense').bootstrapTable('remove', 
            {
               field: 'id',
               values: [row.id]
            });
            $remove.prop('disabled', true);
            if(row.type_expense == "FIJO")
            {
               TOTAL_FIXED -= $value_fixe;   
            }
            else
            {
               TOTAL_VARIABLE -= $value_variable;
            }
            

            TOTAL_FIXE_AND_VARIABLE = TOTAL_FIXED + TOTAL_VARIABLE;
            $(".manu_indi_expe_total_fixed").text(TOTAL_FIXED.toFixed(0));
            $(".manu_indi_expe_total_variable").text(TOTAL_VARIABLE.toFixed(0));
            $(".manu_indi_expe_total_fixed_and_variable").text(TOTAL_FIXE_AND_VARIABLE.toFixed(0));
         });
      }); 

});

function row_bt_structure_expense(descr_expense,amount)
{
   TOTAL += parseFloat(amount);

   $(".structure_expense_total").text(TOTAL);
   $("#structure_expense_total").val(TOTAL);

   var  _data_ =  {
                      "id"                       : COUNT,
                      "code"                     : COUNT,
                      "descr_expense"            : descr_expense,   
                      "descr_expense_id"         : "<input type='hidden' size='100' name='structure_expense[stru_expense_dets_attributes]["+COUNT+"][name]' value='"+descr_expense+"' >",   
                      "amount"                   : "<input type='hidden' size='20' name='structure_expense[stru_expense_dets_attributes]["+COUNT+"][amount]' value='1' >",  
                      "subtotal"                 : amount,   
                      "subtotal_id"              : "<input type='hidden' size='20' name='structure_expense[stru_expense_dets_attributes]["+COUNT+"][subtotal]' value="+amount+">",   
                      "Action"                   : '<a class="remove  btn btn-danger delete btn-sm" title="Eliminar"><i class="fa fa-trash" aria-hidden="true"></i></a>',
                  };



   $('#tb_structure_expense').bootstrapTable("append", _data_);  
   $("#struc_expense_descr_expense").val("");
   $("#struc_expense_subtotal").val("");
}

function form_manu_indirect_expense_validates()
{

  $('#form_structure_expenses').bootstrapValidator({
    excluded: [':disabled', ':hidden', ':not(:visible)'],
    fields: 
    {
      'structure_expense[program_production_id]': 
      {
        validators: {
          notEmpty: {
            message: 'Este campo es obligatório'
          }
        }
      },
      'structure_expense[total]': 
      {
        validators: {
          notEmpty: {
            message: 'Este campo es obligatório'
          }
        }
      },
      'struc_expense[descr_expense]': 
      {
        validators: {
          stringLength: {
            min: 1,
            message: 'Este campo es obligatorio'
          }
        }
      },
      'struc_expense[subtotal]': 
      {
        validators: {
          stringLength: {
            min: 1,
            message: 'Este campo es obligatorio'
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



















