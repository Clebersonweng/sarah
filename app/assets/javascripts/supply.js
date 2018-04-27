var COUNT = 0;
var TOTAL_S = 0.0;
var subtotal ;
$(document).ready(function ()
{

   controlador          = $("#controller").val();
   var FIELD_TOTAL_S    = $("#total").val();
   TOTAL_S              = parseInt(FIELD_TOTAL_S); // tomar valor en caso de edicion
   generic_response_form(controlador);
   $('#form_supplies').bootstrapValidator();

   $('#add_product').click(function () {
      

      if(is_valid_fields())
      {
         $product_           =  $("#supply_detail_product option:selected");
         $product_id         =  $product_.val();
         var product         =  $product_.text();
         var price           =  $product_.data("price");
         var measure          =  $product_.data("measure");
         var dosage          =  $product_.data("dosage");
         var area            =  $("#farm_area").val();

         row_table(product,$product_id,price,dosage,area,measure);
         COUNT++; 
         $('#supply_detail_product').val("");
  
      }
      else
      {
         $('form').bootstrapValidator('revalidateField', 'supply_detail[product]');
      }
   });

   if(typeof controlador != "undefined" && controlador == "supplies")
   {
      call_view_data_farm_plot("calculate_subtotal",""); 
   }

   $('#tb_suppy_detail').on('check.bs.table', function (e, row) 
   {
      $remove = $('.remove');
      selections = [];
      $remove.click(function () {
         //var ids = getIdSelections($('#tb_suppy_detail'));
         $('#tb_suppy_detail').bootstrapTable('remove', {
            field: 'id',
            values: [row.id]
         });
         
         $remove.prop('disabled', true);
         var n_total = row.subtotal
         total = parseInt(total) - eval(n_total);
         $("#supplies_total").text(parseInt(total));
         $("#supply_total").val(parseInt(total));
      });
   });
});

function getIdSelections(table) 
{
   return $.map(table.bootstrapTable('getSelections'), function (row) {
      console.log(row.id);
      return row.id
   });
}



function row_table(product,product_id,price,dosage,area,measure)
{ 
   var quantity_need   =  area * dosage
   subtotal            =  price * quantity_need;
   
   TOTAL_S            += parseInt(subtotal);
   
   $(".total").html(TOTAL_S); // suma fijo y variable
   $("#total").val(TOTAL_S); // suma fijo y variable

   var  _data_ = {
      "id": COUNT,
      "product": product,
      "product_id": "<input type='hidden' name='supply[supply_details_attributes]["+COUNT+"][product_id]' value="+product_id+">",
      "quantity_needed": quantity_need.toFixed(2) ,          
      "quantity_needed_id": "<input type='hidden' name='supply[supply_details_attributes]["+COUNT+"][quantity_needed]' value="+quantity_need+">",          
      "unit_measure": measure,
      "subtotal": subtotal.toFixed(2),
      "subtotal_id": "<input type='hidden' name='supply[supply_details_attributes]["+COUNT+"][subtotal]' value="+subtotal+">",
      "Action" : '<a class="remove  btn btn-danger delete btn-sm" title="Eliminar"><i class="fa fa-trash" aria-hidden="true"></i></a>',
   };
   console.log(COUNT);
   $('#tb_suppy_detail').bootstrapTable("append", _data_);


}

function delete_row_table(obj)
{
   total = 0.0;

  // $(obj).parent().parent().remove().fadeOut();
  $("#tb_suppy_detail tbody tr").each(function(indice,valor) {
      var subtotal = parseFloat($(obj).find("td:eq(6)").html());
      if (!isNaN(subtotal))
      {
         total           += subtotal;
      }
   });
  $("#supplies_total").text(total);
  $("#supply_total").val(total);
}


function call_view_data_farm_plot(path,data)
{   
   $.ajax({
      type: "POST",
      dataType: 'JSON',
      data: data,
      url: "/" + controlador + "/"+path,
      success: function (response) {
         $("#farm_name").val(response["0"].farm_name) ;
         $("#farm_area").val(response["0"].farm_area) ;
         $("#farm_prog_total_production").val(response["0"].prog_total_production);  
      },
      error: function (response) 
      {
         alert_sarah("Ocurrió un error al calcular el subtotal de insumos para este producto", "danger");    
      },
      fail: function (response)
      {
         alert_sarah(response.msg, "danger");
      }
   });          
}
/*
function addNewRow(product_id,quantity, subtotal) 
{
 count++;
 $("#addRow").append(
    "<input type='hidden' size='20' name='supply[supply_details_attributes]["+count+"][product_id]' id='txt_"+count+"' value="+product_id+">"+
    "<input type='hidden' size='20' name='supply[supply_details_attributes]["+count+"][quantity_needed]' id='txt_"+count+"' value="+quantity+">"+
    "<input type='hidden' size='20' name='supply[supply_details_attributes]["+count+"][subtotal]' id='txt_"+count+"' value="+subtotal+">"    
    );
}
*/
function is_valid_fields()
{
   $product_        =  $("#supply_detail_product option:selected");
   $product         =  $product_.val();
      

   if(typeof $product != "undefined" && $product != "" )
   {
      return true;
   }
   else
   {
      return false;
   }
}


