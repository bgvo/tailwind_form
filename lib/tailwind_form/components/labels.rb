# frozen_string_literal: true

module TailwindForm
  module Components
    module Labels
      extend ActiveSupport::Concern

      private

        def tailwind_label_field(name)
          field_options = { class: TailwindForm.configuration.form_label_classes }
          label(name, field_options)
        end
    end
  end
end
