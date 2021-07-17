# frozen_string_literal: true

module HexletCode
  class FormBuilder
    INPUT_TYPES = {
      string: Tags::TextInput,
      text: Tags::Textarea,
      select: Tags::Select
    }.freeze

    def initialize(record)
      @record = record
      @body = ''
    end

    def input(name, options = {})
      value = record[name] || ''

      type = options.fetch(:as, :string)
      helper = INPUT_TYPES[type].call(**options, name: name, value: value)
      label = Tags::Label.call(**options, name: name)

      self.body += [label, helper].join
    end

    def submit(value = nil, options = {})
      self.body += Tags::SubmitInput.call(**options, value: value)
    end

    private

    attr_reader :record
    attr_accessor :body
  end
end
