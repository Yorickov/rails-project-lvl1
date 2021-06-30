# frozen_string_literal: true

require_relative "hexlet_code/version"
require_relative "hexlet_code/tag"
require_relative "hexlet_code/form_builder"

module HexletCode
  class Error < StandardError; end

  def self.form_for(record, options = {})
    # TODO: add option method?
    action = options.fetch(:url, "#")

    Tag.build("form", { action: action, method: "post" }) do
      body = FormBuilder.new(record)
      yield body
    end
  end
end
