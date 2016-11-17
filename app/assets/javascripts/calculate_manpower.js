
$(document)
.ready(
    function() {
      var count = 0; 
      var sum = 0;
      var idTypeOfWork;
      
      
      var idEmployee;
      var subtotal=0;
      var salary;
       $("#work_type_of_work_id").change(function(){ 
          idTypeOfWork = $("#work_type_of_work_id option:selected"); 
      });
      $("#emp_employee_id").change(function(){ 
          idEmployee = $("#emp_employee_id option:selected");
          salary = $("#emp_employee_id option:selected").data("salary");
      });



    var agregarProducto = function(idTypeOfWork, idEmployee, hoursNeeded,subtotal) {
        return "<tr>" + 
                    "<td>" + idTypeOfWork + "</td>" + 
                    "<td>" + idEmployee + "</td>" + 
                    "<td>" + hoursNeeded + "</td>" +
                     "<td class='subtotal'>" + subtotal + "</td>"+
                    "<td style='text-align: center'>"+ 
                    "<a href='#'" + "id='quitar'>" + 
                    "<i class='icon-minus'></i>" +  "</a>"+
                    "</td>"+ 
                 "</tr>";
            
            
        };

function addNuevasFilas02(id_type_work, id_employee,hours_needed,subtotal) {
					
 $("#addFilas").append(
"<input type='hidden' size='20' name='man_power[man_power_details_attributes]["+count+"][type_of_work_id]' id='txt' value="+id_type_work+">"+
"<input type='hidden' size='20' name='man_power[man_power_details_attributes]["+count+"][employee_id]' id='txt1' value="+id_employee+">"+
"<input type='hidden' size='20' name='man_power[man_power_details_attributes]["+count+"][hours_needed]' id='txt2' value="+hours_needed+'>'+
"<input type='hidden' size='20' name='man_power[man_power_details_attributes]["+count+"][subtotal]' id='txt2' value="+subtotal+'>');
}


var sumHours=0;
$("#agregarManoDeObra").on("click",function(event) {
         event.preventDefault();
          var tipoDeTrabajo = $("#work_type_of_work_id option:selected");
          var salario = $("#emp_employee_id option:selected").data("salary");
           var funcionario = $("#emp_employee_id option:selected");
          var hoursNeeded = $("#hours_needed").val();
           subtotal = parseFloat(salario) * parseFloat(hoursNeeded);
         
            var html = agregarProducto(tipoDeTrabajo.text(),funcionario.text(),hoursNeeded,subtotal);
                // carga los trs en la tabla
                $("#detalhes-container tbody:first").append(html);
                addNuevasFilas02(tipoDeTrabajo.val(),funcionario.val(),hoursNeeded,subtotal);
                // resetea los campos despues de  cada add
               

            //incrementa al agregar cada fila
            count++;
            sum+=subtotal;
            sumHours += parseInt(hoursNeeded);
            
           $("#man_power_total").val(sum); 
           $("#man_power_total_hours_needed").val(sumHours);
});
    
        








$("#quitar").on("click", function(event) {
    event.preventDefault();
     $(this).parent().parent().remove();
     alert("levante");
});
/**
   

                    // cierre de metodo
**/
});