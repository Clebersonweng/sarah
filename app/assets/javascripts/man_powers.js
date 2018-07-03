var TOTAL_HOURS_NEEDED_MP     = 0;
var COUNT_MP                  = 0;
var TOTAL_MP				      = 0;
var SUBTOTAL_MP			      = 0;  
$(document).ready( function() 
{

  var FIELD_HN_TOTAL     = $("#total_hours_needed").val();
  TOTAL_HOURS_NEEDED_MP  = parseFloat(FIELD_HN_TOTAL);// tomar valor en caso de edicion

  var FIELD_TOTAL       = $("#total").val();
  TOTAL_MP              = parseFloat(FIELD_TOTAL); // tomar valor en caso de edicion

   controlador = $("#controller").val();
   generic_response_form(controlador,true);
   form_man_power_validates();

   $("#btn_man_power").on("click",function() 
   {
   	if(is_valid_fields_mp())
   	{
	      var type_work_id         = $("#man_power_details_type_of_work_id option:selected").val();
	      var type_work            = $("#man_power_details_type_of_work_id option:selected").text();
	      var salary               = $("#man_power_details_type_of_work_id option:selected").data("salary");
	      var employee_id          = $("#man_power_details_employee_id option:selected").val();
	      var employee             = $("#man_power_details_employee_id option:selected").text();
	      var hours_needed         = $("#hours_needed").val();
   	
      	row_man_power(type_work_id,type_work,employee_id,employee,hours_needed,salary);
      	COUNT_MP++;
      }
      else
      {
         $('form').bootstrapValidator('revalidateField', 'man_power_details[employee_id]');
         $('form').bootstrapValidator('revalidateField', 'man_power_details[type_of_work_id]');
         $('form').bootstrapValidator('revalidateField', 'man_power_details[hours_needed]');
      }
   });

   $('#tb_man_power').on('check.bs.table', function (e, row)
   {
      //TOTAL_MP =  parseFloat($("#man_powers_total").text());
      $('.remove').on("click",function () {
	      $('#tb_man_power').bootstrapTable('remove', {
	            field: 'id',
	            values: [row.id]
         });
         $remove.prop('disabled', true);
         TOTAL_MP -= row.subtotal;
         $("#total").text(TOTAL_MP);
         $(".total_hours_needed").val(TOTAL_HOURS_NEEDED_MP);

      });
   }); 
});


function row_man_power(type_work_id,type_work,employee_id,employee,hours_needed,salary)
{ 
   
   SUBTOTAL_MP 				= parseFloat(salary) * parseFloat(hours_needed);
   calc_totals_mp(SUBTOTAL_MP,hours_needed);
      

   var  _data_ =  {
                     "id": COUNT_MP,
                     "employee": employee,   
                     "employee_id": "<input type='hidden' size='20' name='man_power[man_power_details_attributes]["+COUNT_MP+"][person_id]' id='txt' value="+employee_id+">",  
                     "type_of_work": type_work,   
                     "type_of_work_id":   "<input type='hidden' size='20' name='man_power[man_power_details_attributes]["+COUNT_MP+"][type_of_work_id]' id='txt' value="+type_work_id+">",   
                     "salary": set_numeric(parseInt(salary)),
                     "hours_needed": hours_needed,  //horas necesaria de trabajo para este tipo de servicio y este empleado
                     "hours_needed_id":   "<input type='hidden' size='20' name='man_power[man_power_details_attributes]["+COUNT_MP+"][hours_needed]' id='txt2' value="+hours_needed+'>',  
                     "subtotal": SUBTOTAL_MP.toFixed(0),
                     "subtotal_id": "<input type='hidden' size='20' name='man_power[man_power_details_attributes]["+COUNT_MP+"][subtotal]' id='txt2' value="+SUBTOTAL_MP.toFixed(0)+'>',
                     "Action" : '<a class="remove  btn btn-danger delete btn-sm" title="Eliminar"><i class="fa fa-trash" aria-hidden="true"></i></a>',
                  };

   $('#tb_man_power').bootstrapTable("append", _data_);   
   $("#man_power_details_employee_id").val("");
   $("#man_power_details_type_of_work_id").val("");
}

function form_man_power_validates()
{
  $('#form_man_powers').bootstrapValidator({
      excluded: [':disabled', ':hidden', ':not(:visible)'],
      fields: {
               "man_power[total_hours_needed]": 
               {
                 validators: {
                   notEmpty: {
                     message: 'Necesita cargar la cantidad de horas!'
                   }
                 }
               }
               ,"man_power[total]": 
               {
                 validators: {
                   notEmpty: {
                     message: 'Necesita cargar la cantidad de horas!'
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

calc_totals_mp = function(subtotal,hours)
{
   TOTAL_MP                += subtotal;
   TOTAL_HOURS_NEEDED_MP   += parseFloat(hours);

   $(".total").text(TOTAL_MP); 
   $(".total_hours_needed").text(TOTAL_HOURS_NEEDED_MP); 
   $("#total").val(TOTAL_MP); 
   $("#total_hours_needed").val(TOTAL_HOURS_NEEDED_MP); 
}

function is_valid_fields_mp()
{
   $employee     		 = $("#man_power_details_employee_id");
   $type_of_work     = $("#man_power_details_type_of_work_id");
   $hours_needed     = $("#hours_needed");

   if(typeof $employee != "undefined" && $employee.val() != "" && typeof $type_of_work != "undefined" && $type_of_work.val() != "" && typeof $hours_needed != "undefined" && $hours_needed.val() != "" )
   {
      return true;
   }
   else
   {
      return false;
   }

}
