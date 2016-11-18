$(document)
.ready(
    function() {
      //use for checkbox users to change value true or false
        $("input[type='checkbox']").on('change', function(){
          $(this).val(this.checked ? "TRUE" : "FALSE");
        })  
   
});
