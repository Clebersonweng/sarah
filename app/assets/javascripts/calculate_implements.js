
$(document)
.ready(
    function() {
    var width=0;
    var velocity=0;
    var hectare = 10000; /**un hectarea consiste en 10000 m2*/
    var cte = 0;  /*capacidad de trabajo efectiva**/
    var to = 0; /**tiempo operativo*/
    var meterPerKm = 1000; /**cantidad de metros que contiene un kilometro*/
    var timeOperative;
    $('#velocity').on("focusout",function(event){
        width = $("#width").val();
        velocity = $("#velocity").val();
        cte = (width * velocity * meterPerKm)/hectare;
        cte.toFixed(4);
        to = 1/cte;
        timeOperative = to.toFixed(4);
        $("#implement_oper_time").val(timeOperative);
     });

    /**limpiar los campos cargados al hacer click en salir*/
    $('#exit').on("click",function(event){
        $("#velocity").val("");
        $("#width").val("");
        $("#implement_oper_time").val("");
    });

    $('#openBtn').click("click",function(event){
        event.preventDefault();
	$('#myModal').modal({show:true})
    });

    $('#machine_consumption').popover({ 
        html : true,
        title: "This is a test",
        content: "<b>hello popover world</b>"
      }).popover('show');

});
