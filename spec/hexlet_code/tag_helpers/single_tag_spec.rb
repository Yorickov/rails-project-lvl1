# frozen_string_literal: true

require 'spec_helper'

RSpec.describe HexletCode::TagHelpers::SingleTag do
  subject(:result) { described_class.call(name, options) }

  let(:name) { 'input' }
  let(:options) { { type: 'submit', value: 'Save', required: true } }

  context 'without attrubutes' do
    let(:name) { 'br' }
    let(:options) { {} }

    it 'returns tag' do
      expected = '<br>'

      expect(result).to eq expected
    end
  end

  context 'with attrubutes' do
    it 'returns tag with attrubutes' do
      expected = '<input type="submit" value="Save" required>'

      expect(result).to eq expected
    end
  end
end
