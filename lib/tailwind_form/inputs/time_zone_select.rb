# frozen_string_literal: true

module TailwindForm
  module Inputs
    module TimeZoneSelect
      extend ActiveSupport::Concern
      include Base

      included do
        tailwind_field(:time_zone_select)
      end
    end
  end
end
