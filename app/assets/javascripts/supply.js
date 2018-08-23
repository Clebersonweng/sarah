var  COUNT_SUPPLY        = 0;
var TOTAL_SUPPLY         = 0;
$(document).ready(function ()
{

   controlador          = $("#controller").val();

   var FIELD_TOTAL_S    = $("#total").val();
   TOTAL_SUPPLY         = parseInt(FIELD_TOTAL_S); // tomar valor en caso de edicion
   
   generic_response_form(controlador);
   $('#form_supplies').bootstrapValidator();

   $('#add_product').click(function () {
      

      if(is_valid_form_supply())
      {
         $product_           =  $("#supply_detail_product option:selected");
         $product_id         =  $product_.val();
         var product         =  $product_.text();
         var price           =  $product_.data("price");
         var measure          =  $product_.data("measure");
         var dosage          =  $product_.data("dosage");
         var area            =  $("#farm_area").val();

         row_table(product,$product_id,price,dosage,area,measure);
         COUNT_SUPPLY++; 
         $('#supply_detail_product').val("");
  
      }
      else
      {
         $('form').bootstrapValidator('revalidateField', 'supply_detail[product]');
      }
   });

   $('#tb_suppy_detail').on('check.bs.table', function (e, row) 
   {
      $('.remove').click(function () 
      {
         $('#tb_suppy_detail').bootstrapTable('remove', 
         {
           field: 'id',
           values: [row.id]
         });
         rest_total_supply(row.subtotal);
         $('.remove').prop('disabled', true);
      });
   }); 

});


function row_table(product,product_id,price,dosage,area,measure)
{ 
   var quantity_need   =  area * dosage
   subtotal            =  price * quantity_need;
   
   total_supply(subtotal);
   
   var  _data_ = {
      "id": COUNT_SUPPLY,
      "product": product,
      "product_id": "<input type='hidden' name='supply[supply_details_attributes]["+COUNT_SUPPLY+"][product_id]' value="+product_id+">",
      "quantity_needed": quantity_need.toFixed(2) ,          
      "quantity_needed_id": "<input type='hidden' name='supply[supply_details_attributes]["+COUNT_SUPPLY+"][quantity_needed]' value="+quantity_need+">",          
      "unit_measure": measure,
      "subtotal": subtotal.toFixed(0),
      "subtotal_id": "<input type='hidden' name='supply[supply_details_attributes]["+COUNT_SUPPLY+"][subtotal]' value="+subtotal+">",
      "Action" : '<a class="remove  btn btn-danger delete btn-sm" title="Eliminar"><i class="fa fa-trash" aria-hidden="true"></i></a>',
   };
   $('#tb_suppy_detail').bootstrapTable("append", _data_);
}

function rest_total_supply(subtotal)
{
   TOTAL_SUPPLY -= subtotal;
   $(".total").text(TOTAL_SUPPLY.toFixed(0)); 
   $("#total").val(TOTAL_SUPPLY.toFixed(0)); 
}

function total_supply(subtotal)
{
   TOTAL_SUPPLY += parseFloat(subtotal);
   $(".total").text(TOTAL_SUPPLY.toFixed(0)); 
   $("#total").val(TOTAL_SUPPLY.toFixed(0)); 
}

function is_valid_form_supply()
{
   $product_        =  $("#supply_detail_product option:selected");
   $product         =  $product_.val();

   if($product != "" )
   {
      return true;
   }
   else
   {
      return false;
   }
}


