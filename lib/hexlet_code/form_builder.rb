# frozen_string_literal: true

module HexletCode
  class FormBuilder
    def initialize(record)
      @record = record
    end

    def input
      ""
    end

    private

    attr_reader :record
  end
end
