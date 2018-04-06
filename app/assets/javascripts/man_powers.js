var code_man_power        = 0;
var total_hours_needed    = 0;
var COUNT                 = 0;

$(document).ready( function() 
{

   controlador = $("#controller").val();
   generic_response_form(controlador,true);
   form_man_power_validates();
   var TOTAL= 0;

      $("#btn_man_power").on("click",function() 
      {
         var type_work_id         = $("#man_power_details_type_of_work_id option:selected").val();
         var type_work            = $("#man_power_details_type_of_work_id option:selected").text();
         var salary               = $("#man_power_details_type_of_work_id option:selected").data("salary");
         var employee_id          = $("#man_power_details_employee_id option:selected").val();
         var employee             = $("#man_power_details_employee_id option:selected").text();
         var hours_needed          = $("#hours_needed").val();
         //$('#tb_man_power').bootstrapTable("append", row_bt_cost_out());
          row_bt_man_power(type_work_id,type_work,employee_id,employee,hours_needed,salary);
          COUNT++;
      });

      $('#tb_man_power').on('check.bs.table', function (e, row) 
      {
           TOTAL =  parseFloat($("#man_powers_total").text());
               $remove = $('.remove');
               selections = [];
               $remove.click(function () {
               //var ids = getIdSelections($('#tb_suppy_detail'));
               $('#tb_man_power').bootstrapTable('remove', {
                     field: 'id',
                     values: [row.id]
                  });
                  $remove.prop('disabled', true);
                  TOTAL -= row.subtotal;
                  $("#man_powers_total").text(TOTAL.toFixed(0));
               });
      }); 
});

function row_bt_man_power(type_work_id,type_work,employee_id,employee,hours_needed,salary)
{ 
   
   var subtotal = (salary * hours_needed);
   TOTAL += subtotal;
   total_hours_needed += hours_needed;
   $("#man_powers_total").text(TOTAL);

      

   var  _data_ =  {
                     "id": code_man_power,
                     "code": code_man_power,
                     "employee": employee,   
                     "employee_id": "<input type='hidden' size='20' name='man_power[man_power_details_attributes]["+COUNT+"][person_id]' id='txt' value="+employee_id+">",  
                     "type_of_work": type_work,   
                     "type_of_work_id":   "<input type='hidden' size='20' name='man_power[man_power_details_attributes]["+COUNT+"][type_of_work_id]' id='txt' value="+type_work_id+">",   
                     "salary": salary,   
                     "hours_needed": hours_needed,  //horas necesaria de trabajo para este tipo de servicio y este empleado
                     "hours_needed_id":   "<input type='hidden' size='20' name='man_power[man_power_details_attributes]["+COUNT+"][hours_needed]' id='txt2' value="+hours_needed+'>',  
                     "total_hours_needed":   "<input type='hidden' size='20' name='man_power[total_hours_needed]' id='txt2' value="+total_hours_needed+'>',  //total horas necesarias para la labor de todos los funcionarios durante el periodo
                     "subtotal": subtotal.toFixed(0),
                     "subtotal_id": "<input type='hidden' size='20' name='man_power[man_power_details_attributes]["+COUNT+"][subtotal]' id='txt2' value="+subtotal.toFixed(0)+'>',
                     "total":  "<input type='hidden' size='20' name='man_power[total]' id='txt' value="+TOTAL.toFixed(0)+">",
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
      "man_power[hours_needed]": 
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
    //$("#form_products").bootstrapValidator('revalidateField', 'investments');
  });
}


