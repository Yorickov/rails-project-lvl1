# frozen_string_literal: true

require_relative 'base'

module HexletCode
  module Inputs
    class Label < Base
      NAME = 'label'

      def call
        name = service_options[:name]

        render(for: name) { name.to_s.capitalize }
      end
    end
  end
end
