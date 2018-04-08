var COUNT, SUM    = 0; 
var TOTAL         = 0;
var subtotal      = 0;

$(document).ready(function() 
{
   var valor_edit = $("#total_edit").val();

   if(valor_edit !== "")
   {
      TOTAL += parseFloat(valor_edit);
   }

   $('#cost_oper_cont_detail_implement_id').on("change",function (e) 
   {
      if(typeof $("#cost_oper_cont_detail_implement_id").val() != "")
      {
         enabled_button_add_item("cost_oper_cont_detail_amount","btn_add_cost_out");   
      }
      
   });

   $('#tb_co_mach_cont').on('check.bs.table', function (e, row) 
   {
      TOTAL =  parseFloat($("#outsourced_total").text());
      $remove = $('.remove');
      selections = [];
      $remove.click(function () {
      //var ids = getIdSelections($('#tb_suppy_detail'));
      $('#tb_co_mach_cont').bootstrapTable('remove', 
      {
         field: 'id',
         values: [row.id]
      });
      $remove.prop('disabled', true);
      TOTAL -= row.subtotal;
      $("#oper_own_total").text(TOTAL.toFixed(0));
      
      });
   });

    /**verifico si la u.m es bolsa, ha, hs y calculo de acuerdo a esto el subtotal*/
   $('#cost_oper_cont_detail_type_of_service_id').on("change", function() 
   { 
      if($('#cost_oper_cont_detail_type_of_service_id option:selected').data('u_measure') == "HORA")
      {
         $("#cost_oper_cont_detail_implement_id").attr("disabled",false); 
      }
      else
      {
         $("#cost_oper_cont_detail_implement_id").val(''); 
         $("#cost_oper_cont_detail_implement_id").attr("disabled",true); 
      }

   });
    /**Calcular el total multiplicado por el area de la parcela*/



    /*aqui agrego todos los detalles de costo operativo de maquinaria tercerizada, determino
     el tipo de servicio anterior en el formulario
    * y aqui solo agrego el tipo de servicio la cantidad de vezes realizada, la cual me calcula el total pago de servicios de terceros realizados
    */

   $("#btn_add_cost_out").on("click", function() 
   {
      if(is_valid_fields())
      {
         $type_of_service        = $("#cost_oper_cont_detail_type_of_service_id option:selected");
         $type_service_id        = $type_of_service.val();
         $type_service_name      = $type_of_service.text();
         $price                  = $type_of_service.data("price"); 
         $u_measure              = $type_of_service.data("u_measure"); 
         $amount                 = $("#cost_oper_cont_detail_amount").val();
         $area                   = $("#farm_area").val();
         
         row_bt_cost_out($type_service_id,$type_service_name,$price,$u_measure,$area,$amount);
         $("#cost_oper_cont_detail_amount").val(1);
         COUNT++;
      }
      else
      {
         $('form').bootstrapValidator('revalidateField', 'cost_oper_cont_detail[type_of_service_id]');
         $('form').bootstrapValidator('revalidateField', 'cost_oper_cont_detail[amount]');
      }
   });

});

// el subtotal es el tipo de servicio * UM(Ha) * cantidad
function row_bt_cost_out(type_service_id,type_service_name,price,u_measure,area,amount)
{ 
   
   var subtotal = calculte_subtotal(u_measure,price,area,amount);
   var  _data_ = {
                     "id": COUNT,
                     "code": COUNT,
                     "type_of_service": type_service_name,   
                     "type_of_service_id": "<input type='hidden' size='20' name='cost_oper_machine_cont[cost_oper_machine_cont_details_attributes]["+COUNT+"][type_of_service_id]' id='txt' value="+type_service_id+">",  
                     "price": price,  
                     "amount": amount,  
                     "amount_id": "<input type='hidden' size='20' name='cost_oper_machine_cont[cost_oper_machine_cont_details_attributes]["+COUNT+"][amount]' id='txt' value="+amount+">",  
                     "subtotal": subtotal,
                     "subtotal_id": "<input type='hidden' size='20' name='cost_oper_machine_cont[cost_oper_machine_cont_details_attributes]["+COUNT+"][subtotal]' id='txt' value="+subtotal+">",  
                     "Action" : '<a class="remove  btn btn-danger delete btn-sm" title="Eliminar"><i class="fa fa-trash" aria-hidden="true"></i></a>'
                  };

   $('#tb_co_mach_cont').bootstrapTable("append", _data_);
   $('#cost_oper_cont_detail_type_of_service_id').val("");
   $("#cost_oper_cont_detail_amount").val("");
}


function calculte_subtotal(u_measure,price,area,quantity)
{

   if(u_measure == "HECTAREA") 
   {
      subtotal = (price * area) * quantity;
   }
   else if (u_measure == "KILO")
   {
      subtotal = (price * $("#program_production_id").val()) * quantity;
   }
   else if (u_measure == "HORA")
   {
      var to               =  $("#cost_oper_cont_detail_detail_implement_id option:selected").data("oper_time");
      subtotal             = ((area / to) * quantity).toFixed(0);
   }

   TOTAL                  += subtotal;
   $(".outsourced_total").text(TOTAL);
   $("#total_edit").val(TOTAL);
   return subtotal;

}

function is_valid_fields()
{
   $type_of_service     = $('#cost_oper_cont_detail_type_of_service_id');
   $amount              = $("#cost_oper_cont_detail_amount");

   if(typeof $type_of_service != "undefined" && $type_of_service.val() != "" && typeof $amount != "undefined" && $amount.val() != "" )
   {
      return true;
   }
   else
   {
      return false;
   }

}




