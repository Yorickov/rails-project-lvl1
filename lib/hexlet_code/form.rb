# frozen_string_literal: true

module HexletCode
  module Form
    NAME = 'form'

    module_function

    def build(form_builder:, **options)
      method = options.fetch(:method, 'post')
      action = options.fetch(:url, '#')

      Tags.build(NAME, action: action, method: method) { yield form_builder }
    end
  end
end
