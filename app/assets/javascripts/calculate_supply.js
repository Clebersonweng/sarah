$(document)
.ready(
    function() {
      var price = 0;
      var cost_per_hectare = 0;
      var dosage = 0;
      /**tomo el area de la parcela para multiplicar por la estimacion de produccion,
        segun el precio  determinando el ingreso bruto de las ventas**/
      $("#supply_dosage").change(function(){        
           price = $("#supply_price").val();
           dosage = $("#supply_dosage").val();
           cost_per_hectare = parseFloat(price) * parseFloat(dosage);
            cost_per_hectare.toFixed(2);           
          $("#supply_cost_per_hectare").val(cost_per_hectare);  

      });
});