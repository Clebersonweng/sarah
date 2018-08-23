var COUNT_COMC    = 0; 
var TOTAL_COMC,SUBTOTAL_COMC    = 0;

$(document).ready(function() 
{

   controlador             = $("#controller").val();
   var FIELD_TOTAL_COMC    = $("#total").val();
   TOTAL_COMC              = parseInt(FIELD_TOTAL_COMC); // tomar valor en caso de edicion


   $('#cost_oper_cont_detail_unit_measure').on("change", function() 
   { 
      if($('#cost_oper_cont_detail_unit_measure option:selected').val() != 0)
      {
         $("#time_aprox").prop( "disabled", true );
         $("#time_aprox").val(0);
      }
      else
      {
         $("#time_aprox").prop( "disabled", false );
      }
   });
   
   $('#tb_co_mach_cont').on('check.bs.table', function (e, row) 
   {
      $('.remove').click(function () 
      {
         //var ids = getIdSelections($('#tb_suppy_detail'));
         $('#tb_co_mach_cont').bootstrapTable('remove', 
         {
            field: 'id',
            values: [row.id]
         });
         rest_cost_oper_mach_out(row.subtotal);
         $('.remove').prop('disabled', true);
      });
      
   }); 

   /*
   * aqui agrego todos los detalles de costo operativo de maquinaria tercerizada, determino
   * el tipo de servicio anterior en el formulario
   * y aqui solo agrego el tipo de servicio la cantidad de vezes realizada, la cual me calcula el total pago de servicios de terceros realizados
   */

   $("#btn_add_cost_out").on("click", function() 
   {
      if(is_valid_fields_mach_cont())
      {
         $type_of_service        = $("#cost_oper_cont_detail_type_of_service_id option:selected");
         $type_service_id        = $type_of_service.val();
         $type_service_name      = $type_of_service.text();
         $price                  = $type_of_service.data("price"); 
         $u_measure              = $("#cost_oper_cont_detail_unit_measure option:selected").text(); 
         $amount                 = $("#cost_oper_cont_detail_amount").val();
         $area                   = $("#farm_area").val();
         $time_aprox             = $("#time_aprox").val();
         
         row_bt_cost_out($type_service_id,$type_service_name,$price,$u_measure,$area,$amount,$time_aprox);
         $("#cost_oper_cont_detail_amount").val(1);
         COUNT_COMC++;
      }
      else
      {
         $('form').bootstrapValidator('revalidateField', 'cost_oper_cont_detail[type_of_service_id]');
         $('form').bootstrapValidator('revalidateField', 'cost_oper_cont_detail[amount]');
         $('form').bootstrapValidator('revalidateField', 'cost_oper_cont_detail[unit_measure]');
      }
   });

   md_popover('time_aprox','','Tiempo aproximado de trabajo de la maquinária que realizará el servicio');

});

// el subtotal es el tipo de servicio * UM(Ha) * cantidad
function row_bt_cost_out(type_service_id,type_service_name,price,u_measure,area,amount,time_aprox)
{ 
   var subtotal = calculate_subtotal(u_measure,price,area,amount,time_aprox);
   var  _data_ = {
                     "id": COUNT_COMC,
                     "code": COUNT_COMC,
                     "type_of_service": type_service_name,   
                     "type_of_service_id": "<input type='hidden' size='20' name='cost_oper_machine_cont[cost_oper_machine_cont_details_attributes]["+COUNT_COMC+"][type_of_service_id]' id='txt' value="+type_service_id+">",  
                     "price": price,  
                     "u_m": u_measure,  
                     "amount": amount,  
                     "amount_id": "<input type='hidden' size='20' name='cost_oper_machine_cont[cost_oper_machine_cont_details_attributes]["+COUNT_COMC+"][amount]' id='txt' value="+amount+">",  
                     "subtotal": subtotal.toFixed(0),
                     "subtotal_id": "<input type='hidden' size='20' name='cost_oper_machine_cont[cost_oper_machine_cont_details_attributes]["+COUNT_COMC+"][subtotal]' id='txt' value="+subtotal+">",  
                     "Action" : '<a class="remove  btn btn-danger delete btn-sm" title="Eliminar"><i class="fa fa-trash" aria-hidden="true"></i></a>'
                  };

   $('#tb_co_mach_cont').bootstrapTable("append", _data_);
   $('#cost_oper_cont_detail_type_of_service_id').val("");
   $("#cost_oper_cont_detail_amount").val("");
}


function calculate_subtotal(u_measure,price,area,quantity,time_aprox)
{

   if(u_measure == "HECTAREA") 
   {
      SUBTOTAL_COMC = (price * area) * quantity;
   }
   else if (u_measure == "HORAS")
   {
      SUBTOTAL_COMC = price * time_aprox; 
   }

   TOTAL_COMC                  += SUBTOTAL_COMC;
   $(".total").text(TOTAL_COMC);
   $("#total").val(TOTAL_COMC);

   return SUBTOTAL_COMC;

}

rest_cost_oper_mach_out = function(subtotal)
{

   TOTAL_COMC       -= subtotal;

   $(".total").text(TOTAL_COMC);
   $("#total").val(TOTAL_COMC);

}

function is_valid_fields_mach_cont()
{
   $type_of_service     = $('#cost_oper_cont_detail_type_of_service_id');
   $amount              = $("#cost_oper_cont_detail_amount");
   $measure             = $("#cost_oper_cont_detail_unit_measure");
   if($type_of_service.val() != "" && $amount.val() != "" && $measure.val() != "" )
   {
      return true;
   }
   else
   {
      return false;
   }
}




