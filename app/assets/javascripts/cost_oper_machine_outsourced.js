var count, sum, code_item = 0; 
var TOTAL = 0.0;
var subtotal =0;

$(document).ready(function() 
{
   

   $('#tb_co_mach_cont').bootstrapTable({
      formatNoMatches: function () {
        return "No cuenta con registros";
      },
      cache: false,
      remove: actionEvents
   });

   enabled_button_add_item("type_service_type_of_service_id","btn_add_cost_out");
   $('#btn_add_cost_out').click(function (e) {
    e.preventDefault();
      $('#tb_co_mach_cont').bootstrapTable("append", row_bt_cost_out());
      $('#cost_oper_machine_cont_details_type_of_service_id').val("");
      $("#cost_oper_machine_cont_details_amount").val("");
      
   });

   $('#cost_oper_machine_cont_details_type_of_service_id').on("change",function (e) 
   {
      if(typeof $("#quantity").val() != "")
      {
         enabled_button_add_item("type_service_type_of_service_id","btn_add_cost_out");   
      }
      
   });

   $('#tb_co_mach_cont').on('check.bs.table', function (e, row) 
   {
         TOTAL =  parseFloat($("#outsourced_total").text());
         $remove = $('.remove');
         selections = [];
         $remove.click(function () {
         //var ids = getIdSelections($('#tb_suppy_detail'));
         $('#tb_co_mach_cont').bootstrapTable('remove', {
               field: 'id',
               values: [row.id]
            });
            $remove.prop('disabled', true);
            TOTAL -= row.subtotal;
            $("#oper_own_total").text(TOTAL.toFixed(0));
         });
   });
    /**verifico si la u.m es bolsa, ha, hs y calculo de acuerdo a esto el subtotal*/
   $('#cost_oper_machine_cont_details_type_of_service_id').on("change", function() 
   { 
      if($('#cost_oper_machine_cont_details_type_of_service_id option:selected').data('u_measure') == "HORA")
      {
         $("#cost_oper_machine_cont_details_implement_id").attr("disabled",false); 
      }
      else
      {
         $("#cost_oper_machine_cont_details_implement_id").val(''); 
         $("#cost_oper_machine_cont_details_implement_id").attr("disabled",true); 
      }

   });
    /**Calcular el total multiplicado por el area de la parcela*/



    /*aqui agrego todos los detalles de costo operativo de maquinaria tercerizada, determino
     el tipo de servicio anterior en el formulario
    * y aqui solo agrego el tipo de servicio la cantidad de vezes realizada, la cual me calcula el total pago de servicios de terceros realizados
    */

   $("#agregarCostOperOuts").on("click", function() 
   {
      typeOfservice           = $("#cost_oper_machine_cont_details_type_of_service_id option:selected");//mostrar en el td  
      priceTypeOfService      = $("#cost_oper_machine_cont_details_type_of_service_id option:selected").data("price"); 
      UmedTypeOfService       = $("#cost_oper_machine_cont_details_type_of_service_id option:selected").data("u_measure"); 
      amount                  = $("#cost_oper_machine_cont_detail_amount").val();
      subtotal                = priceTypeOfService * amount;

      var newRow = addNewCost(typeOfservice.text(),UmedTypeOfService, priceTypeOfService, amount, subtotal.toFixed(2));

      count++;
      sum+=subtotal; 

      $("#TOTAL").text(sum.toFixed(2));  
      $("#InputTotal").val(sum.toFixed(2));  
   });

});
// el subtotal es el tipo de servicio * UM(Ha) * cantidad
function row_bt_cost_out()
{ 
   var type_service_id     =  $("#cost_oper_machine_cont_details_type_of_service_id option:selected").val();
   var type_service_name   =  $("#cost_oper_machine_cont_details_type_of_service_id option:selected").text();
   var price               =  $("#cost_oper_machine_cont_details_type_of_service_id option:selected").data("price");
   var quantity            =  $("#cost_oper_machine_cont_detail_amount").val();
   var u_measure           =  $("#cost_oper_machine_cont_details_type_of_service_id option:selected").data("u_measure");
   var area                =  $("#farm_area").val();

      

   var  _data_ = {
                     "id": ++code_item,
                     "code": "00"+code_item,
                     "type_of_service_id": type_service_name,   
                     "price": price,   
                     "quantity": quantity,  
                     "subtotal": calculte_subtotal(u_measure,price,area,quantity),
                     "Action" : '<a class="remove  btn btn-danger delete btn-sm" title="Eliminar"><i class="fa fa-trash" aria-hidden="true"></i></a>',
                  };
   add_new_row ( type_service_id, quantity, subtotal);//agrego cada fila
   return _data_ ;

}


function calculte_subtotal(u_measure,price,area,quantity)
{

   if(u_measure == "HECTAREA") 
   {
      subtotal = (price * area) * quantity;
   }
   else if (u_measure == "KILO")
   {
      subtotal = (price * $("#production").val()) * quantity;
   }
   else if (u_measure == "HORA")
   {

      var to               =  $("#cost_oper_machine_cont_details_implement_id option:selected").data("oper_time");
      subtotal             = ((area / to) * quantity).toFixed(0);
   }

   TOTAL                  += subtotal;
   $("#outsourced_total").text(total.toFixed(0));
   $("#cost_oper_cont_total").val(total.toFixed(0));
   return subtotal;

}

function add_new_row(type_service,amount, subtotal)
{
   $("#addRow").append(
     "<input type='text' size='20' name='cost_oper_machine_cont[cost_oper_machine_cont_details_attributes]["+count+"][type_of_service_id]' id='txt' value="+type_service+">"+
     "<input type='text' size='20' name='cost_oper_machine_cont[cost_oper_machine_cont_details_attributes]["+count+"][amount]' id='txt1' value="+amount+">"+
     "<input type='text' size='20' name='cost_oper_machine_cont[cost_oper_machine_cont_details_attributes]["+count+"][subtotal]' id='txt1' value="+subtotal+">"+"</br>"    
   )
   count++;
}
