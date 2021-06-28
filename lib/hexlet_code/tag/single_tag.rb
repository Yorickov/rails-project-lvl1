# frozen_string_literal: true

require_relative "base_tag"

module HexletCode
  module Tag
    class SingleTag < BaseTag
      def build
        "<#{name}#{attrubutes}>"
      end
    end
  end
end
