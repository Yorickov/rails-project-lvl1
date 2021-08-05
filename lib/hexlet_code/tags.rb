# frozen_string_literal: true

require_relative 'tags/single_tag'
require_relative 'tags/pair_tag'

module HexletCode
  module Tags
    def self.build(name, options = {}, &block)
      if block.nil?
        SingleTag.call(name, options)
      else
        PairTag.call(name, options, &block)
      end
    end
  end
end
