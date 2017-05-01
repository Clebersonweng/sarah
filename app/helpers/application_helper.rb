module ApplicationHelper

  

      #agregado para traer varios campos en el select
      def options_for_select(container, selected = nil)
        return container if String === container
        container = container.to_a if Hash === container
        selected, disabled = extract_selected_and_disabled(selected)

        options_for_select = container.inject([]) do |options, element|
          html_attributes = option_html_attributes(element)
          text, value = option_text_and_value(element)
          selected_attribute = ' selected="selected"' if option_value_selected?(value, selected)
          disabled_attribute = ' disabled="disabled"' if disabled && option_value_selected?(value, disabled)
          options << %(<option value="#{html_escape(value.to_s)}"#{selected_attribute}#{disabled_attribute}#{html_attributes}>#{html_escape(text.to_s)}</option>)
        end

        options_for_select.join("\n").html_safe
      end

      def option_text_and_value(option)
        # Options are [text, value] pairs or strings used for both.
        case
        when Array === option
          option = option.reject { |e| Hash === e }
          [option.first, option.last]
        when !option.is_a?(String) && option.respond_to?(:first) && option.respond_to?(:last)
          [option.first, option.last]
        else
          [option, option]
        end
      end

      def option_html_attributes(element)
        return "" unless Array === element
        html_attributes = []
        element.select { |e| Hash === e }.reduce({}, :merge).each do |k, v|
          html_attributes << " #{k}=\"#{ERB::Util.html_escape(v.to_s)}\""
        end
        html_attributes.join
      end
      #para la busqueda en index
      def sortable(column, title = nil)
        title ||= column.titleize
        css_class = column == sort_column ? "current #{sort_direction}" : nil
        direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
        link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
      end
      ##########################################################################################
      #helper para no repetir los codigos de los botones
     
    end
