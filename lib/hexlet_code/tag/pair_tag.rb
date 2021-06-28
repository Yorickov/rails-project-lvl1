# frozen_string_literal: true

require_relative "base_tag"

module HexletCode
  module Tag
    class PairTag < BaseTag
      def initialize(*args)
        super(*args)

        @body = yield
      end

      def build
        "<#{name}#{attrubutes}>#{body}</#{name}>"
      end

      private

      attr_reader :body
    end
  end
end
