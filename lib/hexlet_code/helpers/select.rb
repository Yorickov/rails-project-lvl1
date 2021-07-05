# frozen_string_literal: true

require_relative 'base'

module HexletCode
  module Helpers
    class Select < Base
      TAG_SELECT_NAME = 'select'
      TAG_OPTION_NAME = 'option'

      def call
        validate!(service_options)

        builder.build(
          TAG_SELECT_NAME,
          **service_options.slice(:name),
          **html_options
        ) { select_options(service_options[:collection]) }
      end

      private

      def select_options(collection)
        collection.map.with_index do |option_name, index|
          opts = { value: option_name }
          opts[:selected] = true if index.zero?

          builder.build(TAG_OPTION_NAME, opts) { option_name }
        end.join
      end

      def validate!(options)
        raise HexletCode::Error, 'No options for select' unless options.key?(:collection)
      end
    end
  end
end
