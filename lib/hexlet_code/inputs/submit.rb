# frozen_string_literal: true

require_relative 'base'

module HexletCode
  module Inputs
    class Submit < Base
      NAME = 'input'
      TYPE = 'submit'
      DEFAULT_NAME = 'commit'
      DEFAULT_VALUE = 'Save'

      def call
        value = service_options[:value] || DEFAULT_VALUE

        render(type: TYPE, name: DEFAULT_NAME, value: value, **html_options)
      end
    end
  end
end
