$(document).ready(function ()
{
  controlador = $("#controller").val();   
  generic_response_form(controlador);
  form_people_validates();

});


function form_people_validates()
{
  $('#form_people').bootstrapValidator({
    excluded: [':disabled', ':hidden', ':not(:visible)'],
    fields: {
      "person[name]": {
        validators: {
          notEmpty: {
            message: 'Este campo es obligatório'
          },
          stringLength: {
            min: 3,
            max: 50,
            message: 'El nombre no puede ser menor que 3 y mayor que 50 caracteres'
          },
          regexp: {
            regexp: /^[a-zA-Z0-9_ ]+$/,
            message: 'El nombre debe consistir en caracteres alfanuméricos'
          }
        }
      },
      "person[lastname]": {
        validators: {
          notEmpty: {
            message: 'Este campo es obligatório'
          },
          stringLength: {
            min: 3,
            max: 50,
            message: 'El apellido no puede ser menor que 3 y mayor que 50 caracteres'
          },
          regexp: {
            regexp: /^[a-zA-Z]+$/,
            message: 'El área debe consistir en letras'
          }
        }
      },
      "person[phone]": {
        validators: {
          notEmpty: {
            message: 'Este campo es obligatório'
          },
          stringLength: {
            min: 1,
            max: 13,
            message: 'El nombre no puede ser menor que 6 y mayor que 13 caracteres'
          }
        }
      },
      "person[address]": {
        validators: {
          notEmpty: {
            message: 'Este campo es obligatório'
          },
          stringLength: {
            min: 3,
            max: 70,
            message: 'El nombre no puede ser menor que 3 y mayor que 70 caracteres'
          }
        }
      },
      "person[salary]": {
        validators: {
          notEmpty: {
            message: 'Este campo es obligatório'
          },
          stringLength: {
            min: 1,
            max: 30,
            message: 'El nombre no puede ser menor que 3 y mayor que 50 caracteres'
          },
          greaterThan: {
            value: 1,
            message: 'El campo debe contener un valor mayor que 0 !'
          },
          regexp: {
            regexp: /^[0-9.+]+$/,
            message: 'El teléfono debe contener el + y los números solamente'
          }
        }
      },
      "person[birthday]": {
        validators: {
          notEmpty: {
            message: 'Este campo es obligatório'
          },
          stringLength: {
            min: 1,
            max: 10,
            message: 'El nombre no puede ser menor que 3 y mayor que 50 caracteres'
          },
          regexp: {
            regexp: /^[0-9.]+$/,
            message: 'El cumpleaños debe tener solo números'
          }
        }
      },
      "person[gender]": {
        validators: {
          notEmpty: {
            message: 'Este campo es obligatório'
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
  });
}