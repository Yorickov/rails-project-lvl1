# frozen_string_literal: true

require_relative "helpers"

module HexletCode
  class FormBuilder
    TYPES = {
      string: Helpers::TextInput,
      text: Helpers::Textarea,
      select: Helpers::Select
    }.freeze

    def initialize(record)
      @record = record
      @inputs = []
    end

    def input(name, options = {})
      value = record[name] || ""

      type = options.fetch(:as, :string)
      helper = TYPES[type]

      inputs << helper.call(name, value, options.except(:as, :html), options.fetch(:html, {}))
    end

    def output
      inputs.join
    end

    private

    attr_reader :record, :inputs
  end
end
