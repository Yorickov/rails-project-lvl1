# frozen_string_literal: true

require_relative 'tag_helpers/single_tag'
require_relative 'tag_helpers/pair_tag'

module HexletCode
  module TagHelpers
    def self.build(name, options = {}, &block)
      if block.nil?
        SingleTag.call(name, options)
      else
        PairTag.call(name, options, &block)
      end
    end
  end
end
