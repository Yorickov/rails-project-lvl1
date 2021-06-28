# frozen_string_literal: true

require_relative "tag/single_tag"
require_relative "tag/pair_tag"

module HexletCode
  module Tag
    module_function

    def build(name, options = {}, &block)
      if block_given?
        PairTag.new(name, options, &block).build
      else
        SingleTag.new(name, options).build
      end
    end
  end
end
