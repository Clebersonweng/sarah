
$(document).ready(function ()
{
    controlador = $("#controller").val();
    form_farming_plot_validates();
});

function form_farming_plot_validates()
{
    $('#form_farming_plot').bootstrapValidator({
        framework: 'bootstrap',
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            'farming_plot[name]': {
                validators: {
                    notEmpty: {
                        message: 'Este campo es obligatorio'
                    },
                    stringLength: {
                        min: 1,
                        max: 9,
                        message: 'El campo debe contener entre 1 y 9 numeros'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9 ]+$/,
                        message: 'Debe contener numeros y letras'
                    }
                }
            },
            'farming_plot[area]': {
                validators: {
                    notEmpty: {
                        message: 'Este campo es obligatorio'
                    },
                    stringLength: {
                        min: 1,
                        max: 9,
                        message: 'El campo debe contener entre 1 y 9 numeros'
                    },
                    regexp: {
                        regexp: /^[0-9.]+$/,
                        message: 'Debe contener solamente numeros'
                    }
                }
            },
            'farming_plot[person_id]': {
                validators: {
                    notEmpty: {
                        message: 'Este campo es obligatorio'
                    }
                }
            }

        }
    });

}