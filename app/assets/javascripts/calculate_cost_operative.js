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
        return "<tr>" + "<td>" + nameMachine + "</td>" + "<td>" + amount + "</td>" + "<td>" + nameFuel + "</td>" + "<td>" + nameImplement + "</td>" + "<td>" + lubricant + "</td>" + "<td>" + RYM + "</td>" + "<td>" + totalTimeOper + "</td>" + "<td class='subtotal'>" + subtotal + "</td>" + "<td style='text-align: center'>" + "<a href='#'" + "id='quitar'>" + "<i class='icon-minus'></i>" + "</a>" + "</td>" + "</tr>";
    };
    var calcularTotalTiempoOperativo = function(tiempoOper, tamanhoArea){
        result = tiempoOper * tamanhoArea;
        return result;
    };
    function addFormField(idSup, totalUnit, subtotal) {
        $("#test").append("<input type='text' size='20' name='cons_raw_material[cons_raw_material_details_attributes][" + count + "][supply_id]' id='txt' value=" + idSup + ">" + "<input type='text' size='20' name='cons_raw_material[cons_raw_material_details_attributes][" + count + "][total_unit]' id='txt1' value=" + totalUnit + ">" + "<input type='text' size='20' name='cons_raw_material[cons_raw_material_details_attributes][" + count + "][subtotal]' id='txt2' value=" + subtotal + '>');
    }
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
    
$("#agregarCostOper").on("click", function(event) {
    event.preventDefault();
    var totalTimeOperImpl = calcularTotalTiempoOperativo(timeOper, areaPlot);
    machine = $("#machine_machine_id option:selected").text();//mostrar en el td   
    
    /**toma la cantidad de veces que realizo la tarea para multiplicar por 
     el gasto de combustible, lubricante y rym */
    amount = $("#amount").val();
    // realizo la sumatoria de mantenimiento y repacion de la maquinaria y su implemento de cada fila cargada
    var totalSumRepairMachineAndImplementPerHours = totalCostRepairImplPerHours + totalCostRepairMachinePerHours;
    
//subtotal = ((totalFuel*total de tiempo oper para esta parcela) + lubricant + repair machine and implement) * area plot
    var totalFuelPerTotalTimeOper = (parseFloat(costFuelPorHours) * parseFloat(totalTimeOper));
    var totalLubPerTotalTimeOper = parseFloat(lubricant) * parseFloat(totalTimeOper);
    var totalRepairMachineAndImplPerTotalTimeOper = ((parseFloat(totalCostRepairMachinePerHours) + parseFloat(totalCostRepairImplPerHours)) * parseFloat(totalTimeOper));
    // subtotal sin multiplicar la cantidad de tareas
    var subtotalSinMultAmount = totalFuelPerTotalTimeOper + totalLubPerTotalTimeOper + totalRepairMachineAndImplPerTotalTimeOper;
 //subtotal multip cantidad de veces que se ejecuto la tarea
    subtotal = subtotalSinMultAmount * amount;
    var html = agregarProducto(machine, implement, amount, costFuelPorHours, lubricant, totalTimeOper, totalSumRepairMachineAndImplementPerHours, subtotal);
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
$('#machine_machine_id').on("change", function() {
    var nameMachine = $("#machine_machine_id option:selected").data("name");
    if (nameMachine == 'TRACTOR') { // or this.value == 'volvo'
        $('#divImplement').show();
    } else {
        $('#divImplement').hide();
    }
}); $("#quitar").on("click", function(event) {
    event.preventDefault();
    $(this).parent().parent().remove();
});
/**
                  // cierre de metodo
**/
});