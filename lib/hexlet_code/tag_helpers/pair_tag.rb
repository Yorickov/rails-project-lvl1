# frozen_string_literal: true

require_relative 'base'

module HexletCode
  module TagHelpers
    class PairTag < Base
      def call
        "<#{name}#{attributes}>#{body}</#{name}>"
      end

      private

      attr_reader :body
    end
  end
end
