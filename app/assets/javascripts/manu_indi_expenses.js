var  COUNT_MIE  									= 0;
var  TOTAL_MIE  									= 0;
var  TOTAL_FIXED_MIE  							= 0;
var  TOTAL_VARIABLE_MIE  						= 0;

$(document).ready(function () {
 
	controlador 				= $("#controller").val();
	var FIELD_FIXE_TOTAL 	= $("#total_fixed").val();
	TOTAL_FIXED_MIE		   = parseInt(FIELD_FIXE_TOTAL); // tomar valor en caso de edicion

	var FIELD_V_TOTAL 		= $("#total_variable").val();
	TOTAL_VARIABLE_MIE			= parseInt(TOTAL_VARIABLE_MIE);// tomar valor en caso de edicion

	var FIELD_TOTAL 			= $("#total").val();
	TOTAL_MIE			   	= parseInt(FIELD_TOTAL); // tomar valor en caso de edicion


	generic_response_form(controlador);
	form_manu_indirect_expense_validates();
	$("#tb_manu_indi_expense").bootstrapTable();
	$("#form_manu_indi_expenses").bootstrapValidator();

	$("#btn_add_manu_indi_expense").on("click",function() 
	{
		if(is_valid_fields_mie())
		{
			var descr_expense         = $("#manu_indi_descr_expense").val();
			var type_expense          = $("#manu_indi_type_expense option:selected").text();
			var type_expense_id       = $("#manu_indi_type_expense option:selected").val();
			var amount                = $("#manu_indi_subtotal").val();

			row_bt_manu_indi_expense(descr_expense,type_expense,type_expense_id,amount);
			COUNT_MIE++;   
		}
		else
		{
         $('form').bootstrapValidator('revalidateField', 'manu_indi[descr_expense]');
         $('form').bootstrapValidator('revalidateField', 'manu_indi[type_expense]');
		}
		
	});

	$('#tb_manu_indi_expense').on('check.bs.table', function (e, row) 
	{
		$('.remove').click(function () 
		{
			//var ids = getIdSelections($('#tb_suppy_detail'));
			$('#tb_manu_indi_expense').bootstrapTable('remove', 
			{
			  field: 'id',
			  values: [row.id]
			});
			rest_type_expense_mie(row.type_expense,row.subtotal);
			$('.remove').prop('disabled', true);
      });
		
	}); 

});

function row_bt_manu_indi_expense(descr_expense,type_expense,type_expense_id,amount)
{
	TOTAL_MIE += parseFloat(amount);
	verify_type_expense_mie(type_expense_id,amount);
	
	$(".total").text(TOTAL_MIE);
	$("#total").val(TOTAL_MIE); // suma fijo y variable
	var  _data_ =  {
							"id"                       : COUNT_MIE,
							"code"                     : COUNT_MIE,
							"descr_expense"            : descr_expense,   
							"descr_expense_id"         : "<input type='hidden' size='100' name='manu_indi_expense[manu_indi_expense_dets_attributes]["+COUNT_MIE+"][name]' value='"+descr_expense+"' >",   
							"type_expense"             : type_expense,   
							"type_expense_id"          : "<input type='hidden' size='20' name='manu_indi_expense[manu_indi_expense_dets_attributes]["+COUNT_MIE+"][isFixed]' value="+type_expense_id+">",  
							"subtotal"                 : amount,   
							"subtotal_id"              : "<input type='hidden' size='20' name='manu_indi_expense[manu_indi_expense_dets_attributes]["+COUNT_MIE+"][subtotal]' value="+amount+">",   
							"Action"                   : '<a class="remove  btn btn-danger delete btn-sm" title="Eliminar"><i class="fa fa-trash" aria-hidden="true"></i></a>',
						};
  


	$('#tb_manu_indi_expense').bootstrapTable("append", _data_);  
	$("#manu_indi_descr_expense").val("");
	$("#manu_indi_type_expense").val(1);
	$("#manu_indi_subtotal").val("");
}

function verify_type_expense_mie(type,subtotal)
{
	if(type == 1)
	{
		TOTAL_FIXED_MIE += parseFloat(subtotal);
		$(".total_fixed").text(TOTAL_FIXED_MIE);
		$("#total_fixed").val(TOTAL_FIXED_MIE);
	}
	else
	{
		TOTAL_VARIABLE_MIE += parseFloat(subtotal);
		$(".total_variable").text(TOTAL_VARIABLE_MIE);
		$("#total_variable").val(TOTAL_VARIABLE_MIE);
	}
}

rest_type_expense_mie = function (type,subtotal)
{
	if(type == "FIJO")
	{
		TOTAL_FIXED_MIE -= subtotal;
		TOTAL_MIE = TOTAL_MIE - subtotal;
		$(".total_fixed").text(TOTAL_FIXED_MIE);
		$("#total_fixed").val(TOTAL_FIXED_MIE);
		$(".total").text(TOTAL_MIE); // suma fijo y variable
		$("#total").val(TOTAL_MIE); // suma fijo y variable
	}
	else
	{
		TOTAL_VARIABLE_MIE -= (subtotal);
		TOTAL_MIE -= subtotal;
		$(".total_variable").text(TOTAL_VARIABLE_MIE);
		$("#total_variable").val(TOTAL_VARIABLE_MIE);
		$(".total").text(TOTAL_MIE); // suma fijo y variable
		$("#total").val(TOTAL_MIE); // suma fijo y variable
	}
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


function is_valid_fields_mie()
{
   $description		     = $("#manu_indi_descr_expense");
   $type_expense		     = $("#manu_indi_type_expense");
   $amount                = $("#manu_indi_subtotal");

   if(typeof $description != "undefined" && $description.val() != "" && typeof $type_expense != "undefined" && $type_expense.val() != "" && typeof $amount != "undefined" && $amount.val() != "" )
   {
      return true;
   }
   else
   {
      return false;
   }
}
















