# frozen_string_literal: true

module HexletCode
  class Error < StandardError; end

  autoload :FormBuilder, 'hexlet_code/form_builder'
  autoload :TagHelpers, 'hexlet_code/tag_helpers'
  autoload :Tags, 'hexlet_code/tags'

  class << self
    def form_for(record, options = {}, &block)
      validate!(record)

      form_builder = FormBuilder.new(record)
      Tags::Form.new(**options, form_builder: form_builder).call(&block)
    end

    private

    def validate!(record)
      raise ArgumentError, 'Record has wrong type' unless record.is_a? Struct
    end
  end
end
