$(document)
.ready(
    function() {
      var count = 0; 
      var sum = 0;
      var machine;
      var fuel;
      var fuelPrice;
      var lubricant;
      var repair;
      var timeOperative;
      var coefConsumption;
      var amount;
      var implement;
      var subtotal;
      



// RYM - reparacion y mantenimiento
    var agregarProducto = function(nameMachine,amount,nameFuel,nameImplement,lubricant,timeOper,RYM,subtotal) {
        return "<tr>" + 
                   
                    "<td>" + nameMachine + "</td>" + 
                    "<td>" + amount + "</td>" +                   
                     "<td>" + nameFuel + "</td>"+                     
                     "<td>" + nameImplement  + "</td>"+
                     "<td>" + lubricant  + "</td>"+
                     "<td>" + RYM  + "</td>"+
                     "<td>" + timeOper  + "</td>"+
                     "<td class='subtotal'>"+ subtotal +"</td>"+
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



$("#agregarCostOper").on("click",function(event) {
         event.preventDefault();
          var areaPlot = $("#cost_oper_machine_farming_plot_id option:selected").data("area");
          var machine = $("#machine_machine_id option:selected");
          var coefConsum = $("#machine_machine_id option:selected").data("consumption");
          var fuel = $("#fuel_fuel_id option:selected");
          var priceFuel = $("#fuel_fuel_id option:selected").data("price");
          var hp = $("#machine_machine_id option:selected").data("hp");
       
          var implement = $("#implement_implement_id option:selected");
            
          var amount = $("#amount");
          
          //calculo el valor de combustible en $ gasto por hora para esta labor con este implemento
          var costFuelPorHours = priceFuel * hp * coefConsum;
          //calculo de gasto de lubricantes
          var lubricant = (costFuelPorHours * 12)/100

          /**calculo de gastos con reparacion y mantenimiento,
             se realiza tomando del valor a nuevo de la maquina y multiplicando por el coeficiente*/
          var coefCccrMachine = $("#machine_machine_id option:selected").data("coef_cccr");
          var timeOperMachine = $("#machine_machine_id option:selected").data("time_oper");
          var priceMachine = $("#machine_machine_id option:selected").data("price");
          var totalCostRepairMachinePorHours = parseFloat(priceMachine) * parseFloat(coefCccrMachine);
          var totalCostRepairMechinePerPlot = parseFloat(areaPlot) * parseFloat(totalCostRepairMachinePorHours);

          /** calculo el gasto con rep y mant del implemento del valor a nuevo por el coeficiente estandar de rep*/
          var coefCccrImplement = $("#implement_implement_id option:selected").data("coef_cccr");
          var priceImplement = $("#implement_implement_id option:selected").data("price");
          var timeOperImplement = $("#implement_implement_id option:selected").data("oper_time");
          var totalCostRepairImplPerHours = parseFloat(priceImplement) * parseFloat(coefCccrImplement); 
          var totalCostRepairImplPerPlot = parseFloat(areaPlot) * parseFloat(totalCostRepairImplPerHours); 

          // realizo la sumatoria de mantenimiento y repacion de la maquinaria y su implemento de cada fila cargada
          var totalSumRepairMachineAndImplementPerHours = totalCostRepairImplPerHours + totalCostRepairMachinePorHours;

          //subtotal = (totalFuel + lubricant + repair machine and implement) * area plot
          var totalFuelPlot = parseFloat(costFuelPorHours) * parseFloat(areaPlot);
          var totalLubPlot = parseFloat((totalFuelPlot * 12)/100);
          var totalRepairMachineAndImpl = totalCostRepairMechinePerPlot + totalCostRepairImplPerPlot;
          var subtotal = totalFuelPlot + totalLubPlot + totalRepairMachineAndImpl;
            var html = agregarProducto(machine.text(),implement.text(),amount.val(),costFuelPorHours,lubricant,timeOperImplement,totalSumRepairMachineAndImplementPerHours,subtotal);
                // carga los trs en la tabla
                $("#detalhes-container tbody:first").append(html);
               // addFormField(producto.val(),consumo.val(),subtotal.toFixed(2));
                // resetea los campos despues de  cada add
               

            //incrementa al agregar cada fila
           // count++;
           // sum+=subtotal;  
          // $("#coquito2").val(sum.toFixed(2)); 
          
          
          
});
    
        //verifico si la maquinaria es un tractor entonces muestro el select de implemento
            $('#machine_machine_id').on("change",function(){
            var nameMachine = $("#machine_machine_id option:selected").data("name");
                if(nameMachine == 'TRACTOR'){ // or this.value == 'volvo'
                  $('#divImplement').show();
                }else{
                $('#divImplement').hide();
                }
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
