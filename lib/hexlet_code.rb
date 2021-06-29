# frozen_string_literal: true

require_relative "hexlet_code/version"
require_relative "hexlet_code/tag"

module HexletCode
  class Error < StandardError; end

  def self.form_for(_model, options = {}, &_block)
    action = options.fetch(:url, "#")
    Tag.build("form", { action: action, method: "post" }) { "" }
  end
end
