# frozen_string_literal: true

require "hexlet_code"

RSpec.describe HexletCode::Tag::PairTag do
  let(:name) { "label" }
  let(:options) { { for: "email", required: true, class: "form-label" } }
  let(:body) { proc { "Email" } }

  subject { described_class.call(name, options, &body) }

  context "without attrubutes" do
    let(:options) { {} }

    it "returns tag with body" do
      expected = "<label>Email</label>"

      expect(subject).to eq expected
    end
  end

  context "with attrubutes" do
    it "returns tag with attrubutes and body" do
      expected = '<label for="email" required class="form-label">Email</label>'

      expect(subject).to eq expected
    end
  end
end
