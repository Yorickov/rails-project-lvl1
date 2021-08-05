# frozen_string_literal: true

require_relative 'base'

module HexletCode
  module Inputs
    class Input < Base
      NAME = 'input'
      TYPE = 'text'

      def call
        render(type: TYPE, **service_options.slice(:name, :value), **html_options)
      end
    end
  end
end
