# frozen_string_literal: true

module HexletCode
  module Helpers
    module Select
      TAG_SELECT_NAME = "select"
      TAG_OPTION_NAME = "option"

      class << self
        def call(name, _value, options, html_options)
          validate!(options)

          Tag.build(TAG_SELECT_NAME, name: name, **html_options) { select_options(options) }
        end

        private

        def select_options(options)
          options[:collection].map.with_index do |option_name, index|
            opts = { value: option_name }
            opts[:selected] = true if index.zero?

            Tag.build(TAG_OPTION_NAME, opts) { option_name }
          end.join
        end

        def validate!(options)
          raise HexletCode::Error, "No options for select" unless options.key?(:collection)
        end
      end
    end
  end
end
