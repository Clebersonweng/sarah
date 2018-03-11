var  COUNT  = 0;
var  TOTAL  = 0;

$(document).ready(function () {
 
   controlador = $("#controller").val();
   validate_generic_form(controlador);
   form_manu_indirect_expense_validates();
   $("#tb_manu_indi_expense").bootstrapTable();

   $("#btn_add_manu_indi_expense").on("click",function() 
   {
      var descr_expense         = $("#manu_indi_descr_expense").val();
      var type_expense          = $("#manu_indi_type_expense option:selected").text();
      var type_expense_id       = $("#manu_indi_type_expense option:selected").val();
      var amount                = $("#manu_indi_subtotal").val();
      row_bt_manu_indi_expense(descr_expense,type_expense,type_expense_id,amount);
   });

});

function row_bt_manu_indi_expense(descr_expense,type_expense,type_expense_id,amount)
{
   
   TOTAL += parseFloat(amount);
   $("#manu_indi_expe_total").text(TOTAL);
   var  _data_ =  {
                     "id"           : ++COUNT,
                     "code"            : ++COUNT,
                     "descr_expense"   : descr_expense,   
                     "descr_expense_id": "<input type='text' size='20' name='manu_indi_expense[manu_indi_expense_dets_attributes]["+count+"][name]' value="+descr_expense+">",   
                     "type_expense"    : type_expense,   
                     "type_expense_id" : "<input type='text' size='20' name='manu_indi_expense[manu_indi_expense_dets_attributes]["+count+"][isFixed]' value="+type_expense_id+">",  
                     "subtotal"        : amount,   
                     "subtotal_id"     : "<input type='text' size='20' name='manu_indi_expense[manu_indi_expense_dets_attributes]["+count+"][subtotal]' value="+amount+">",   
                     "Action"          : '<a class="remove  btn btn-danger delete btn-sm" title="Eliminar"><i class="fa fa-trash" aria-hidden="true"></i></a>',
                  };

   $('#tb_manu_indi_expense').bootstrapTable("append", _data_);  
   $("#manu_indi_expense_det_descr_expense").val("");
   $("#manu_indi_expense_det_type_expense").val("1");
   $("#manu_indi_expense_det_subtotal").val("");
}

function add_row(descr_expense,type_expense_id,subtotal)
{
   var row =   "<tr id=''>"+
                  "<td><input type='text' name='' value='"+descr_expense+"'/><td>"+
                  "<td><input type='text' name='' value='"+type_expense_id+"'/><td>"+
                  "<td><input type='text' name='' value='"+amount+"'/><td>"+
                  
               "</tr>"  ;
}

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
