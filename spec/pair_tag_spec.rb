# frozen_string_literal: true

require "hexlet_code"

RSpec.describe HexletCode::Tag::PairTag do
  let(:name) { "label" }
  let(:options) { { for: "email", class: "form-label" } }
  let(:body) { proc { "Email" } }

  subject { described_class.new(name, options, &body) }

  context "without attrubutes" do
    let(:options) { {} }

    it "returns tag with body" do
      expected = "<label>Email</label>"

      expect(subject.build).to eq expected
    end
  end

  context "with attrubutes" do
    it "returns tag with attrubutes and body" do
      expected = '<label for="email" class="form-label">Email</label>'

      expect(subject.build).to eq expected
    end
  end
end
