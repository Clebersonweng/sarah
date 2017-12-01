$(document).ready(function () {
  controlador = $("#controller").val();
  //use for checkbox users to change value true or false
  $("input[type='checkbox']").on('change', function () {
    $(this).val(this.checked ? "TRUE" : "FALSE");
  })

  $(".alert_sarah").addClass('in').fadeIn(500).delay(3000).fadeOut(3000);
  controlador = $("#controller").val();   
});
