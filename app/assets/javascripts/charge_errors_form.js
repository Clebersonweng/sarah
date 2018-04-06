(function($) {

  $.fn.modal_success = function(){
    // close modal
    this.modal('hide');

    // clear form input elements
    // todo/note: handle textarea, select, etc
    this.find('form input[type="text"]').val('');

    // clear error state
    this.clear_previous_errors();
  };

  $.fn.render_form_errors = function(errors)
  {
    $form = this;
    this.clear_previous_errors();
    $model = this.data('model');
  		console.log($model);

    // show error messages in input form-group help-block
    $.each(errors, function(field, messages){
      $input = $('input[name="' + $model + '[' + field + ']"]');
      $input.closest('.form-group').addClass('has-error').find('.help-block').html( messages.join(' & ') );
    });

  };

  $.fn.clear_previous_errors = function(){
    $('.form-group.has-error', this).each(function(){
      $('.help-block', $(this)).html('');
      $(this).removeClass('has-error');
    });
  }

}(jQuery));




/*
$.fn.render_form_errors = function(model_name, errors) 
{  
	$form = this;
     //this.clear_form_errors(model_name, errors);
	$.each(errors,function (field, messages)
	{
		$input = form.find('input, select, textarea').filter({
			$name = $(this).attr('name')
			//name.match(new RegExp(model_name + '\\[' + field + '\\(?'));
		});
		input.closest('.form-group').addClass('has-error');
		input.parent().append('<span class="help-block">' + $.map(messages, (m) -> m.charAt(0).toUpperCase() + m.slice(1)).join('<br />') +  '</span>');
	};
}*/
