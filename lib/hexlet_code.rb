# frozen_string_literal: true

require_relative "hexlet_code/version"
require_relative "hexlet_code/tag"
require_relative "hexlet_code/form_builder"

module HexletCode
  class Error < StandardError; end

  class << self
    def form_for(record, options = {})
      validate!(record)
      # TODO: add option method?
      action = options.fetch(:url, "#")

      Tag.build("form", action: action, method: "post") do
        builder = FormBuilder.new(record)
        yield builder
        builder.output
      end
    end

    private

    def validate!(record)
      raise ArgumentError, "Record has wrong type" unless record.is_a? Struct
    end
  end
end
