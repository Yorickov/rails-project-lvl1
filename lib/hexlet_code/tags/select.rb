# frozen_string_literal: true

require_relative 'base'

module HexletCode
  module Tags
    class Select < Base
      TAG_NAME = 'select'
      TAG_OPTION_NAME = 'option'

      def call
        validate_options!

        build_tag(
          **service_options.slice(:name),
          **html_options
        ) { select_options(service_options[:collection]) }
      end

      private

      def select_options(collection)
        collection.map.with_index do |option_name, index|
          opts = { value: option_name }
          opts[:selected] = true if index.zero?

          build_tag(tag_name: TAG_OPTION_NAME, **opts) { option_name }
        end.join
      end

      def validate_options!
        raise HexletCode::Error, 'No options for select' unless service_options.key?(:collection)
      end
    end
  end
end
