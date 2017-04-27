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
      $('#openHistory').click("click",function(event){
        event.preventDefault();
	$('#myModal2').modal({show:true})
            $("tbody tr input[type=checkbox]").on("change", function() {
                 if($(this).prop('checked'))
                var boxes = $("tbody tr td:nth-child(3)").text();               
              alert(boxes);
            });
                
           
        
         
        });
    $('#machine_consumption').popover({ 
           html : true,
           title: "This is a test",
           content: "<b>hello popover world</b>"
         }).popover('show');

         /*comienzo para tirar valor de historico de ventas*/
         /*$.ajax({
            url: 'history_sale_url',
            type: 'POST',
            dataType: 'JSON',
            data: { "date":date, "quantity":quantity }
            success: function(data){
              alert("dfdf");
              $("#estimate_sale_estimate_production").append('data.quantity');
            }
            error: function (xhr, status, error) {
                    var err = eval("(" + xhr.responseText + ")");
                    alert(err.Message);
                }   
          });*/

        
        
});