/*

capacidad total de trabajo = ((ancho maquina * velocidad de trabajo * km) / 10000 m2)
capacidad de trabajo efectiva = ((ancho maquina real* velocidad de trabajo real * km) / 10000 m2)
eficiencia de campo = CTE/CTT
Tiempo Operativo = eficiencia de campo / CTE

consumo de combustible por horas = hp * coeficiente de consumo
*/



var ready;
ready = $(document).ready(function ()
{
	controlador = $("#controller").val();
	generic_response_form(controlador);
	form_machines_validates();
	$('#width_machine,#work_velocity,#real_width_machine,#real_work_velocity').valida_sarah('0123456789.,');

	md_popover("machine_consumption","Coef consumo lt/hs","Aprox. 0,16% * hp ");
	
	$('#md_consumption').on("show.bs.modal",function()
	{
		$("#hp_cons_machine").val($("#machine_hp").val());
	});

	$('#save_ctt_machine').on("click",function()
	{
		var ctt = total_working_capacity($("#width_machine").val(),$("#work_velocity").val());
		$("#machine_working_capacity").val(ctt);
		//$('#form_machines').bootstrapValidator('revalidateField', 'machine[working_capacity]');  
	});

	$('#save_cte_machine').on("click",function()
	{
		var cte = total_working_capacity_efective($("#real_width_machine").val(),$("#real_work_velocity").val());
		$("#machine_working_capacity_effective").val(cte.toFixed(4));
		
		var total_to = total_time_oper($("#real_width_machine").val(),$("#real_work_velocity").val());
		$("#machine_time_oper").val(total_to.toFixed(4));
	});

	$('#md_consumption').on("hidden.bs.modal",function()
	{
		calc_cons_fuel_per_hours();
	});

	$('#machine_working_capacity_effective').on("focusout",function()
	{
		var total_to = total_time_oper($("#real_width_machine").val(),$("#real_work_velocity").val());
		$("#machine_time_oper").val(total_to);
		$('form').bootstrapValidator('revalidateField', 'machine[time_oper]');  
	});

	$('#machine_type_machine_id').on("change",function(e)
	{
		
		if($(this).val() == "3" || $(this).val() == "2")
		{

			$('#machine_time_oper,#machine_working_capacity,#machine_working_capacity_effective').attr('readonly', false);
		}
		else
		{
			$('#machine_time_oper,#machine_working_capacity,#machine_working_capacity_effective').attr('readonly', true);
		}
	});

});

function form_machines_validates()
{
	$('#form_machines').bootstrapValidator({
		framework: 'bootstrap',
		icon: {
			valid: 'glyphicon glyphicon-ok',
			invalid: 'glyphicon glyphicon-remove',
			validating: 'glyphicon glyphicon-refresh'
		},
		fields: 
		{
			'machine[name]': {
				validators: {
					notEmpty: {
						message: 'Este campo es obligatório'
					}
				}
			},
			'machine[brand_id]': {
				validators: {
					notEmpty: {
						message: 'Este campo es obligatório'
					}
				}
			},
			'machine[model_id]': {
				validators: {
					notEmpty: {
						message: 'Este campo es obligatório'
					},
					verify_period: {
						message: 'hay que verificar'
					}
				}
			},
			'machine[type_machine_id]': {
				validators: {
					notEmpty: {
						message: 'Este campo es obligatório'
					}
				}
			},
			'machine[hp]': {
				validators: {
					notEmpty: {
						message: 'Este campo es obligatório'
					},
					stringLength: {
						min: 1,
						max: 5,
						message: 'El campo debe contener entre 1 y 4 valores'
					},
					numeric: {
						message: 'No es un valor numérico válido',
						thousandsSeparator: '.',
						decimalSeparator: ','
					}
				}
			},
			'machine[price]': {
				validators: {
					notEmpty: {
						message: 'Este campo es obligatorio'
					},
					stringLength: {
						min: 5,
						max: 15,
						message: 'El campo debe contener entre 1 y 15 numeros'
					},
					regexp: {
						regexp: /^[0-9.]+$/,
						message: 'Debe contener solamente numeros'
					}
				}
			},
			'machine[coeficient_cccr]': {
				validators: {
					notEmpty: {
						message: 'Este campo es obligatório'
					},
					stringLength: {
						min: 1,
						max: 9,
						message: 'El campo debe contener entre 1 y 15 numeros'
					},
					regexp: {
						regexp: /^[0-9.]+$/,
						message: 'Debe contener números decimales'
					}
				}
			},
			'machine[consumption]': {
				validators: {
					notEmpty: {
						message: 'Este campo es obligatório'
					},
					stringLength: {
						min: 1,
						max: 9,
						message: 'El campo debe contener entre 1 y 10 numeros'
					},
					regexp: {
						regexp: /^[0-9.]+$/,
						message: 'Debe contener solamente numeros'
					}
				}
			},
			'machine[time_oper]': {
				validators: {
					stringLength: {
						min: 1,
						max: 9,
						message: 'El campo debe contener el tiempo operativo con maximo 10 numeros'
					},
					regexp: {
						regexp: /^[0-9.]+$/,
						message: 'Debe contener solamente numero y punto decimal'
					}
				}
			},
			'machine[year_purchase]': {
				validators: {
					notEmpty: {
						message: 'Este campo es obligatório'
					},
					stringLength: {
						min: 4,
						max: 4,
						message: 'El campo debe contener el año de la maquinária'
					},
					regexp: {
						regexp: /^[0-9.]+$/,
						message: 'Debe contener solamente numeros'
					}
				}
			},
			'machine[fuel_id]': {
				validators: {
					notEmpty: {
						message: 'Este campo es obligatório'
					},
					stringLength: {
						min: 1,
						max: 9,
						message: 'El campo debe contener entre 1 y 10 numeros'
					},
					regexp: {
						regexp: /^[0-9.]+$/,
						message: 'Debe contener solamente numeros'
					}
				}
			},
			'machine[working_capacity]': {
				validators: {
					regexp: {
						regexp: /^[0-9.]+$/,
						message: 'Debe contener solamente números'
					}
				}
			},
			'machine[working_capacity_effective]': {
				validators: {
					regexp: {
						regexp: /^[0-9.]+$/,
						message: 'Debe contener solamente números'
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
	});
}

function calc_cons_fuel_per_hours()
{

	if(typeof $("#machine_hp").val() != "undefined" && $("#machine_hp").val() != "" || typeof $("#coef_cons_mach").val() != "undefined"  && $("#coef_cons_mach").val() != "")
	{ 
		var result  = $("#machine_hp").val() * $("#coef_cons_cccr").val();
		$("#machine_consumption").val(result.toFixed(4)); 
		$('form').bootstrapValidator('revalidateField', 'machine[consumption]');  
	} 
}

 

