var quantity_estimate_prod;
var total_production;
var price_sale;
var area;
var estimacionDeProduccion;

$(document).ready(function () {
	btn_evt_calculate_total_production();
	evt_click_to_row_table();
	btn_evt_calculate_total_gross_sale();
	form_estimate_sale_validates();
	remove_error_before_charge_gross_sale();

	controlador = $("#controller").val();
	
	verify_exist_type_crop_to_period();
	$("#openHistory").off("click").on("click", function () {
		$("#md_historyProd").modal('show');
		charge_history_prod();
	});

});


/**************    Funciones de la estimacion de ventas ******************/
function charge_history_prod()
{
	$("#tb_history_sale tbody tr").on("click", function () {
		$("#estimate_sale_estimate_production").focus("on");
		var quantity = $(this).find("td:nth-child(3)").text();
		$("#estimate_sale_estimate_production").val(quantity);
		$('form').bootstrapValidator('revalidateField', 'estimate_sale[estimate_production]');
		$("#md_historyProd").modal('hide');

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

function btn_evt_calculate_total_production()
{
	$("#estimate_sale_farming_plot_id").off("change").on("change", function () {

		if ($("#estimate_sale_farming_plot_id option:selected").data('area-parcela') !== "" || $("#estimate_sale_farming_plot_id option:selected").data('area-parcela') !== "undefined")
		{
			$("#openHistory").removeAttr('disabled').removeClass('disabled');
			$("#estimate_sale_estimate_production").removeAttr("readonly");
		}
		else
		{
			$("#openHistory").addAttr('disabled').addClass('disabled');
			$("#estimate_sale_estimate_production").addAttr("readonly");
		}
	});
	$("#estimate_sale_estimate_production").off("keyup").on("keyup", function () {
		if ($("#estimate_sale_farming_plot_id option:selected").data('area-parcela') !== "" || $("#estimate_sale_farming_plot_id option:selected").data('area-parcela') !== "undefined")
		{
			var total_val_production = calcute_total_prod($("#estimate_sale_farming_plot_id option:selected").data('area-parcela'), $("#estimate_sale_estimate_production").val());
			$("#estimate_sale_total_production").val(total_val_production.toFixed(2));

		}
	});

}

function evt_click_to_row_table() {

	$("#tb_history_sale").off("click").on("click", function () {
		quantity_estimate_prod = $("#estimate_sale_estimate_production").val();
		if (quantity_estimate_prod != "" && typeof quantity_estimate_prod != "undefined" && quantity_estimate_prod != (isNaN))
		{
			var area = $("#estimate_sale_farming_plot_id option:selected").data('area-parcela');
			var estimacionDeProduccion = $("#estimate_sale_estimate_production").val();
			var estimacionPorArea = parseFloat(estimacionDeProduccion) * parseFloat(area);
			$("#estimate_sale_total_production").val(estimacionPorArea);
			$('form').bootstrapValidator('revalidateField', 'estimate_sale[total_production]');
		}
	});
}

function btn_evt_calculate_total_gross_sale() {
	$("#estimate_sale_price").off("keyup").on("keyup", function () {
		if ($("#estimate_sale_total_production").val() !== "" && typeof $("#estimate_sale_total_production").val() !== "undefined" && $("#estimate_sale_total_production").val() !== "0")
		{
			$("#estimate_sale_gross_sale").val(calculate_gross_sale($("#estimate_sale_price").val(), $("#estimate_sale_total_production").val()));
		}
	});
}

function form_estimate_sale_validates()
{
	$('#form_estimate_sales').bootstrapValidator({
		framework: 'bootstrap',
		icon: {
			valid: 'glyphicon glyphicon-ok',
			invalid: 'glyphicon glyphicon-remove',
			validating: 'glyphicon glyphicon-refresh'
		},
		fields: {
         "estimate_sale[date_init]": {
             validators: {
                  notEmpty: {
                     message: 'Este campo es obligatório'
                  },
                  date: {
                     format: 'DD/MM/YYYY',
                     message: 'La fecha no es valida',
                     min: '01/01/2010',
                     max: '10/12/2050'
                  }
               }
         },
         "estimate_sale[date_end]": {
             validators: {
                  notEmpty: {
                     message: 'Este campo es obligatório'
                  },
                  date: {
                     format: 'DD/MM/YYYY',
                     message: 'La fecha no es valida',
                     min: '01/01/2010',
                     max: '10/12/2050'
                  }
               }
         },
			'estimate_sale[farming_plot_id]': {
				validators: {
					notEmpty: {
						message: 'Este campo es obligatório'
					}
				}
			},
			'estimate_sale[type_of_crop_id]': {
				validators: {
					notEmpty: {
						message: 'Este campo es obligatório'
					},
					verify_period: {
						message: 'hay que verificar'
					}
				}
			},
			'estimate_sale[estimate_production]': {
				validators: {
					notEmpty: {
						message: 'Este campo es obligatório'
					},
					stringLength: {
						min: 1,
						max: 9,
						message: 'El campo debe contener entre 1 y 9 numeros'
					},
					regexp: {
						regexp: /^[0-9.]+$/,
						message: 'Debe contener solamente numeros'
					}
				}
			},
			'estimate_sale[total_production]': {
				validators: {
					notEmpty: {
						message: 'Este campo es obligatório'
					},
					stringLength: {
						min: 3,
						max: 10,
						message: 'El campo debe contener entre 3 y 10 numeros'
					},
					regexp: {
						regexp: /^[0-9.]+$/,
						message: 'Debe contener solamente números'
					}
				}
			},
			'estimate_sale[price]': {
				validators: {
					notEmpty: {
						message: 'Este campo es obligatorio'
					},
					stringLength: {
						min: 1,
						max: 9,
						message: 'El campo debe contener entre 1 y 9 numeros'
					},
					regexp: {
						regexp: /^[0-9.]+$/,
						message: 'Debe contener solamente numeros'
					}
				}
			}
		}

	})
	.on('status.field.bv', function (e, data) {
		if (data.bv.getSubmitButton()) {
			data.bv.disableSubmitButtons(false);
		}
	});
}

function remove_error_before_charge_estimate_prod()
{
	if (typeof $("#estimate_sale_estimate_production").val() != "" || typeof $("#estimate_sale_estimate_production").val() != "undefined")
	{
		$('form').bootstrapValidator('revalidateField', 'estimate_sale[total_production]');
		$('form').bootstrapValidator('revalidateField', 'estimate_sale[estimate_prod]');
	}
}

function remove_error_before_charge_gross_sale()
{
	$("#estimate_sale_price").off("focusout").on("focusout", function () {
		if (typeof $("#estimate_sale_gross_sale").val() != "" || typeof $("#estimate_sale_gross_sale").val() != "undefined")
		{
			$('form').bootstrapValidator('revalidateField', 'estimate_sale[gross_sale]');
		}
	});
}

function verify_exist_type_crop_to_period()
{
	$("#estimate_sale_farming_plot_id").on("change", function ()
	{
		var date_init       = convert_date($("#estimate_sale_date_init").val());
		var date_end        = convert_date($("#estimate_sale_date_end").val());
		var farming_plot_id = $("#estimate_sale_farming_plot_id").val();
		var type_of_crop_id = $("#estimate_sale_type_of_crop_id").val();

		if (typeof date_init != "" && typeof date_end != "" && typeof farming_plot_id != "" && typeof type_of_crop_id != "" && farming_plot_id != "")
		{
			$.ajax({
				type: "POST",
				dataType: 'json',
				data: {"date_init": date_init, "date_end": date_end, "farming_plot_id": farming_plot_id},
				url: "/" + controlador + "/verify_new_estimate_sale",
				success: function (response) {
					console.log(response);
					if (response.status == "ok")
					{
						// fv.updateMessage(field, 'blank', response.fields[field]).updateStatus(field, 'INVALID', 'blank');
						run_option_result(response);
						//reset_errors("farming_plot_id");
						//reset_errors("type_of_crop_id");
						//reset_errors("date_init");
						//reset_errors("date_end");
					}
					else if (response.status == "existe")
					{
						run_option_result(response);
						//add_errors("farming_plot_id");
						//add_errors("type_of_crop_id");
						//add_errors("date_init");
						//add_errors("date_end");
					}
				},
				error: function (response) {
				},
				fail: function (response)
				{
					alert_sarah("Ocurrió un error en el servidor", "danger");
				}
			});
		}
	});
}

function run_option_result(response)
{
	var select = $("#estimate_sale_type_of_crop_id");
	select.html('');
	$.each(response.respuesta, function (i, item) {
		item = response.respuesta[i].name
		var value = response.respuesta[i].id
		select.append($("<option></option>").attr("value", value).text(item));
	});
}
