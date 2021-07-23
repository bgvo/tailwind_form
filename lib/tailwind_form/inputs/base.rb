# frozen_string_literal: true

module TailwindForm
  module Inputs
    module Base
      extend ActiveSupport::Concern

      class_methods do
        def tailwind_field(field_name, &block)
            define_method "#{field_name}_with_tailwind" do |*args, &block|
            @template.content_tag :div, class: TailwindForm.configuration.form_input_group_classes do
              name = args[0]
              options = args[1..-1]
              send(field_name, name, *options, &block)
            end
          end
        end
      end
    end
  end
end
