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
						Morris.Area({
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
											});	
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
	         $("#gross_sale").text(response[0].ingreso_bruto);
	      },
	      error: function (resp) 
	      {
	         progress(false);
	         console.log(response);	         
	      }
	   });
}