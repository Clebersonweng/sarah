ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  class_attr_index = html_tag.index('class="')
  first_tag_end_index = html_tag.index('>')

  if class_attr_index.nil? || first_tag_end_index > class_attr_index
    html_tag.insert(class_attr_index + 7, 'help-block ')
  else
    html_tag.insert(first_tag_end_index, ' class="help-block"')
  end
end
