# frozen_string_literal: true

require_relative 'base'

module HexletCode
  module Helpers
    class TextInput < Base
      TAG_NAME = 'input'
      TAG_TYPE = 'text'

      def call
        builder.build(TAG_NAME, type: TAG_TYPE, **service_options.slice(:name, :value), **html_options)
      end
    end
  end
end
