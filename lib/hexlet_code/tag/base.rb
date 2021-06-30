# frozen_string_literal: true

module HexletCode
  module Tag
    class Base
      def self.call(...)
        new(...).call
      end

      def initialize(name, options = {})
        @name = name
        @options = options
        @body = yield if block_given?
      end

      protected

      attr_reader :name

      def attributes
        options.map do |key, value|
          value == true ? " #{key}" : " #{key}=\"#{value}\""
        end.join
      end

      private

      attr_reader :options
    end
  end
end
