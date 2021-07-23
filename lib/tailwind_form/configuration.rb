module TailwindForm
  class Configuration
    attr_accessor :form_label_classes
    attr_accessor :form_input_classes
    attr_accessor :form_group_classes
    attr_accessor :form_input_group_classes

    def initialize
      @form_label_classes = ''
      @form_input_classes = ''
      @form_group_classes = ''
      @form_input_group_classes = ''
    end
  end
end