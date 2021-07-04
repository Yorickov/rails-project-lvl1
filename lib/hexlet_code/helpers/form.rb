# frozen_string_literal: true

require_relative 'base'

module HexletCode
  module Helpers
    class Form < Base
      TAG_NAME = 'form'

      def initialize(form_builder:, **options)
        super(**options)

        @form_builder = form_builder
      end

      def call
        method = options.fetch(:method, 'post')
        action = options.fetch(:url, '#')

        builder.build(TAG_NAME, action: action, method: method) do
          yield form_builder
          form_builder.output
        end
      end

      private

      attr_reader :form_builder
    end
  end
end
