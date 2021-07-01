# frozen_string_literal: true

module HexletCode
  module Helpers
    module TextInput
      TAG_NAME = "input"
      TAG_TYPE = "text"

      def self.call(name, value, _options, html_options)
        Tag.build(TAG_NAME, type: TAG_TYPE, name: name, value: value, **html_options)
      end
    end
  end
end
