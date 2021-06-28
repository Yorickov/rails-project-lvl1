# frozen_string_literal: true

require "hexlet_code"

RSpec.describe HexletCode::Tag::SingleTag do
  let(:name) { "input" }
  let(:options) { { type: "submit", value: "Save" } }

  subject { described_class.new(name, options) }

  context "without attrubutes" do
    let(:name) { "br" }
    let(:options) { {} }

    it "returns tag" do
      expected = "<br>"

      expect(subject.build).to eq expected
    end
  end

  context "with attrubutes" do
    it "returns tag with attrubutes" do
      expected = '<input type="submit" value="Save">'

      expect(subject.build).to eq expected
    end
  end
end
