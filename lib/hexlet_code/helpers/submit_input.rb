# frozen_string_literal: true

require_relative 'base'

module HexletCode
  module Helpers
    class SubmitInput < Base
      TAG_NAME = 'input'
      TAG_TYPE = 'submit'
      DEFAULT_NAME = 'commit'
      DEFAULT_VALUE = 'Save'

      def call
        value = options[:value] || DEFAULT_VALUE
        builder.build(TAG_NAME, type: TAG_TYPE, name: DEFAULT_NAME, value: value, **html_options)
      end
    end
  end
end