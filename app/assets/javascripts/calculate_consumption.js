$(document)
.ready(
    function() {
      var count = 0; 
      var sum = 0;
      var price;
      var dosage;
      var area_plot;
      var consumption;
      var subtotal;
       $("#insumos_supply_id").change(function(){ 
          price = $("#insumos_supply_id option:selected").data('price-supply');
          dosage = $("#insumos_supply_id option:selected").data('dosage-supply');               
          $("#price").val(price);
          $("#dosage").val(dosage);
          area_plot = $("#area_plot").val();
          consumption = parseFloat(dosage) * parseFloat(area_plot);
          subtotal = parseFloat(price) * parseFloat(consumption);
;
          $("#coquito").val(consumption.toFixed(2)); 
      });



    var agregarProducto = function(idSup, nameSup, dosage,price,consumo,subtotal) {
        return "<tr>" + 
                    "<td>" + idSup + "</td>" + 
                    "<td>" + nameSup + "</td>" + 
                    "<td>" + dosage + "</td>" +
                    "<td>" + price + "</td>"+
                     "<td>" + consumo + "</td>"+
                     "<td class='subtotal'>" + subtotal.toFixed(2) + "</td>"+
                    "<td style='text-align: center'>"+ 
                    "<a href='#'" + "id='quitar'>" + 
                    "<i class='icon-minus'></i>" +  "</a>"+
                    "</td>"+ 
                 "</tr>";
            
            
        };

function addFormField(idSup, totalUnit,subtotal) {
					
 $("#test").append(
"<input type='text' size='20' name='cons_raw_material[cons_raw_material_details_attributes]["+count+"][supply_id]' id='txt' value="+idSup+">"+
"<input type='text' size='20' name='cons_raw_material[cons_raw_material_details_attributes]["+count+"][total_unit]' id='txt1' value="+totalUnit+">"+
"<input type='text' size='20' name='cons_raw_material[cons_raw_material_details_attributes]["+count+"][subtotal]' id='txt2' value="+subtotal+'>');

}



$("#agregarProducto").on("click",function(event) {
         event.preventDefault();
          var producto = $("#insumos_supply_id option:selected");
          var dosage = $("#dosage");
          var price = $("#price");
          var consumo = $("#coquito");
          
            var html = agregarProducto(producto.val(), producto.text(),dosage.val(),price.val(),consumo.val(),subtotal);
                // carga los trs en la tabla
                $("#detalhes-container tbody:first").append(html);
                addFormField(producto.val(),consumo.val(),subtotal.toFixed(2));
                // resetea los campos despues de  cada add
               

            //incrementa al agregar cada fila
            count++;
            sum+=subtotal;  
           $("#coquito2").val(sum.toFixed(2));         
});
    
        








$("#quitar").on("click", function(event) {
    event.preventDefault();
     $(this).parent().parent().remove();
     alert("levante");
});
/**
   

                    // cierre de metodo
**/
});