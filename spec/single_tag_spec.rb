# frozen_string_literal: true

require "hexlet_code"

RSpec.describe HexletCode::Tag::SingleTag do
  let(:name) { "input" }
  let(:options) { { type: "submit", value: "Save", required: true } }

  subject { described_class.call(name, options) }

  context "without attrubutes" do
    let(:name) { "br" }
    let(:options) { {} }

    it "returns tag" do
      expected = "<br>"

      expect(subject).to eq expected
    end
  end

  context "with attrubutes" do
    it "returns tag with attrubutes" do
      expected = '<input type="submit" value="Save" required>'

      expect(subject).to eq expected
    end
  end
end
