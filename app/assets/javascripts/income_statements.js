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
		var plot_id = $(this).data("id");
		income_result(plot_id);
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

function income_result(farming_plot_id)
{
	$.post({
	      url: "get_income_statement",
	      datatype: 'json',
	      data: {"farming_plot_id":farming_plot_id},
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
	         $("#total_depre").text(0);
	         $("#total_res_exp").text(0);
	         $("#total_fin_inco").text(0);
	         $("#total_extra_expe").text(0);
	         $("#res_before_trib").text(0);
	         $("#total_res_comp").text(0);
	         $("#total_res_trib").text(0);

      		$("#title_modal").append(" - Parcela: "+response.parcela+" - Cultivo: "+ response.tipo_de_cultivo);

	      },
	      error: function (resp) 
	      {
	         progress(false);
	         console.log(response);	         
	      }
	   });
}

