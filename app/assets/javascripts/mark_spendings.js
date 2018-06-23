var  COUNT_MS 					= 0;
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

	$("#btn_add_row_ms").on("click",function() 
	{
		var descr_expense           = $("#mark_spend_descr").val();
		$type_expense                = $("#mark_spend_type_expense option:selected");
		var type_expense_descr		 = $type_expense.text();
		var type_expense_id			 = $type_expense.val();
		var subtotal      			 = $("#mark_spend_subtotal").val();
		if(is_valid_fields_ms())
		{
			row_table_ms(descr_expense,type_expense_id,type_expense_descr,subtotal);
			COUNT_MS++;   
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
		$('.remove').click(function () 
		{
			//var ids = getIdSelections($('#tb_suppy_detail'));
			$('#tb_structure_expense').bootstrapTable('remove', 
			{
			  field: 'id',
			  values: [row.id]
			});
			rest_type_expense_ms(row.type_expense,row.subtotal);
			$('.remove').prop('disabled', true);
      });
		
	}); 

});

function row_table_ms(descr_expense,type_expense_id,type_expense_descr,subtotal)
{
	
	TOTAL_MS += parseInt(subtotal);
	verify_type_expense_ms(type_expense_id,subtotal);
	
	$(".total").html(TOTAL_MS); // suma fijo y variable
	$("#total").val(TOTAL_MS); // suma fijo y variable

	var  _data_ = {
		"id"                       : COUNT_MS,
		"descr_expense"            : descr_expense,   
		"descr_expense_id"         : "<input type='hidden' size='100' name='mark_spending[mark_spending_dets_attributes]["+COUNT_MS+"][descr]' value='"+descr_expense+"' >",   
		"type_expense"             : type_expense_descr,  
		"type_expense_id"          : "<input type='hidden' size='20' name='mark_spending[mark_spending_dets_attributes]["+COUNT_MS+"][is_fixed]' value='"+type_expense_id+"' >",  
		"amount"                   : "<input type='hidden' size='20' name='mark_spending[mark_spending_dets_attributes]["+COUNT_MS+"][amount]' value='1' >",  
		"subtotal"                 : (subtotal),   
		"subtotal_id"              : "<input type='hidden' size='20' name='mark_spending[mark_spending_dets_attributes]["+COUNT_MS+"][subtotal]' value="+subtotal+">",   
		"Action"                   : '<a class="remove  btn btn-danger delete btn-sm" title="Eliminar"><i class="fa fa-trash" aria-hidden="true"></i></a>',
	};

	$('#table_MS').bootstrapTable("append", _data_);  
	$("#mark_spend_descr").val("");
	$("#mark_spend_type_expense").val("");
	$("#mark_spend_subtotal").val("");
}

function verify_type_expense_ms(type,subtotal)
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

function rest_type_expense_ms(type,subtotal)
{
	if(type == "FIJO")
	{
		TOTAL_FIXE_MS -= subtotal;
		TOTAL_MS = TOTAL_MS - subtotal;
		$(".total_fixed").text(TOTAL_FIXE_MS);
		$("#total_fixed").val(TOTAL_FIXE_MS);
		$(".total").text(TOTAL_MS); // suma fijo y variable
		$("#total").val(TOTAL_MS); // suma fijo y variable
	}
	else
	{
		TOTAL_VARIABLE_MS -= (subtotal);
		TOTAL_MS -= subtotal;
		$(".total_variable").text(TOTAL_VARIABLE_MS);
		$("#total_variable").val(TOTAL_VARIABLE_MS);
		$(".total").text(TOTAL_MS); // suma fijo y variable
		$("#total").val(TOTAL_MS); // suma fijo y variable
	}
}

function is_valid_fields_ms()
{
	$description            = $("#mark_spend_descr");
	$type_expense           = $("#mark_spend_type_expense");
	$subtotal               = $("#mark_spend_subtotal");

	if( $description.val() != "" && $type_expense.val() != "" && $subtotal.val() != "" )
	{
		return true;
	}
	else
	{
		return false;
	}
}
