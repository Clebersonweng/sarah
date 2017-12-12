var codigo = 1;
var count = 0;
var product_id;     
var total = 0.0;
var subtotal ;
$(document).ready(function ()
{
  
  controlador = $("#controller").val();   
  generic_response_form(controlador);
  form_supplies_validates();

   $('#tb_suppy_detail').bootstrapTable({
      formatNoMatches: function () {
         return "No cuenta con insumos agregado";
      }
   });

   $('#supply_detail_product').on("change",function (e) 
   {
      enabled_button_add_row("add_product");
   });

  $('#add_product').click(function (e) {
      event.preventDefault();

      $('#tb_suppy_detail').bootstrapTable("append", generate_row_dt());
      product_id          =  $("#supply_detail_product option:selected").val();
      //var data            = "product_id="+product_id;
      //generate_row_bt("calculate_subtotal",data);
      //generate_row_dt();
  });
  
  if(typeof controlador != "undefined" && controlador == "supplies")
  {
      call_view_data_farm_plot("calculate_subtotal",""); 
  }
  

});

function generate_row_dt()
{ 
   var _data_;
    product_id          =  $("#supply_detail_product option:selected").val();
    var product         =  $("#supply_detail_product option:selected").text();
    var price           =  $("#supply_detail_product option:selected").data("price");
    var dosage          =  $("#supply_detail_product option:selected").data("dosage");
    var area            =  $("#farm_area").val();
    var quantity_need   =  area * dosage
    subtotal            =  price * quantity_need;
    total               += subtotal;
    $("#supplies_total").text(total.toFixed(0));
    $("#supply_total").val(total.toFixed(0));
    addNewRow(product_id,quantity_need.toFixed(2), subtotal.toFixed(2));

     _data_ = {
                  "id": "0"+codigo++,
                  "product": product,
                  "price": price,
                  "dosage": dosage,
                  "quantity_need": quantity_need.toFixed(2) ,          
                  "subtotal": subtotal.toFixed(2),
                  "Action" : '<a class="remove  btn btn-danger delete btn-sm" onclick="delete_row_table(this)" title="Eliminar"><i class="fa fa-trash" aria-hidden="true"></i></a>',
               };
      return _data_;
}

function delete_row_table(evt)
{
   total = 0.0;
   $(evt).parent().parent().remove().fadeOut();
   $("#tb_suppy_detail tbody tr").each(function(indice,valor) {
      var subtotal = parseFloat($(this).find("td:eq(5)").html());
      console.log(parseFloat(subtotal));
      if (!isNaN(subtotal))
      {
         total           += subtotal;
      }
   });
   $("#supplies_total").text(total);
   $("#supply_total").val(total);
}


function call_view_data_farm_plot(path,data)
{   
      $.ajax({
         type: "POST",
         dataType: 'JSON',
         data: data,
         url: "/" + controlador + "/"+path,
         success: function (response) {
             $("#farm_name").val(response["0"].farm_name) ;
             $("#farm_area").val(response["0"].farm_area) ;
             $("#farm_prog_total_production").val(response["0"].prog_total_production);  
         },
         error: function (response) 
         {
            alert_sarah("Ocurrió un error al calcular el subtotal de insumos para este producto", "danger");    
         },
         fail: function (response)
         {
            alert_sarah(response.msg, "danger");
         }
      });          
}


/*function generate_row_bt(path,data)
{   
      progress(true);
      $.ajax({
         type: "POST",
         dataType: 'JSON',
         data: data,
         url: "/" + controlador + "/"+path,
         success: function (response) {
            
               $.each( response, function( key, value ) {
                 
                  var mydata = {
                         "id": "00"+codigo++,
                         "area": response[key].area,
                         "product_descr": response[key].product_descr,
                         "price_product": response[key].price_product,
                         "dosage": response[key].dosage,
                         "quantity_needed": response[key].quantity_needed,          
                         "subtotal": response[key].subtotal 
                  };
                  $('#tb_suppy_detail').bootstrapTable("append", mydata);
               
               });  
         },
         error: function (response) 
         {
            alert_sarah("Ocurrió un error al calcular el subtotal de insumos para este producto", "danger");    
         },
         fail: function (response)
         {
             alert_sarah(response.msg, "danger");
         }
      });          
}*/

function enabled_button_add_row(id)
{
  if($("#supply_detail_product").val() != "")
  {
    $("#"+id).removeClass("disabled");
  }
  else
  {
    $("#"+id).addClass("disabled");
  }
  
}

function addNewRow(product_id,quantity, subtotal) {
  count++;
      $("#addRow").append(
        "<input type='hidden' size='20' name='supply[supply_details_attributes]["+count+"][product_id]' id='txt_0' value="+product_id+">"+
        "<input type='hidden' size='20' name='supply[supply_details_attributes]["+count+"][quantity_needed]' id='txt_1' value="+quantity+">"+
        "<input type='hidden' size='20' name='supply[supply_details_attributes]["+count+"][subtotal]' id='txt_2' value="+subtotal+">"    
        );
}

function form_supplies_validates()
{
  $('#form_supplies').bootstrapValidator({
    excluded: [':disabled', ':hidden', ':not(:visible)'],
    fields: {
      "supply[program_production_id]": {
        validators: {
          notEmpty: {
            message: 'Este campo es obligatório! No creaste un programa de producción!'
          },
          stringLength: {
            min: 3,
            max: 30,
            message: 'El campo debe '
          },
          regexp: {
            regexp: /^[0-9_ ]+$/,
            message: 'Debe contener valores reales de la producción'
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



