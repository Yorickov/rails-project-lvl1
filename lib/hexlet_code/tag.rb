# frozen_string_literal: true

require_relative "tag/single_tag"
require_relative "tag/pair_tag"

module HexletCode
  module Tag
    def self.build(name, options = {}, &block)
      if block_given?
        PairTag.call(name, options, &block)
      else
        SingleTag.call(name, options)
      end
    end
  end
end
