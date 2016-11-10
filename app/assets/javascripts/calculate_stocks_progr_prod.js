$(document)
.ready(
    function() {
      var stock_end = 0;
      var stock_start = 0;
      var variation_stock = 0;
      var estimateUnits;
      var program_production= 0;
        var total_production =0;
      /**tomo el area de la parcela para multiplicar por la estimacion de produccion,
        segun el precio  determinando el ingreso bruto de las ventas**/
      $("#program_production_stock_initial").change(function(){        
           stock_end = $("#program_production_stock_end").val();
           stock_start = $("#program_production_stock_initial").val();
           variation_stock = (parseInt(stock_end) - (parseInt(stock_start)));
          $("#program_production_variation_stock").val(variation_stock);  
    
          if(variation_stock < 0){
            total_production = $("#program_production_estimate_sale_id option:selected").data('total-production');        
            variation_stock = $("#program_production_variation_stock").val();
            program_production = (parseInt(total_production) - (parseInt(-variation_stock)));
            $("#program_production_program_production").val(program_production);
          }else{
            total_production = $("#program_production_estimate_sale_id option:selected").data('total-production');        
            variation_stock = $("#program_production_variation_stock").val();
            program_production = (parseInt(total_production) - (parseInt(variation_stock)));
            $("#program_production_program_production").val(program_production);
          }


      
          

      });
});