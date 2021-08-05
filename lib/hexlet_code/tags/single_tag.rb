# frozen_string_literal: true

require_relative 'base'

module HexletCode
  module Tags
    class SingleTag < Base
      def call
        "<#{name}#{attributes}>"
      end
    end
  end
end
