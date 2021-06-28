# frozen_string_literal: true

module HexletCode
  module Tag
    class BaseTag
      def initialize(name, options = {})
        @name = name
        @options = options
      end

      protected

      attr_reader :name

      def attrubutes
        options.map { |key, value| " #{key}=\"#{value}\"" }.join
      end

      private

      attr_reader :options
    end
  end
end
