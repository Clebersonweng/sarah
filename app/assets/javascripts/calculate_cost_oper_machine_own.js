$(document).ready(function() {
   var count, sum = 0;
   var   machine,
         areaPlot,
         timeOper,
         totalTimeOper; // guarda la multiplicacion del tiempo operativo * el area de la parcela
   
   //variables de combustible gasto por parcela por maquina
   var coefConsum,lubricant,fuel,fuelPrice,hp,costFuelPorHours;
   //variables de cantidad de veces que se realizo la tarea
   var amount,subtotal;
   // variables de implementos
   var implement,coefCccrImplement,priceImplement,totalCostRepairImplPerHours,totalCostRepairImplPerTimeOper;
   // variables de maquinas
   var coefCccrMachine,priceMachine,totalCostRepairMachinePerHours,totalCostRepairMechinePerTimeOper;
   // RYM - reparacion y mantenimiento 
   /**verifico si la maquinaria es un pulverizador entonces el costo de rym esta solamente en maquinas
   y tiene el tiempo operativo si es pulverizador autop, o de arastre   */
   

   $('#implement_implement_id').on("change", function() 
   {
      repair_maint_implement($("#implement_implement_id option:selected").data("price"),$("#implement_implement_id option:selected").data("coef_cccr"));
      total_time_operativo($("#implement_implement_id option:selected").data("oper_time"), $("#cost_oper_machine_farming_plot_id option:selected").data("area"));
   });


   $('#cost_oper_machine_detail_machine_id').on("change", function()
   {
      var pulverizador = "PULVERIZADOR";
      var cosechadora = "COSECHADORA";
      var machineNotImplement = $("#cost_oper_machine_detail_machine_id option:selected").data("name");
   
      if (machineNotImplement.trim() === pulverizador || machineNotImplement.trim() === cosechadora ) 
      { 
         // trim sirve para quitar blancos                        
         total_cost_machine();
         totalCostRepairImplPerHours = 1;
         // si es pulv toma el tiempo de pulveriz
         //haciendo el calculo test de timepo opertaivo
         timeOper = $("#cost_oper_machine_detail_machine_id option:selected").data("time_oper");
         totalTimeOper = calcularTotalTiempoOperativo(timeOper, areaPlot);
         }
      else
      {
         calculateCostMachine();
      }       
   }); 
       

   /*aqui agrego todos los detalles de costo operativo y agrego fila por fila sumando y presentando el total operativo 
   para el usuario que tiene maquinaria propia
   */

   $("#agregarCostOper").on("click", function(event) {
       event.preventDefault();
       var totalTimeOperImpl = total_time_operative(timeOper, areaPlot);
       machine = $("#cost_oper_machine_detail_machine_id option:selected").text();//mostrar en el td   
       machineValue = $("#cost_oper_machine_detail_machine_id option:selected").val(); //tomar el value para guardar en la bd
       implementValue = $("#implement_implement_id option:selected").val();
       /**toma la cantidad de veces que realizo la tarea para multiplicar por 
        el gasto de combustible, lubricante y rym */

       amount = $("#amount").val();
       var lubricantValue = lubricant;
       // realizo la sumatoria de mantenimiento y repacion de la maquinaria y su implemento de cada fila cargada
       var totalSumRepairMachineAndImplementPerHours = totalCostRepairImplPerHours + totalCostRepairMachinePerHours;
       
   //subtotal = ((totalFuel*total de tiempo oper para esta parcela) + lubricant + repair machine and implement) * area parcela
       var totalFuelPerTotalTimeOper = (parseFloat(costFuelPorHours) * parseFloat(totalTimeOper));
       var totalLubPerTotalTimeOper = parseFloat(lubricant) * parseFloat(totalTimeOper);
       var totalRepairMachineAndImplPerTotalTimeOper = ((parseFloat(totalCostRepairMachinePerHours) + parseFloat(totalCostRepairImplPerHours)) * parseFloat(totalTimeOper));
       // subtotal sin multiplicar la cantidad de tareas
       var subtotalSinMultAmount = totalFuelPerTotalTimeOper + totalLubPerTotalTimeOper + totalRepairMachineAndImplPerTotalTimeOper;
    //subtotal multip cantidad de veces que se ejecuto la tarea
       subtotal = subtotalSinMultAmount * amount;
       var chargeTable = agregarProducto(machine, implement, amount, costFuelPorHours, lubricant, totalTimeOper.toFixed(2), totalSumRepairMachineAndImplementPerHours.toFixed(2), subtotal);
    // carga los trs en la tabla
       $("#detalhes-container tbody:first").append(chargeTable);
       addNuevasFilas (machineValue,implementValue, amount, costFuelPorHours, lubricantValue, totalSumRepairMachineAndImplementPerHours.toFixed(2), subtotal);//agrego cada fila
       // resetea los campos despues de  cada add
       //incrementa al agregar cada fila
        count++;
        sum+=subtotal; 
       
      $("#TOTAL").text(sum.toFixed(2));  
      $("#InputTotal").val(sum.toFixed(2));  
      

       
   });

   //verifico si la maquinaria es un tractor entonces muestro el select de implemento
   $('#cost_oper_machine_detail_machine_id').on("change", function() {
       var nameMachine = $("#cost_oper_machine_detail_machine_id option:selected").data("name");
       if (nameMachine == 'TRACTOR') { // or this.value == 'volvo'
           $('#divImplement').show();
       } else {
           $('#divImplement').hide();
       }
   }); 

   /** Limpio la tabla cargada al hacer click en cancel */
   $("#cancel").on("click", function(event) {
       event.preventDefault();
       $( "#tabla tbody tr" ).each( function(){
           this.parentNode.removeChild( this ); 
       });
   });
                     // cierre de metodo
});

function addNewRow(machine,implement, amount, fuel, lubricant, RYM, subtotal) 
{
   $("#addFilas").append(
        "<input type='hidden' size='20' name='cost_oper_machine[cost_oper_machine_details_attributes]["+count+"][machine_id]' id='txt' value="+machine+">"+
        "<input type='hidden' size='20' name='cost_oper_machine[cost_oper_machine_details_attributes]["+count+"][amount]' id='txt1' value="+amount+">"+
        "<input type='hidden' size='20' name='cost_oper_machine[cost_oper_machine_details_attributes]["+count+"][lubricant]' id='txt2' value="+lubricant+'>'+      
        "<input type='hidden' size='20' name='cost_oper_machine[cost_oper_machine_details_attributes]["+count+"][repair_and_maintenance]' id='txt2' value="+RYM+'>'+
        "<input type='hidden' size='20' name='cost_oper_machine[cost_oper_machine_details_attributes]["+count+"][subtotal]' id='txt2' value="+subtotal+'>'+
        "<input type='hidden' size='20' name='cost_oper_machine[cost_oper_machine_details_attributes]["+count+"][fuel]' id='txt2' value="+fuel+'>'+
         "<input type='hidden' size='20' name='cost_oper_machine[cost_oper_machine_details_attributes]["+count+"][implement_id]' id='txt' value="+implement+">"

        );
}

/**calculo de gastos con reparacion y mantenimiento,
                se realiza tomando del valor a nuevo de la maquina y multiplicando por el coeficiente*/


var addTotal = function(total)
{
     return "<tr>" + 
                 "<td>"  + "</td>" +
                  "<td>"  + "</td>" + 
                  "<td>"  + "</td>" +
                  "<td>"  + "</td>" + 
                  "<td>"  + "</td>" 
                 + "<td>"  + "</td>" +
                  "<td>"  + "</td>" + 
                 "<td class='total'>" + total + "</td>" + "<td style='text-align: center'>" + "<a href='#'" + "id='quitar'>" + "<i class='icon-minus'></i>" + "</a>" + "</td>" + 
             "</tr>";
}

function total_cost_machine(price_machine,coef_cccr_machine,coef_consum,fuel_price,hp) 
{
  
   var res_total_repair_machine = total_cost_repair_machine_per_hours(price_machine,coef_cccr_machine);
   //calculo el valor de combustible en $ gasto por hora para esta labor con este implemento
   var res_total_fuel = cost_fuel_por_hours(fuel_price,hp,coef_consum);
   //calculo de gasto de lubricantes
   var res_total_lub = total_lubricant(res_total_fuel);

   return res_total_repair_machine+res_total_fuel+res_total_lub;
}

function total_lubricant(total_cost_fuel_per_hours)
{
   lubricant = (parseFloat(total_cost_fuel_per_hours) * 12) / 100; // 12 % del total de combustible
   return lubricant;
}

function total_cost_repair_machine_per_hours(price,coef_cccr_machine)
{
   return parseFloat(price) * parseFloat(coef_cccr_machine);
}

function cost_fuel_por_hours(fuel_price,hp,coef_consumption)
{
   var data    =    parseFloat(fuel_price) * parseFloat(hp) * parseFloat(coef_consumption);
   return data;
}

function total_time_operative (time_oper, size_area)
{
  result = parseFloat(time_oper) * parseFloat(size_area) ;
  return result;
}

function repair_maint_implement(price_implement, coef_cccr_implement) 
{
   totalCostRepairImplPerHours = parseFloat(price_implement) * parseFloat(coef_cccr_implement);
  return totalCostRepairImplPerHours;
}


function calculate_total_time_oper_implements(implement,coef_cccr_impl,price,time_oper)
{  
      
}

function calculate_total_time_oper_machines(machine,coef_cccr_mach,price,time_oper)
{  
      
}
