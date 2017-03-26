$(document).ready(function() {
    var count = 0;
    var sum = 0;
    var machine;
    var areaPlot;
    var totalTimeOper; // guarda la multiplicacion del tiempo operativo * el area de la parcela
    var timeOper;
    //variables de combustible gasto por parcela por maquina
    var coefConsum;
    var lubricant;
    var fuel;
    var fuelPrice;
    var hp;
    var costFuelPorHours;
    //variables de cantidad de veces que se realizo la tarea
    var amount;
    var subtotal;
    // variables de implementos
    var implement;
    var coefCccrImplement;
    var priceImplement;
    var totalCostRepairImplPerHours;
    var totalCostRepairImplPerTimeOper;
    // variables de maquinas
    var coefCccrMachine;
    var priceMachine;
    var totalCostRepairMachinePerHours;
    var totalCostRepairMechinePerTimeOper;
    // RYM - reparacion y mantenimiento
    var agregarProducto = function(nameMachine, amount, nameFuel, nameImplement, lubricant, totalTimeOper, RYM, subtotal) {
        return "<tr>" + 
                    "<td>" + nameMachine + "</td>" +
                     "<td>" + amount + "</td>" + 
                     "<td>" + nameFuel + "</td>" +
                     "<td>" + nameImplement + "</td>" + 
                     "<td>" + lubricant + "</td>" 
                    + "<td>" + RYM + "</td>" +
                     "<td>" + totalTimeOper + "</td>" + 
                    "<td class='subtotal'>" + subtotal + "</td>" + "<td style='text-align: center'>" + "<a href='#'" + "id='quitar'>" + "<i class='icon-minus'></i>" + "</a>" + "</td>" +
                "</tr>";
    };

     function addNuevasFilas(machine,implement, amount, fuel, lubricant, RYM, subtotal) {
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

    var addTotal = function(total){
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
    var calcularTotalTiempoOperativo = function(tiempoOper, tamanhoArea){
        result = tiempoOper * tamanhoArea;
        return result;
    };
   
    /**calculo de gastos con reparacion y mantenimiento,
             se realiza tomando del valor a nuevo de la maquina y multiplicando por el coeficiente*/
    function calculateCostMachine() {
        coefCccrMachine = $("#machine_machine_id option:selected").data("coef_cccr");
        priceMachine = $("#machine_machine_id option:selected").data("price");
        totalCostRepairMachinePerHours = parseFloat(priceMachine) * parseFloat(coefCccrMachine);
        coefConsum = $("#machine_machine_id option:selected").data("consumption");
        fuel = $("#machine_machine_id option:selected").data("price_fuel");
        hp = $("#machine_machine_id option:selected").data("hp");
        //calculo el valor de combustible en $ gasto por hora para esta labor con este implemento
        costFuelPorHours = fuel * hp * coefConsum;
        //calculo de gasto de lubricantes
        lubricant = (costFuelPorHours * 12) / 100;
    }
   
        /**verifico si la maquinaria es un pulverizador entonces el costo de rym esta solamente en maquinas
           y tiene el tiempo operativo si es pulverizador autop, o de arastre   */
    
     $('#cost_oper_machine_farming_plot_id').on("change", function() {
        areaPlot = $("#cost_oper_machine_farming_plot_id option:selected").data("area");
     });


    function calcularRymDeImplemento(priceImplement, coefCccrImplement, timeOperative) {
        totalCostRepairImplPerHours = parseFloat(priceImplement) * parseFloat(coefCccrImplement);
        return totalCostRepairImplPerHours;
    }


    $('#implement_implement_id').on("change", function() {
        implement = $("#implement_implement_id option:selected").text();
        coefCccrImplement = $("#implement_implement_id option:selected").data("coef_cccr");
        priceImplement = $("#implement_implement_id option:selected").data("price");
        calcularRymDeImplemento(coefCccrImplement, priceImplement);
        timeOper = $("#implement_implement_id option:selected").data("oper_time");
        totalTimeOper = calcularTotalTiempoOperativo(timeOper, areaPlot);
    });


     $('#machine_machine_id').on("change", function() {
            var pulverizador = "PULVERIZADOR";
            var cosechadora = "COSECHADORA";
            var machineNotImplement = $("#machine_machine_id option:selected").data("name");
            if (machineNotImplement.trim() === pulverizador || machineNotImplement.trim() === cosechadora ) { // trim sirve para quitar blancos                        
                calculateCostMachine();
                totalCostRepairImplPerHours = 1;
                // si es pulv toma el tiempo de pulveriz
                //haciendo el calculo test de timepo opertaivo
                timeOper = $("#machine_machine_id option:selected").data("time_oper");
                totalTimeOper = calcularTotalTiempoOperativo(timeOper, areaPlot);
            }else{
            calculateCostMachine();
            }       
    }); 
    

/*aqui agrego todos los detalles de costo operativo y agrego fila por fila sumando y presentando el total operativo 
para el usuario que tiene maquinaria propia
*/

$("#agregarCostOper").on("click", function(event) {
    event.preventDefault();
    var totalTimeOperImpl = calcularTotalTiempoOperativo(timeOper, areaPlot);
    machine = $("#machine_machine_id option:selected").text();//mostrar en el td   
    machineValue = $("#machine_machine_id option:selected").val(); //tomar el value para guardar en la bd
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
$('#machine_machine_id').on("change", function() {
    var nameMachine = $("#machine_machine_id option:selected").data("name");
    if (nameMachine == 'TRACTOR') { // or this.value == 'volvo'
        $('#divImplement').show();
    } else {
        $('#divImplement').hide();
    }
}); 

$("#quitar").on("click", function(event) {
    event.preventDefault();
    $(this).parent().parent().remove();
});
/**
                  // cierre de metodo
**/
});