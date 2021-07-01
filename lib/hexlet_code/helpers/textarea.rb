# frozen_string_literal: true

module HexletCode
  module Helpers
    module Textarea
      TAG_NAME = "textarea"
      DEFAULT_OPTIONS = { cols: 20, rows: 40 }.freeze

      def self.call(name, value, _options, html_options)
        normalized_html_options = DEFAULT_OPTIONS.merge(html_options)

        Tag.build(TAG_NAME, name: name, **normalized_html_options) { value }
      end
    end
  end
end
