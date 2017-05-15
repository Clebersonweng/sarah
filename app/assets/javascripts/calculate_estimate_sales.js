$(document).ready(function() {
    var precioProducto = 0;
    var totalDeProduccion = 0;
    /**tomo el area de la parcela para multiplicar por la estimacion de produccion,
      segun el precio  determinando el ingreso bruto de las ventas**/
    $("#estimate_sale_estimate_production").keyup(function() {
        var area = $("select#estimate_sale_farming_plot_id option:selected").data('area-parcela');
        var estimacionDeProduccion = $("#estimate_sale_estimate_production").val();
        var estimacionPorArea = parseFloat(estimacionDeProduccion) * parseFloat(area);
        $("#estimate_sale_total_production").val(estimacionPorArea);
    });
    $("#estimate_sale_price").change(function() {
        precioProducto = $("#estimate_sale_price").val();
        totalDeProduccion = $("#estimate_sale_total_production").val();
        var ingresoBruto = parseFloat(totalDeProduccion) * parseFloat(precioProducto);
        $("#estimate_sale_gross_sale").val(ingresoBruto);
    });

    $('#openHistory').click("click", function(event) {
        event.preventDefault();        
        $('#md_historyProd').modal({
            show: true
        });
        charge_history_prod();
    });
   
    /**limpiar los campos cargados al hacer click en salir*/
    $('#exitHistory').on("click",function(event){
        $(this).find("td").text("");
        $("#estimate_sale_estimate_production").text("");
    });
    
    



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

var charge_history_prod = function ()
{
    $("tbody tr input[type=checkbox]").on("change", function() {
        var $this = $(this);
        $this.closest('tr').each(function() {
            var quantity = $(this).find("td:nth-child(3)").text();
            $("#estimate_sale_estimate_production").val(quantity);

        });
    });
}