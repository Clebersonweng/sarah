var codigo = 0;
var count = 0;
$(document).ready(function ()
{
  
  controlador = $("#controller").val();   
  generic_response_form(controlador);
  form_supplies_validates();

  $('#tb_suppy_detail').bootstrapTable({
          height : 300,
          formatNoMatches: function () {
              return "No cuenta con insumos agregado";
          }, 
          "data-show-footer": true
  });

  $('#add_product').click(function (e) {
      event.preventDefault();
    $('#tb_suppy_detail').bootstrapTable("append", generate_row_dt());
    //addNuevasFilas ("supply_detail","", subtotal.toFixed(2));//agrego cada fila    
  });

  $("#supply_detail_product").on("change",function (e) {
      event.preventDefault();
      progress(true);
         product_val = $("#supply_detail_product option:selected").val();
         $.ajax({
            type: "POST",
            dataType: 'JSON',
            data: {"product_id": product_val},
            url: "/" + controlador + "/calculate_subtotal",
            success: function (response) {
               if (response.status == "ok")
               {
                  
               }
              },
            error: function (response) 
              {

              },
            fail: function (response)
              {
                alert_sarah("Ocurrió un error en el servidor", "danger");
              }
         });      
      enabled_button_add_row('add_product');
    
  });

});

function generate_row_dt()
{ 
    var id = 0;
    var product_id      =  $("#supply_detail_product option:selected").val();
    var product         =  $("#supply_detail_product option:selected").text();
    var price           =  $("#supply_detail_product option:selected").data("price");
    var dosage          =  $("#supply_detail_product option:selected").data("dosage");
    var area            =  $("#farming_plot_area").val();
    var quantity_need   =  area * dosage
    var subtotal        =  price * quantity_need;

    addNewRow(product_id,quantity_need.toFixed(2), subtotal.toFixed(2));

    var mydata = {
          "id": codigo++,
          "product_id": product,
          "price": price,
          "dosage": dosage,
          "quantity_need": quantity_need.toFixed(2) ,          
          "subtotal": subtotal.toFixed(2) 
      };

      return mydata;
}

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
        "<input type='text' size='20' name='supply[supply_details_attributes]["+count+"][product_id]' id='txt_0' value="+product_id+">"+
        "<input type='text' size='20' name='supply[supply_details_attributes]["+count+"][quantity_needed]' id='txt_1' value="+quantity+">"+
        "<input type='text' size='20' name='supply[supply_details_attributes]["+count+"][subtotal]' id='txt_2' value="+subtotal+">"    
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



