# frozen_string_literal: true

require_relative '../tag'

module HexletCode
  module Helpers
    class Base
      def self.call(*args)
        new(*args).call
      end

      def initialize(options = {})
        @builder = Tag
        @options = options.except(:html)
        @html_options = options.fetch(:html, {})
      end

      protected

      attr_reader :builder, :options, :html_options
    end
  end
end
