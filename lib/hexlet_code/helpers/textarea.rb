# frozen_string_literal: true

require_relative 'base'

module HexletCode
  module Helpers
    class Textarea < Base
      TAG_NAME = 'textarea'
      DEFAULT_HTML_OPTIONS = { cols: 20, rows: 40 }.freeze

      def call
        normalized_html_options = DEFAULT_HTML_OPTIONS.merge(html_options)

        builder.build(TAG_NAME, **options.slice(:name), **normalized_html_options) { options[:value] }
      end
    end
  end
end