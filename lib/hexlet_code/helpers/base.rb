# frozen_string_literal: true

require_relative '../tag'

module HexletCode
  module Helpers
    SERVICE_OPTIONS = %i[method url name value as collection].freeze

    class Base
      def self.call(*args)
        new(*args).call
      end

      def initialize(options = {})
        @builder = Tag
        @service_options, @html_options =
          options.partition { |key, _value| SERVICE_OPTIONS.include?(key) }.map(&:to_h)
      end

      protected

      attr_reader :builder, :service_options, :html_options
    end
  end
end
