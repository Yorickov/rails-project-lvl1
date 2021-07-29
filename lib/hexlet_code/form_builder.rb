# frozen_string_literal: true

module HexletCode
  class FormBuilder
    def initialize(record)
      @record = record
      @body = ''
    end

    def input(name, options = {})
      value = record[name] || ''

      field_type = options.fetch(:as, :input)
      field_body = constantinize(field_type).call(**options, name: name, value: value)
      label_body = Tags::Label.call(**options, name: name)

      self.body += [label_body, field_body].join
    end

    def submit(value = nil, options = {})
      self.body += Tags::SubmitInput.call(**options, value: value)
    end

    private

    attr_reader :record
    attr_accessor :body

    def constantinize(string)
      Tags.const_get(string.capitalize)
    end
  end
end
