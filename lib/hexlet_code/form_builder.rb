# frozen_string_literal: true

require_relative 'helpers'

module HexletCode
  class FormBuilder
    INPUT_TYPES = {
      string: Helpers::TextInput,
      text: Helpers::Textarea,
      select: Helpers::Select
    }.freeze

    def initialize(record)
      @record = record
      @body = ''
    end

    def input(name, options = {})
      value = record[name] || ''

      type = options.fetch(:as, :string)
      helper = INPUT_TYPES[type].call(**options, name: name, value: value)
      label = Helpers::Label.call(**options, name: name)

      self.body += [label, helper].join
    end

    def submit(value = nil, options = {})
      self.body += Helpers::SubmitInput.call(**options, value: value)
    end

    private

    attr_reader :record
    attr_accessor :body
  end
end
