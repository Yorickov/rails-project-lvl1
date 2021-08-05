# frozen_string_literal: true

module HexletCode
  class Error < StandardError; end

  autoload :FormBuilder, 'hexlet_code/form_builder'
  autoload :Tags, 'hexlet_code/tags'
  autoload :Inputs, 'hexlet_code/inputs'
  autoload :Form, 'hexlet_code/form'

  class << self
    def form_for(record, options = {}, &block)
      validate!(record)

      form_builder = FormBuilder.new(record)
      Form.build(form_builder: form_builder, **options, &block)
    end

    private

    def validate!(record)
      raise ArgumentError, 'Record has wrong type' unless record.is_a? Struct
    end
  end
end
