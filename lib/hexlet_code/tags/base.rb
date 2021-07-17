# frozen_string_literal: true

module HexletCode
  module Tags
    SERVICE_OPTIONS = %i[method url name value as collection].freeze

    class Base
      def self.call(*args)
        new(*args).call
      end

      def initialize(options = {})
        @service_options, @html_options = setup_options(options)
      end

      protected

      attr_reader :builder, :service_options, :html_options

      def build_tag(tag_name: self.class::TAG_NAME, **kwargs, &block)
        TagHelpers.build(tag_name, kwargs, &block)
      end

      private

      def setup_options(options)
        options.partition { |key, _value| SERVICE_OPTIONS.include?(key) }.map(&:to_h)
      end
    end
  end
end
