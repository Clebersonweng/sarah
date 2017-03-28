$(document).ready(function() {
    var count = 0;
    var sum = 0;
    var typeOfservice;
    var amount;
    var priceTypeOfService;
    var UmedTypeOfService;
    var addNewCost = function(type_service, Um, price, amount, subtotal) {
        return "<tr>" + 
                    "<td>" + type_service + "</td>" +
                    "<td>" + Um + "</td>" +
                    "<td>" + price + "</td>" +
                     "<td>" + amount + "</td>" +  
                    "<td class='subtotal'>" + subtotal + "</td>" + "<td style='text-align: center'>" + "<a href='#'" + "id='quitar'>" + "<i class='icon-minus'></i>" + "</a>" + "</td>" +
                "</tr>";
    };

     function addNuevasFilas(type_service,amount, subtotal) {
   $("#addFilas").append(
        "<input type='text' size='20' name='cost_oper_machine_cont[cost_oper_machine_cont_details_attributes]["+count+"][type_of_service_id]' id='txt' value="+type_service+">"+
        "<input type='text' size='20' name='cost_oper_machine_cont[cost_oper_machine_cont_details_attributes]["+count+"][amount]' id='txt1' value="+amount+">"+
        "<input type='text' size='20' name='cost_oper_machine_cont[cost_oper_machine_cont_details_attributes]["+count+"][subtotal]' id='txt1' value="+subtotal+">"    
        );
    }

    var addTotal = function(total){
        return "<tr>" + 
                    
                     "<td>"  + "</td>" + 
                     "<td>"  + "</td>" +
                     "<td>"  + "</td>" +
                     "<td>"  + "</td>" +
                     "<td>"  + "</td>" + 
                    "<td class='total'>" + total + "</td>" + "<td style='text-align: center'>" + "<a href='#'" + "id='quitar'>" + "<i class='icon-minus'></i>" + "</a>" + "</td>" + 
                "</tr>";
    }
  
   

/*aqui agrego todos los detalles de costo operativo de maquinaria tercerizada, determino el tipo de servicio anterior en el formulario
* y aqui solo agrego el tipo de servicio la cantidad de vezes realizada, la cual me calcula el total pago de servicios de terceros realizados
*/

$("#agregarCostOper").on("click", function(event) {
    event.preventDefault();

    typeOfservice = $("#type_service_type_of_service_id option:selected");//mostrar en el td  
    priceTypeOfService = $("#type_service_type_of_service_id option:selected").data("price"); 
    UmedTypeOfService = $("#type_service_type_of_service_id option:selected").data("u_measure"); 
    amount = $("#amount").val();

    subtotal = priceTypeOfService * amount;

    var newRow = addNewCost(typeOfservice.text(),UmedTypeOfService, priceTypeOfService, amount, subtotal.toFixed(2));
 // carga los trs en la tabla

    $("#detalhes-container tbody:first").append(newRow);
    addNuevasFilas ( typeOfservice.val(), amount, subtotal.toFixed(2));//agrego cada fila
    // resetea los campos despues de  cada add


    //incrementa al agregar cada fila
     count++;
     sum+=subtotal; 
    
   $("#TOTAL").text(sum.toFixed(2));  
   $("#InputTotal").val(sum.toFixed(2));  
   

    
});


$("#quitar").on("click", function(event) {
    event.preventDefault();
    $(this).parent().parent().remove();
});
/**
                  // cierre de metodo
**/
});
