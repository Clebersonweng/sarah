var  COUNT  					= 0;
var  TOTAL_MS	   			= 0;
var  TOTAL_FIXE_MS		   = 0;
var  TOTAL_VARIABLE_MS	   = 0;

$(document).ready(function () {
 
	 controlador 				= $("#controller").val();
	 var FIELD_FIXE_TOTAL 	= $("#total_fixed").val();
	 TOTAL_FIXE_MS			   = parseInt(FIELD_FIXE_TOTAL); // tomar valor en caso de edicion

	 var FIELD_V_TOTAL 		= $("#total_variable").val();
	 TOTAL_VARIABLE_MS		= parseInt(FIELD_V_TOTAL);// tomar valor en caso de edicion

	 var FIELD_TOTAL 			= $("#total").val();
	 TOTAL_MS			   	= parseInt(FIELD_TOTAL); // tomar valor en caso de edicion
	 
	generic_response_form(controlador);
	//$('#table_MS tfoot').hide();

	 $("#btn_add_row").on("click",function() 
	 {
			$descr_expense           = $("#mark_spend_descr").val();
			$type_expense            = $("#mark_spend_type_expense option:selected");
			$type_expense_descr		 = $type_expense.text();
			$type_expense_id			 = $type_expense.val();
			$subtotal                = $("#mark_spend_subtotal").val();
			if(is_valid_fields())
			{
				row_table($descr_expense,$type_expense_id,$type_expense_descr,$subtotal);
				//$('#table_MS tfoot').show();
				COUNT++;   
			}
			else
			{
				$('form').bootstrapValidator('revalidateField', 'mark_spend[descr]');
				$('form').bootstrapValidator('revalidateField', 'mark_spend[type_expense]');
				$('form').bootstrapValidator('revalidateField', 'mark_spend[subtotal]');
			}
	 });

	$('#tb_structure_expense').on('check.bs.table', function (e, row) 
	{
		 TOTAL_MS =  parseFloat($(".manu_indi_expe_total_fixed_and_variable").text());
		 
		 $fixe_to_delete = row.total_fixed; // tomo el elemento
		 $value_fixe = $($fixe_to_delete).attr("value"); // agarro el valor para restar del total

		 $variable_to_delete = row.total_variable;
		 $value_variable = $($variable_to_delete).attr("value");
		 
		 //verify_type_expense(type_expense_id,amount,"new");

				$remove = $('.remove');
				selections = [];
		 $remove.click(function () {
				//var ids = getIdSelections($('#tb_suppy_detail'));
				$('#tb_manu_indi_expense').bootstrapTable('remove', 
				{
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

function row_table(descr_expense,type_expense_id,type_expense_descr,subtotal)
{
	
	TOTAL_MS += parseInt(subtotal);
	verify_type_expense(type_expense_id,subtotal);
	
	$(".total").html(TOTAL_MS); // suma fijo y variable
	$("#total").val(TOTAL_MS); // suma fijo y variable

	var  _data_ = {
						"id"                       : COUNT,
						"descr_expense"            : descr_expense,   
						"descr_expense_id"         : "<input type='hidden' size='100' name='mark_spending[mark_spending_dets_attributes]["+COUNT+"][descr]' value='"+descr_expense+"' >",   
						"type_expense"             : type_expense_descr,  
						"type_expense_id"          : "<input type='hidden' size='20' name='mark_spending[mark_spending_dets_attributes]["+COUNT+"][is_fixed]' value='0' >",  
						"amount"                   : "<input type='hidden' size='20' name='mark_spending[mark_spending_dets_attributes]["+COUNT+"][amount]' value='1' >",  
						"subtotal"                 : subtotal,   
						"subtotal_id"              : "<input type='hidden' size='20' name='mark_spending[mark_spending_dets_attributes]["+COUNT+"][subtotal]' value="+subtotal+">",   
						"Action"                   : '<a class="remove  btn btn-danger delete btn-sm" title="Eliminar"><i class="fa fa-trash" aria-hidden="true"></i></a>',
					};

	$('#table_MS').bootstrapTable("append", _data_);  
	$("#mark_spend_descr").val("");
	$("#mark_spend_type_expense").val("");
	$("#mark_spend_subtotal").val("");
}

function verify_type_expense(type,subtotal)
{
	if(type == 1)
	{
		TOTAL_FIXE_MS += parseFloat(subtotal);
		$(".total_fixed").text(TOTAL_FIXE_MS);
		$("#total_fixed").val(TOTAL_FIXE_MS);
	}
	else
	{
		TOTAL_VARIABLE_MS += parseFloat(subtotal);
		$(".total_variable").text(TOTAL_VARIABLE_MS);
		$("#total_variable").val(TOTAL_VARIABLE_MS);
	}
}

function is_valid_fields()
{
	 $description            = $("#mark_spend_descr");
	 $type_expense           = $("#mark_spend_type_expense");
	 $subtotal               = $("#struc_expense_subtotal");

	 if(typeof $description != "undefined" && $description.val() != "" && typeof $type_expense != "undefined" && $type_expense.val() != ""  && typeof $subtotal != "undefined" && $type_expense.val() != "" )
	 {
			return true;
	 }
	 else
	 {
			return false;
	 }
}
		