# frozen_string_literal: true

module TailwindForm
  module FormGroup
    extend ActiveSupport::Concern

    def form_group(name, field_type = :text_field, *options)
      function_name = "#{field_type}_with_tailwind"
      tag.div(class: TailwindForm.configuration.form_group_classes) do
        # options = process_options(field_type, options)
        tailwind_label_field(name) + send(function_name, name, *options)
      end
    end

    # Input options vary and should be treated specifically for different
    # fields. 
    def process_options(field_type, options)
      # case field_type
      # when :text_field
      # when :time_zone_select
      # end
      if !options.empty?
        option_hash = options.find {|o| o.class == Hash}
        options.delete option_hash 
        option_hash[:class] = TailwindForm.configuration.form_input_classes unless option_hash[:class]
        options << option_hash
        options
      else
        {class: TailwindForm.configuration.form_input_classes}
      end
    end
  end
end
