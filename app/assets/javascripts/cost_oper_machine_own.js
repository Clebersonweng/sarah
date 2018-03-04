
   var code = 1;
$(document).ready(function() 
{
   var count, sum,TOTAL = 0;
   var fuel,lubricant,repair_and_maintenance,time_oper = 0;
   var res_total_repair_machine,res_total_repair_implement,res_sum_repair_machine_implement,res_total_fuel,res_total_lub,res_total_hours = 0 ;
   
   controlador = $("#controller").val();
   generic_response_form(controlador,true);
   form_cost_oper_machine_own_validates();
    
   $('#bt_cost_oper_machine_own').bootstrapTable();
   $('#tb_cost_machine').bootstrapTable();               

   $("#btn_add_cost_own").on("click",function(e)
   { 
      var machine_id             = $("#cost_oper_own_machine_id option:selected").val();
      var machine_text           = $("#cost_oper_own_machine_id option:selected").text();
      var machine_price          = $("#cost_oper_own_machine_id option:selected").data("price");
      var machine_cons           = $("#cost_oper_own_machine_id option:selected").data("consumption");
      var machine_hp             = $("#cost_oper_own_machine_id option:selected").data("hp");
      var machine_rm             = $("#cost_oper_own_machine_id option:selected").data("coef_cccr");
      var fuel_price             = $("#cost_oper_own_machine_id option:selected").data("price_fuel");
      var machine_to             = $("#cost_oper_own_machine_id option:selected").data("time_oper"); //tiempo operativo hs/has
      var machine_type_machine   = $("#cost_oper_own_machine_id option:selected").data("type_machine"); //tiempo operativo hs/has

      var implement_id           = $("#cost_oper_own_implement_id option:selected").val();
      var implement_text         = $("#cost_oper_own_implement_id option:selected").text();
      var implement_price        = $("#cost_oper_own_implement_id option:selected").data("price");
      var implement_rm           = $("#cost_oper_own_implement_id option:selected").data("coef_cccr");
      var implement_to           = $("#cost_oper_own_implement_id option:selected").data("oper_time");
      var area                   = $("#cost_oper_machine_program_production_id").val();
      var amount                 = $("#cost_oper_machine_own_amount").val();
      new_row_dt(machine_text,implement_text,fuel_price,machine_price,machine_rm,implement_price,machine_hp,machine_cons,implement_rm,machine_to,implement_to,area,machine_id,implement_id,amount);
   });

   $("#cost_oper_own_machine_id").on("change",function(e)
   {
      var machine_type_machine   = $("#cost_oper_own_machine_id option:selected").data("type_machine"); //tipo de maquina para ocultar implemento

      if(typeof machine_type_machine != "undefined" && machine_type_machine == 1)
      {
        $("#cost_oper_own_implement_id").prop("disabled",false);
      }
      else
      {
        $("#cost_oper_own_implement_id").prop("disabled",true);
      }
   });

   $('#tb_cost_machine').on('check.bs.table', function (e, row) 
   {
     TOTAL =  parseFloat($("#oper_own_total").text());
      console.log(TOTAL);
         $remove = $('.remove');
         selections = [];
         $remove.click(function () {
         //var ids = getIdSelections($('#tb_suppy_detail'));
         $('#tb_cost_machine').bootstrapTable('remove', {
               field: 'id',
               values: [row.id]
            });
            $remove.prop('disabled', true);
            TOTAL -= row.subtotal;
            $("#oper_own_total").text(TOTAL.toFixed(0));
         });
   });
});


function new_row_dt(machine_text,implement_text,fuel_price,machine_price,machine_rm,implement_price,machine_hp,machine_cons,implement_rm,machine_to,implement_to,area,machine_id,implement_id,amount)
{
   // se calcula por horas para postior multiplicar por la cantidad de horas trabajadas
    res_total_repair_machine     = total_cost_repair_machine_per_hours(machine_price,machine_rm); //Rep y Mant valor a nuevo. * coefciente de mantenimiento
    res_total_repair_implement   = total_repair_implement_por_hours(implement_price, implement_rm);
   //sumatoria de gastos con reparacion y mantenimiento tanto de maquina como de implementos
    res_sum_repair_machine_implement = res_total_repair_machine + res_total_repair_implement;
   //gasto de combustible por hora maquina
    res_total_fuel               = cost_fuel_por_hours(fuel_price,machine_cons);
    res_total_lub                = total_lubricant(res_total_fuel);
   if(typeof machine_to != "undefined" && machine_to > 0)
   {     
      res_total_hours = quantity_hours_needed(machine_to,area);
   }
   else if(typeof implement_to != "undefined" && implement_to > 0)
   {
      res_total_hours   = quantity_hours_needed(implement_to,area);
   }

   var subtotal = (((res_total_fuel+res_total_lub+res_sum_repair_machine_implement) * res_total_hours).toFixed(0)) * amount;
   TOTAL += subtotal;
   $("#oper_own_total").text(TOTAL.toFixed(0));

   var  _row_ =      {
                        "id": code++,
                        "code": code++,
                        "machine": machine_text,   
                        "machine_id": "<input type='hidden' size='20' name='cost_oper_machine[cost_oper_machine_details_attributes]["+count+"][machine_id]' id='txt' value="+machine_id+">",
                        "implement": implement_text,  
                        "implement_id": "<input type='hidden' size='20' name='cost_oper_machine[cost_oper_machine_details_attributes]["+count+"][implement_id]' id='txt' value="+implement_id+">",  
                        "fuel": res_total_fuel,  
                        "fuel_id": "<input type='hidden' size='20' name='cost_oper_machine[cost_oper_machine_details_attributes]["+count+"][fuel]' id='txt' value="+res_total_fuel+">", 
                        "lubricant": res_total_lub,  
                        "lubricant_id": "<input type='hidden' size='20' name='cost_oper_machine[cost_oper_machine_details_attributes]["+count+"][lubricant]' id='txt' value="+res_total_lub+">",
                        "rep_and_maint": res_sum_repair_machine_implement,   
                        "rep_and_maint_id": "<input type='hidden' size='20' name='cost_oper_machine[cost_oper_machine_details_attributes]["+count+"][repair_and_maintenance]' id='txt' value="+res_sum_repair_machine_implement+">",  
                        "hours_needed": res_total_hours, 
                        "hours_needed_id": "<input type='hidden' size='20' name='cost_oper_machine[cost_oper_machine_details_attributes]["+count+"][hours_needed]' id='txt' value="+res_total_hours+">", 
                        "amount": amount,   
                        "amount_id": "<input type='hidden' size='20' name='cost_oper_machine[cost_oper_machine_details_attributes]["+count+"][amount]' id='txt' value="+amount+">", 
                        "subtotal": subtotal.toFixed(0),
                        "subtotal_val":  "<input type='hidden' size='20' name='cost_oper_machine[cost_oper_machine_details_attributes]["+count+"][subtotal]' id='txt' value="+subtotal.toFixed(0)+">",
                        "total":  "<input type='hidden' size='20' name='cost_oper_machine[total]' id='txt' value="+TOTAL.toFixed(0)+">",
                        "Action" : '<a class="remove  btn btn-danger delete btn-sm" title="Eliminar"><i class="fa fa-trash" aria-hidden="true"></i></a>'
                     };
  
   $('#tb_cost_machine').bootstrapTable("append", _row_);   
   $("#man_power_details_employee_id").val("");
   $("#man_power_details_type_of_work_id").val("");
   $("#cost_oper_machine_own_amount").val();
}


function total_lubricant(total_cost_fuel_per_hours)
{
   lubricant = (eval(total_cost_fuel_per_hours) * 12) / 100; // 12 % del total de combustible
   return lubricant;
}

function total_cost_repair_machine_per_hours(price_new,coef_cccr_machine)
{
   return eval(price_new) * eval(coef_cccr_machine);
}

function total_repair_implement_por_hours(price_new_implement, coef_cccr_implement) 
{
   var totalCostRepairImplPerHours;
   if(isNaN(price_new_implement) || isNaN(coef_cccr_implement))
   {
      totalCostRepairImplPerHours = 1;
   }
   else
   {
      totalCostRepairImplPerHours = eval(price_new_implement) * eval(coef_cccr_implement);
   }

   return totalCostRepairImplPerHours;
}

function cost_fuel_por_hours(fuel_price,consumption)
{
   var data    =    parseFloat(fuel_price) * parseFloat(consumption);
   return data;
}

function quantity_hours_needed(time_oper,area)
{
   return eval(time_oper) * eval(area);
}


function form_cost_oper_machine_own_validates()
{
  $('#form_cost_oper_machines').bootstrapValidator({
    excluded: [':disabled', ':hidden', ':not(:visible)'],
    fields: {
      "cost_oper_machine[program_production_id]": {
        validators: {
          notEmpty: {
            message: 'Este campo es obligatório! No creaste un programa de producción!'
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






