# frozen_string_literal: true

require_relative 'base'

module HexletCode
  module Tags
    class Form < Base
      TAG_NAME = 'form'

      def initialize(form_builder:, **options)
        super(**options)

        @form_builder = form_builder
      end

      def call
        method = service_options.fetch(:method, 'post')
        action = service_options.fetch(:url, '#')

        build_tag(action: action, method: method) { yield form_builder }
      end

      private

      attr_reader :form_builder
    end
  end
end
