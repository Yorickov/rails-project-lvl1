# frozen_string_literal: true

require_relative "helpers"

module HexletCode
  class FormBuilder
    INPUT_TYPES = {
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
      helper = INPUT_TYPES[type].call(**options.except(:as), name: name, value: value)
      label = Helpers::Label.call(**options.except(:as), name: name)

      inputs << [label, helper].join
    end

    def output
      inputs.join
    end

    def submit(value = nil, options = {})
      inputs << Helpers::SubmitInput.call(**options, value: value)
    end

    private

    attr_reader :record, :inputs
  end
end
