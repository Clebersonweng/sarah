var  COUNT  = 0;
var  TOTAL_FIXE_AND_VARIABLE  = 0;
var  TOTAL_FIXED  = 0;
var  TOTAL_VARIABLE  = 0;

$(document).ready(function () {
 
	controlador = $("#controller").val();
	generic_response_form(controlador);
	form_manu_indirect_expense_validates();
	$("#tb_manu_indi_expense").bootstrapTable();
	$("#form_manu_indi_expenses").bootstrapValidator();

	$("#btn_add_manu_indi_expense").on("click",function() 
	{
		var descr_expense         = $("#manu_indi_descr_expense").val();
		var type_expense          = $("#manu_indi_type_expense option:selected").text();
		var type_expense_id       = $("#manu_indi_type_expense option:selected").val();
		var amount                = $("#manu_indi_subtotal").val();

		if(typeof descr_expense != "undefined" || descr_expense != ""  && typeof amount != "undefined" || amount != "")
		{
			row_bt_manu_indi_expense(descr_expense,type_expense,type_expense_id,amount);
			COUNT++;   
		}
	});
	$('#tb_manu_indi_expense').on('check.bs.table', function (e, row) 
	{
			TOTAL_FIXE_AND_VARIABLE =  parseFloat($(".manu_indi_expe_total_fixed_and_variable").text());
			
			$fixe_to_delete = row.total_fixed; // tomo el elemento
			$value_fixe = $($fixe_to_delete).attr("value"); // agarro el valor para restar del total

			$variable_to_delete = row.total_variable;
			$value_variable = $($variable_to_delete).attr("value");
			
			//verify_type_expense(type_expense_id,amount,"new");

				$remove = $('.remove');
				selections = [];
				$remove.click(function () {
				//var ids = getIdSelections($('#tb_suppy_detail'));
				$('#tb_manu_indi_expense').bootstrapTable('remove', {
						field: 'id',
						values: [row.id]
					});
					$remove.prop('disabled', true);
					if(row.type_expense == "FIJO")
					{
						TOTAL_FIXED -= $value_fixe;   
					}
					else
					{
						TOTAL_VARIABLE -= $value_variable;
					}
					

					TOTAL_FIXE_AND_VARIABLE = TOTAL_FIXED + TOTAL_VARIABLE;
					$(".manu_indi_expe_total_fixed").text(TOTAL_FIXED.toFixed(0));
					$(".manu_indi_expe_total_variable").text(TOTAL_VARIABLE.toFixed(0));
					$(".manu_indi_expe_total_fixed_and_variable").text(TOTAL_FIXE_AND_VARIABLE.toFixed(0));
				});
	}); 

});

function row_bt_manu_indi_expense(descr_expense,type_expense,type_expense_id,amount)
{
	//TOTAL += parseFloat(amount);
	verify_type_expense(type_expense_id,amount,"new");
	TOTAL_FIXE_AND_VARIABLE = TOTAL_FIXED + TOTAL_VARIABLE;

	$(".manu_indi_expe_total_fixed").text(TOTAL_FIXED);
	$(".manu_indi_expe_total_variable").text(TOTAL_VARIABLE);
	$(".manu_indi_expe_total_fixed_and_variable").text(TOTAL_FIXE_AND_VARIABLE);

	var  _data_ =  {
							"id"                       : COUNT,
							"code"                     : COUNT,
							"descr_expense"            : descr_expense,   
							"descr_expense_id"         : "<input type='hidden' size='100' name='manu_indi_expense[manu_indi_expense_dets_attributes]["+COUNT+"][name]' value='"+descr_expense+"' >",   
							"type_expense"             : type_expense,   
							"type_expense_id"          : "<input type='hidden' size='20' name='manu_indi_expense[manu_indi_expense_dets_attributes]["+COUNT+"][isFixed]' value="+type_expense_id+">",  
							"subtotal"                 : amount,   
							"subtotal_id"              : "<input type='hidden' size='20' name='manu_indi_expense[manu_indi_expense_dets_attributes]["+COUNT+"][subtotal]' value="+TOTAL_FIXED+">",   
							"Action"                   : '<a class="remove  btn btn-danger delete btn-sm" title="Eliminar"><i class="fa fa-trash" aria-hidden="true"></i></a>',
						};
  


	$('#tb_manu_indi_expense').bootstrapTable("append", _data_);  
	$("#manu_indi_descr_expense").val("");
	$("#manu_indi_type_expense").val("1");
	$("#manu_indi_subtotal").val("");
}


function form_manu_indirect_expense_validates()
{
	$('#form_manu_indi_expenses').bootstrapValidator({
			framework: 'bootstrap',
			icon: {
			valid: 'glyphicon glyphicon-ok',
			invalid: 'glyphicon glyphicon-remove',
			validating: 'glyphicon glyphicon-refresh'
		},
		fields: 
		{
			'manu_indi_expense[total_fixed]': {
			  validators: {
				 notEmpty: {
					message: 'Este campo es obligatório'
				 }
			  }
			},
			'manu_indi_expense[total_variable]': {
			  validators: {
				 notEmpty: {
					message: 'Este campo es obligatório'
				 }
			  }
			},
			'manu_indi_expense[program_production_id]': {
				validators: {
				  stringLength: {
					 min: 1,
					 message: 'Este campo es obligatorio'
				  }
				}
			},
			'manu_indi[descr_expense]': 
			{
				validators: {
				  stringLength: {
					 min: 1,
					 message: 'Este campo es obligatorio'
				  }
				}
			},
			'manu_indi[type_expense]': 
			{
				validators: {
				  stringLength: {
					 min: 1,
					 message: 'Este campo es obligatorio'
				}
			 }
			},
			'manu_indi[subtotal]': 
			{
				validators: {
				  stringLength: {
					 min: 1,
					 message: 'Este campo es obligatorio'
				  }
				}
			}
		}

  })
  .on('init.field.fv', function (e, data) {
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

function verify_type_expense(type,amount,action)
{
	if(action == "new")
	{
		if(type == 1)
		{
			TOTAL_FIXED += parseFloat(amount);
		}
		else
		{
			TOTAL_VARIABLE += parseFloat(amount);
		}
	}
}





















