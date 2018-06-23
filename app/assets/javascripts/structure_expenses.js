var  COUNT_SE  		= 0;
var TOTAL_SE         = 0;
$(document).ready(function () {
 
   controlador 			= $("#controller").val();
   var FIELD_TOTAL 		= $("#structure_expense_total").val();
   TOTAL_SE					= parseInt(FIELD_TOTAL);
   generic_response_form(controlador);

	//form_manu_indirect_expense_validates();
   $("#btn_add_structure").on("click",function() 
   {
      var descr_expense         = $("#struc_expense_descr_expense").val();
      var subtotal                = $("#struc_expense_subtotal").val();
      if(is_valid_fields_se())
      {
         row_bt_structure_expense(descr_expense,subtotal);
         COUNT_SE++;   
      }
      else
      {
         $('form').bootstrapValidator('revalidateField', 'struc_expense[descr_expense]');
         $('form').bootstrapValidator('revalidateField', 'struc_expense[subtotal]');
      }
   });

   $('#tb_structure_expense').on('check.bs.table', function (e, row) 
   {
      $('.remove').click(function () 
      {
         $('#tb_structure_expense').bootstrapTable('remove', 
         {
           field: 'id',
           values: [row.id]
         });
         rest_type_expense_se(row.subtotal);
         $('.remove').prop('disabled', true);
      });
   }); 

});

function row_bt_structure_expense(descr_expense,subtotal)
{
   TOTAL_SE += parseInt(subtotal);
   $(".structure_expense_total").html(TOTAL_SE);
   $("#structure_expense_total").val(TOTAL_SE);

   var  _data_ =  {
							"id"                       : COUNT_SE,
							"code"                     : COUNT_SE,
							"descr_expense"            : descr_expense,   
							"descr_expense_id"         : "<input type='hidden' size='100' name='structure_expense[stru_expense_dets_attributes]["+COUNT_SE+"][name]' value='"+descr_expense+"' >",   
							"amount"                   : "<input type='hidden' size='20' name='structure_expense[stru_expense_dets_attributes]["+COUNT_SE+"][amount]' value='1' >",  
							"subtotal"                 : subtotal,   
							"subtotal_id"              : "<input type='hidden' size='20' name='structure_expense[stru_expense_dets_attributes]["+COUNT_SE+"][subtotal]' value="+subtotal+">",   
							"Action"                   : '<a class="remove  btn btn-danger delete btn-sm" title="Eliminar"><i class="fa fa-trash" aria-hidden="true"></i></a>',
                  };

   $('#tb_structure_expense').bootstrapTable("append", _data_);  
   $("#struc_expense_descr_expense").val("");
   $("#struc_expense_subtotal").val("");
}

function rest_type_expense_se(subtotal)
{
   TOTAL_SE -= subtotal;
   $(".structure_expense_total").text(TOTAL_SE); 
   $("#structure_expense_total").val(TOTAL_SE); 
}

/*
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
*/
function is_valid_fields_se()
{
   $description            = $("#struc_expense_descr_expense");
   $amount                 = $("#struc_expense_subtotal");

   if(typeof $description != "undefined" && $description.val() != "" && typeof $amount != "undefined" && $amount.val() != "" )
   {
      return true;
   }
   else
   {
      return false;
   }
}
