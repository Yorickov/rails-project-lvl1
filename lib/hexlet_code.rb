# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/form_builder'
require_relative 'hexlet_code/helpers'

module HexletCode
  class Error < StandardError; end

  class << self
    def form_for(record, options = {}, &block)
      validate!(record)

      form_builder = FormBuilder.new(record)
      Helpers::Form.new(**options, form_builder: form_builder).call(&block)
    end

    private

    def validate!(record)
      raise ArgumentError, 'Record has wrong type' unless record.is_a? Struct
    end
  end
end
