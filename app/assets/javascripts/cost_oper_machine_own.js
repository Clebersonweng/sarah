var COUNT_COMO, sum,TOTAL_COM = 0;
var fuel,lubricant,repair_and_maintenance,time_oper = 0;
var res_total_repair_machine,res_total_repair_implement,res_sum_repair_machine_implement,res_total_fuel,res_total_lub,res_total_hours = 0 ;

$(document).ready(function() 
{


	controlador = $("#controller").val();
	generic_response_form(controlador,true);
	form_cost_oper_machine_own_validates();

	var FIELD_TOTAL_COM      = $("#cost_oper_machine_total").val();
	TOTAL_COM                = parseInt(FIELD_TOTAL_COM);

	$('#bt_cost_oper_machine_own').bootstrapTable();
	$('#tb_cost_machine').bootstrapTable();               

	$("#btn_add_cost_own").on("click",function(e)
	{ 

		$machine                = $("#cost_oper_own_machine_id option:selected");

		var machine_id             = $machine.val();
		var machine_text           = $machine.text();
		var machine_price          = $machine.data("price");
		var machine_cons           = $machine.data("consumption");
		var machine_hp             = $machine.data("hp");
		var machine_rm             = $machine.data("coef_cccr");
		var fuel_price             = $machine.data("price_fuel");
		var machine_to             = $machine.data("time_oper"); //tiempo operativo hs/has
		var machine_type_machine   = $machine.data("type_machine"); //tiempo operativo hs/has

		$implement                 = $("#cost_oper_own_implement_id option:selected");

		var implement_id           = $implement.val();
		var implement_text         = $implement.text();
		var implement_price        = $implement.data("price");
		var implement_rm           = $implement.data("coef_cccr");
		var implement_to           = $implement.data("oper_time");

		var area                   = $("#cost_oper_machine_program_production_id").val();
		var amount                 = $("#cost_oper_machine_own_amount").val();

		if(is_valid_fields_com())
		{
			new_row_dt(machine_text,implement_text,fuel_price,machine_price,machine_rm,implement_price,machine_hp,machine_cons,implement_rm,machine_to,implement_to,area,machine_id,implement_id,amount);   
		}
		else
		{
			$('form').bootstrapValidator('revalidateField', 'cost_oper_own[implement_id]');
			$('form').bootstrapValidator('revalidateField', 'cost_oper_own[machine_id]');
		  // $('form').bootstrapValidator('revalidateField', 'cost_oper_own[amount]');
		}
		
	});

	$("#cost_oper_own_machine_id").on("change",function(e)
	{
		var machine_type_machine   = $("#cost_oper_own_machine_id option:selected").data("type_machine"); //tipo de maquina para ocultar implemento

		if(typeof machine_type_machine != "undefined" && machine_type_machine == 1)
		{
		  $("#cost_oper_own_implement_id").prop("disabled",false);
	  }
	  else
	  {
		  $("#cost_oper_own_implement_id").prop("disabled",true);
		  $('form').bootstrapValidator('revalidateField', 'cost_oper_own[implement_id]');

	  }
  });

	$('#tb_cost_machine').on('check.bs.table', function (e, row) 
	{
		$('.remove').click(function () 
		{
			//var ids = getIdSelections($('#tb_suppy_detail'));
			$('#tb_cost_machine').bootstrapTable('remove', 
			{
			  field: 'id',
			  values: [row.id]
			});
			rest_cost_oper_m_own(row.subtotal);
			$('.remove').prop('disabled', true);
      });
		
	}); 
});


function new_row_dt(machine_text,implement_text,fuel_price,machine_price,machine_rm,implement_price,machine_hp,machine_cons,implement_rm,machine_to,implement_to,area,machine_id,implement_id,amount)
{
	// se calcula por horas para posterior multiplicar por la cantidad de horas trabajadas
	res_total_repair_machine     = total_cost_repair_machine_per_hours(machine_price,machine_rm); //Rep y Mant valor a nuevo. * coefciente de mantenimiento
	res_total_repair_implement   = total_repair_implement_por_hours(implement_price, implement_rm);
	
	//sumatoria de gastos con reparacion y mantenimiento tanto de maquina como de implementos
	res_sum_repair_machine_implement = res_total_repair_machine + res_total_repair_implement;
	
	//gasto de combustible por hora maquina
	res_total_fuel               = cost_fuel_por_hours(fuel_price,machine_cons);
	res_total_lub                = total_lubricant(res_total_fuel);
	
	if ( typeof machine_to != "undefined" && machine_to > 0)
	{     
		res_total_hours = quantity_hours_needed(machine_to,area);
	}
	else if(typeof implement_to != "undefined" && implement_to > 0)
	{
		res_total_hours   = quantity_hours_needed(implement_to,area);
	}

	var subtotal = (((res_total_fuel+res_total_lub+res_sum_repair_machine_implement) * res_total_hours).toFixed(0)) * amount;
	TOTAL_COM += parseInt(subtotal);

	$(".cost_oper_machine_total").html(TOTAL_COM);
	$("#cost_oper_machine_total").val(TOTAL_COM);

	var  _row_ =      
	{
		"id": COUNT_COMO,
		"code": COUNT_COMO,
		"machine": machine_text,   
		"machine_id": "<input type='hidden' size='20' name='cost_oper_machine[cost_oper_machine_details_attributes]["+COUNT_COMO+"][machine_id]' id='txt' value="+machine_id+">",
		"implement": implement_text,  
		"implement_id": "<input type='hidden' size='20' name='cost_oper_machine[cost_oper_machine_details_attributes]["+COUNT_COMO+"][implement_id]' id='txt' value="+implement_id+">",  
		"fuel": res_total_fuel,  
		"fuel_id": "<input type='hidden' size='20' name='cost_oper_machine[cost_oper_machine_details_attributes]["+COUNT_COMO+"][fuel]' id='txt' value="+res_total_fuel+">", 
		"lubricant": res_total_lub.toFixed(0),  
		"lubricant_id": "<input type='hidden' size='20' name='cost_oper_machine[cost_oper_machine_details_attributes]["+COUNT_COMO+"][lubricant]' id='txt' value="+res_total_lub.toFixed(0)+">",
		"rep_and_maint": res_sum_repair_machine_implement.toFixed(0),   
		"rep_and_maint_id": "<input type='hidden' size='20' name='cost_oper_machine[cost_oper_machine_details_attributes]["+COUNT_COMO+"][repair_and_maintenance]' id='txt' value="+res_sum_repair_machine_implement+">",  
		"hours_needed": res_total_hours, 
		"hours_needed_id": "<input type='hidden' size='20' name='cost_oper_machine[cost_oper_machine_details_attributes]["+COUNT_COMO+"][hours_needed]' id='txt' value="+res_total_hours+">", 
		"amount": amount,   
		"amount_id": "<input type='hidden' size='20' name='cost_oper_machine[cost_oper_machine_details_attributes]["+COUNT_COMO+"][amount]' id='txt' value="+amount+">", 
		"subtotal": subtotal.toFixed(0),
		"subtotal_val":  "<input type='hidden' size='20' name='cost_oper_machine[cost_oper_machine_details_attributes]["+COUNT_COMO+"][subtotal]' id='txt' value="+subtotal.toFixed(0)+">",
		"Action" : '<a class="remove  btn btn-danger delete btn-sm" title="Eliminar"><i class="fa fa-trash" aria-hidden="true"></i></a>'
	};

	$('#tb_cost_machine').bootstrapTable("append", _row_);   
	$("#cost_oper_own_machine_id").val("");
	$("#cost_oper_own_implement_id").val("");
	COUNT_COMO++;
}


function total_lubricant(total_cost_fuel_per_hours)
{
	lubricant = (eval(total_cost_fuel_per_hours) * 12) / 100; // 12 % del total de combustible
	return lubricant;
}

function total_cost_repair_machine_per_hours(price_new,coef_cccr_machine)
{
	return eval(price_new) * eval(coef_cccr_machine);
}

function total_repair_implement_por_hours(price_new_implement, coef_cccr_implement) 
{
	var totalCostRepairImplPerHours;
	if(isNaN(price_new_implement) || isNaN(coef_cccr_implement))
	{
		totalCostRepairImplPerHours = 1;
	}
	else
	{
		totalCostRepairImplPerHours = eval(price_new_implement) * eval(coef_cccr_implement);
	}

	return totalCostRepairImplPerHours;
}

function cost_fuel_por_hours(fuel_price,consumption)
{
	var data    =    parseFloat(fuel_price) * parseFloat(consumption);
	return data;
}

function quantity_hours_needed(time_oper,area)
{
	var result = eval(time_oper) * eval(area);
	return result.toFixed(2);
}


function form_cost_oper_machine_own_validates()
{
	$('#form_cost_oper_machines').bootstrapValidator({
		excluded: [':disabled', ':hidden', ':not(:visible)'],
		fields: {
			"cost_oper_machine[program_production_id]": {
			  validators: {
				 notEmpty: {
					message: 'Este campo es obligatório! No creaste un programa de producción!'
				}
			}
		}
	}
}).on('init.field.fv', function (e, data) {
 e.preventDefault();
		 if (data.fv.getInvalidFields().length > 0) {    // There is invalid field
			data.fv.disableSubmitButtons(true);
		}
	}).on('success.field.fv', function (e, data) {
	 e.preventDefault();
		 if (data.fv.getInvalidFields().length > 0) {    // There is invalid field
			data.fv.disableSubmitButtons(true);
		}
	}).on('change', 'form', function (e) {
	 e.preventDefault();
		 //$("#form_products").bootstrapValidator('revalidateField', 'investments');
	 });
}

function is_valid_fields_com()
{
	$implement              = $("#cost_oper_own_implement_id option:selected");
	$machine                = $("#cost_oper_own_machine_id option:selected");
	$type_machine           = $machine.data("type_machine");
	
	if ($machine.val() != "" )
	{
		if($machine.val() != "" && $type_machine === 1 && $implement.val() == "")
		{
			$('form').bootstrapValidator('revalidateField', 'cost_oper_own[implement_id]');
			return false;
		}
		else
		{
			$('form').bootstrapValidator('revalidateField', 'cost_oper_own[implement_id]');
			return true;
		}
	}
	else
	{
		return false;
	}
}

rest_cost_oper_m_own = function (subtotal)
{
	TOTAL_COM -= subtotal;
	$(".cost_oper_machine_total").text(TOTAL_COM); // suma fijo y variable
	$("#cost_oper_machine_total").val(TOTAL_COM); // suma fijo y variable
}
	




