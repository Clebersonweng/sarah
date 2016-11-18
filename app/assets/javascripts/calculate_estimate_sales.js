$(document)
.ready(
    function() {
      var precioProducto = 0;
      var totalDeProduccion = 0;
      /**tomo el area de la parcela para multiplicar por la estimacion de produccion,
        segun el precio  determinando el ingreso bruto de las ventas**/
      $("#estimate_sale_estimate_production").keyup(function(){        
          var area = $("select#estimate_sale_farming_plot_id option:selected").data('area-parcela');
          var estimacionDeProduccion = $("#estimate_sale_estimate_production").val();
          var estimacionPorArea = parseFloat(estimacionDeProduccion) * parseFloat(area);
          $("#estimate_sale_total_production").val(estimacionPorArea);      
      });

      $("#estimate_sale_price").change(function(){    
        precioProducto = $("#estimate_sale_price").val();
        totalDeProduccion = $("#estimate_sale_total_production").val();
        var ingresoBruto = parseFloat(totalDeProduccion) * parseFloat(precioProducto);
        $("#estimate_sale_gross_sale").val(ingresoBruto);
         

      });
        
});