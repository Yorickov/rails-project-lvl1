# frozen_string_literal: true

require_relative 'base'

module HexletCode
  module Tags
    class Text < Base
      TAG_NAME = 'textarea'
      DEFAULT_HTML_OPTIONS = { cols: 20, rows: 40 }.freeze

      def call
        normalized_html_options = DEFAULT_HTML_OPTIONS.merge(html_options)

        build_tag(**service_options.slice(:name), **normalized_html_options) { service_options[:value] }
      end
    end
  end
end
