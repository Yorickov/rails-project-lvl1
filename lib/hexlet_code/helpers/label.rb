# frozen_string_literal: true

require_relative 'base'

module HexletCode
  module Helpers
    class Label < Base
      TAG_NAME = 'label'

      def call
        name = options[:name]
        builder.build(TAG_NAME, for: name, **html_options) { name.to_s.capitalize }
      end
    end
  end
end
