# frozen_string_literal: true

require_relative "base"

module HexletCode
  module Tag
    class SingleTag < Base
      def call
        "<#{name}#{attributes}>"
      end
    end
  end
end
