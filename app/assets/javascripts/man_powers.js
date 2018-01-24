$(document)
.ready(
    function() {

      var count,sum,sumHours,subtotal=0;
      var idEmployee,salary;

      

      $("#man_power_details_type_of_work_id").on("change",function(){ 
          idTypeOfWork = $("#work_type_of_work_id option:selected"); 
      });

      $("#btn_man_power").on("click",function() {
         $('#tb_man_power').bootstrapTable("append", row_bt_cost_out());
         $("#man_power_total").val(sum); 
         $("#man_power_total_hours_needed").val(sumHours);
      });
    
 
});

function addNewRow(id_type_work, id_employee,hours_needed,subtotal) 
{
               
 $("#addFilas").append(
  "<input type='hidden' size='20' name='man_power[man_power_details_attributes]["+count+"][type_of_work_id]' id='txt' value="+id_type_work+">"+
  "<input type='hidden' size='20' name='man_power[man_power_details_attributes]["+count+"][employee_id]' id='txt1' value="+id_employee+">"+
  "<input type='hidden' size='20' name='man_power[man_power_details_attributes]["+count+"][hours_needed]' id='txt2' value="+hours_needed+'>'+
  "<input type='hidden' size='20' name='man_power[man_power_details_attributes]["+count+"][subtotal]' id='txt2' value="+subtotal+'>');
}



 function row_bt_man_power()
{ 
      var typework_id      = $("#work_type_of_work_id option:selected").val();
      var tipoDeTrabajo    = $("#work_type_of_work_id option:selected").text();
      var salario          = $("#man_power_details_employee_id option:selected").data("salary");
      var funcionario      = $("#man_power_details_employee_id option:selected");
      var hoursNeeded      = $("#hours_needed").val();
      subtotal             = parseFloat(salario) * parseFloat(hoursNeeded);

      

   var  _data_ =  {
                     "id": ++code_item,
                     "code": "00"+code_item,
                     "funcionario": funcionario,   
                     "type_of_service_id": tipoDeTrabajo,   
                     "salary": salario,   
                     "hoursNeeded": hoursNeeded,  
                     "subtotal": calculte_subtotal(u_measure,price,area,quantity),
                     "Action" : '<a class="remove  btn btn-danger delete btn-sm" title="Eliminar"><i class="fa fa-trash" aria-hidden="true"></i></a>',
                  };
   add_new_row ( typework_id, hoursNeeded, subtotal);//agrego cada fila
   return _data_ ;

}
