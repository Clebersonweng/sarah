var quantity_estimate_prod;
var total_production;
var price_sale;
var area;
var estimacionDeProduccion;
var title_name = "Estimacion de Ventas";
$(document).ready(function () {
    add_title_to_panel
    btn_evt_calculate_total_production();
    open_modal_history();
    evt_click_to_row_table();
    btn_evt_calculate_total_gross_sale();
});

function add_title_to_panel()
{
   $('.panel-title.text-center').html("Estimacion de Ventas"); 
}
/**************    Funciones de la estimacion de ventas ******************/
function open_modal_history()
{
    $('#openHistory').on("click", function (event) {
        event.preventDefault();
        $('#md_historyProd').modal("show");
        charge_history_prod();
    });

}
var charge_history_prod = function ()
{
    $("#tb_history_sale tbody tr").on("click", function () {
        $("#estimate_sale_estimate_production").focus("on");
        var quantity = $(this).find("td:nth-child(3)").text();
        $("#estimate_sale_estimate_production").val(quantity);
        $("#md_historyProd").modal('hide');
        //add_value_to_quantity_produced();
    });
}
function calcute_total_prod(area, quantity_produced)
{
    return area * quantity_produced;
}
function calculate_gross_sale(total_production, price)
{
    return total_production * price;
}

function btn_evt_calculate_total_production() {


    $("#estimate_sale_farming_plot_id").on("change", function () {

        if ($("#estimate_sale_farming_plot_id option:selected").data('area-parcela') !== "" || $("#estimate_sale_farming_plot_id option:selected").data('area-parcela') !== "undefined")
        {
            $("#openHistory").removeAttr('disabled');
            $("#openHistory").removeClass('disabled');
            $("#estimate_sale_estimate_production").removeAttr("readonly");

        } else
        {
            $("#openHistory").addAttr('disabled');
            $("#openHistory").addClass('disabled');
            $("#estimate_sale_estimate_production").addAttr("readonly");
        }
    });
    $("#estimate_sale_estimate_production").on("keyup focus change", function () {
        if ($("#estimate_sale_farming_plot_id option:selected").data('area-parcela') !== "" || $("#estimate_sale_farming_plot_id option:selected").data('area-parcela') !== "undefined")
        {
            $("#estimate_sale_total_production").val(calcute_total_prod($("#estimate_sale_farming_plot_id option:selected").data('area-parcela'), $("#estimate_sale_estimate_production").val()))

        }
    });

}
function evt_click_to_row_table() {

    $("#tb_history_sale").on("click", function () {
        quantity_estimate_prod = $("#estimate_sale_estimate_production").val();
        if (quantity_estimate_prod != "" && typeof quantity_estimate_prod != "undefined" && quantity_estimate_prod != (isNaN))
        {
            // $('#openHistory').prop("disabled", false); 
            var area = $("#estimate_sale_farming_plot_id option:selected").data('area-parcela');
            var estimacionDeProduccion = $("#estimate_sale_estimate_production").val();
            var estimacionPorArea = parseFloat(estimacionDeProduccion) * parseFloat(area);
            $("#estimate_sale_total_production").val(estimacionPorArea);
        }
    });
}
function btn_evt_calculate_total_gross_sale() {
    $("#estimate_sale_price").on("keyup", function () {
        if ($("#estimate_sale_total_production").val() !== "" && typeof $("#estimate_sale_total_production").val() !== "undefined" && $("#estimate_sale_total_production").val() !== "0")
        {
            $("#estimate_sale_gross_sale").val(calculate_gross_sale($("#estimate_sale_price").val(), $("#estimate_sale_total_production").val()));
        }
    });
}

/*    
 
 else if( $("#estimate_sale_total_production").val() != "" && $("#estimate_sale_total_production").val() != "undefined")
 {   
 $("#estimate_sale_total_production").val(calcute_total_prod($("#estimate_sale_farming_plot_id option:selected").data('area-parcela'), $("#estimate_sale_total_production")));  
 }
 else
 {
 $("#estimate_sale_price").val("");
 $("#estimate_sale_estimate_production").val('');
 $("#estimate_sale_total_production").val('');
 $("#openHistory").prop("disabled", true);
 $("#openHistory").addClass('disabled');
 }
 });
 }
 */
