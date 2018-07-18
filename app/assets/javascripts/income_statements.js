$(document).ready(function ()
{

	controlador = $("#controller").val();
	if(controlador == "income_statements")
	{
		$("#submenu_new").hide();
	}
	else
	{
		$("#submenu_new").removeClass("hide");	
	}
	
	$(".btn_income").on("click",function()
	{
		progress(true);
		$(".modal_income").modal("show");
		var type_of_crop_id = $(this).data("id");
		income_result(type_of_crop_id);
	});

	$(".btn_statistics").on("click",function()
	{
		progress(true);
		$(".md_statistics").modal("show");
	});
	
	setTimeout(function(){
						/*Morris.Area({
											  element: 'chart',
											  data: [
											    { y: '2006', a: 100, b: 90 },
											    { y: '2007', a: 75,  b: 65 },
											    { y: '2008', a: 50,  b: 40 },
											    { y: '2009', a: 75,  b: 65 },
											    { y: '2010', a: 50,  b: 40 },
											    { y: '2011', a: 75,  b: 65 },
											    { y: '2012', a: 100, b: 90 }
											  ],
											  xkey: 'y',
											  ykeys: ['a', 'b'],
											  labels: ['Series A', 'Series B']
											});	*/
					},100);
	

});

function income_result(type_of_crop_id)
{
	$.post({
	      url: "/" + controlador +"/get_income_statement",
	      datatype: 'json',
	      data: {"type_of_crop_id":type_of_crop_id},
	      success: function (response) 
	      {
	         progress(false);
	         $("#total_gross_sale").text(set_numeric(response.venta_bruta));
	         $("#total_devolution").text(set_numeric(response.devoluciones));
	         $("#total_discount").text(set_numeric(response.descuentos));
	         $("#total_net_sales").text(set_numeric(response.ventas_netas));
	         $("#total_supply").text(set_numeric(response.total_g_insumos));
	         $("#total_mach_out").text(set_numeric(response.total_g_maquina_terceros));
	         $("#total_mach_own").text(set_numeric(response.total_g_maquina_propia));
	         $("#total_man_pow").text(set_numeric(response.total_g_mano_obra));
	         $("#total_ha").text(set_numeric(response.costo_x_ha));
	         $("#total_cost_prod_plot").text(set_numeric(response.total_costo_prod_unid_vend_parcela));
	         $("#total_spend").text(set_numeric(response.total_g_comercializacion));
	         $("#margin_product").text(set_numeric(response.margen_producto));
	         $("#total_exp_indi").text(set_numeric(response.total_g_indirectos_produccion));
	         $("#total_stru").text(set_numeric(response.total_g_estructura));
	         $("#total_depre").text(response.dotacion_amortizaciones);
	         $("#total_res_exp").text(set_numeric(response.resultado_explotacion));
	         $("#total_fin_inco").text(response.ingresos_financieros);
	         $("#total_extra_expe").text(set_numeric(response.gastos_extraordinarios));
	         $("#res_before_trib").text(set_numeric(response.resultado_ante_impuestos));
	         $("#total_res_comp").text(set_numeric(response.resultado_sociedades));
	         $("#total_res_trib").text(set_numeric(response.resultado_despues_impuestos));

	         //porcientos
	         $("#porciento_descuentos").text((response.descuentos*100)/response.venta_bruta); 
	         $("#porciento_devoluciones").text((response.devoluciones*100)/response.venta_bruta); 
	         
	         var ventas_porciento = ((response.ventas_netas*100)/response.venta_bruta);
	         $("#porciento_ventas_netas").text(ventas_porciento.toFixed(2));
	         
	         var costo_parcela_porciento =  ((response.total_costo_prod_unid_vend_parcela*100)/response.ventas_netas);
	         $("#costo_parcela_porciento").text(costo_parcela_porciento.toFixed(2)); 
	         
	         var insumo_porciento =  ((response.total_g_insumos*100)/response.ventas_netas);
	         $("#porciento_insumos").text(insumo_porciento.toFixed(2)); 
	        
	         var porciento_maquina_tercerizada =  ((response.total_g_maquina_terceros*100)/response.ventas_netas);
	         $("#porciento_maquina_tercerizada").text(porciento_maquina_tercerizada.toFixed(2)); 

	         var porciento_maquina_propia =  ((response.total_g_maquina_propia*100)/response.ventas_netas);
	         $("#porciento_maquina_propia").text(porciento_maquina_propia.toFixed(2)); 

				var porciento_mano_obra =  ((response.total_g_mano_obra*100)/response.ventas_netas);
	         $("#porciento_mano_obra").text(porciento_mano_obra.toFixed(2)); 

				var porciento_transporte =  ((response.total_g_comercializacion*100)/response.ventas_netas);
	         $("#porciento_transporte").text(porciento_transporte.toFixed(2)); 
				
				var porciento_margen_producto =  ((response.margen_producto*100)/response.ventas_netas);
	         $("#porciento_margen_producto").text(porciento_margen_producto.toFixed(2)); 

				var porciento_depreciacion =  ((response.dotacion_amortizaciones*100)/response.ventas_netas);
	         $("#porciento_depreciacion").text(porciento_depreciacion.toFixed(2)); 

				var porciento_gastos_indi_produccion =  ((response.total_g_indirectos_produccion*100)/response.ventas_netas);
	         $("#porciento_gastos_indi_produccion").text(porciento_gastos_indi_produccion.toFixed(2)); 

				var porciento_gastos_estructura =  ((response.total_g_estructura*100)/response.ventas_netas);
	         $("#porciento_gastos_estructura").text(porciento_gastos_estructura.toFixed(2)); 

				var porciento_resultado_explotacion =  ((response.resultado_explotacion*100)/response.ventas_netas);
	         $("#porciento_resultado_explotacion").text(porciento_resultado_explotacion.toFixed(2)); 

 				var porciento_ingresos_financieros =  ((response.ingresos_financieros*100)/response.ventas_netas);
	         $("#porciento_ingresos_financieros").text(porciento_ingresos_financieros.toFixed(2)); 

				var porciento_gastos_extraordinarios =  ((response.gastos_extraordinarios*100)/response.ventas_netas);
	         $("#porciento_gastos_extraordinarios").text(porciento_gastos_extraordinarios.toFixed(2)); 
				
				var porciento_resultado_ante_impuestos =  ((response.resultado_ante_impuestos*100)/response.ventas_netas);
	         $("#porciento_resultado_ante_impuestos").text(porciento_resultado_ante_impuestos.toFixed(2)); 
				
				var porciento_resultado_sociedades =  ((response.resultado_sociedades*100)/response.ventas_netas);
	         $("#porciento_resultado_sociedades").text(porciento_resultado_sociedades.toFixed(2)); 
				
				var porciento_resultado_despues_impuestos =  ((response.resultado_despues_impuestos*100)/response.ventas_netas);
	         $("#porciento_resultado_despues_impuestos").text(porciento_resultado_despues_impuestos.toFixed(2)); 

				
      		$("#title_modal").append(" - Parcela: "+response.parcela+" - Cultivo: "+ response.tipo_de_cultivo);

      },
      error: function (resp) 
      {
	         progress(false);
	         console.log(resp);
            alert_sarah("Ocurrio un error al recuperar los registros de la cuenta de resultados!", "error");
      },
      always: function(resp)
      {
         progress(false);
      }
   });
}

