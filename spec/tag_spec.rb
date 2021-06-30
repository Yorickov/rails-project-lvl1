# frozen_string_literal: true

require "hexlet_code"

RSpec.describe HexletCode::Tag do
  let(:name) { "input" }
  let(:options) { { type: "submit" } }
  let(:body) { proc { "Email" } }

  context "when no block passed" do
    it "SingleTag is called" do
      expect(described_class::SingleTag)
        .to receive(:call)
        .with(name, options)
        .and_call_original

      described_class.build(name, options)
    end
  end

  context "when block passed" do
    it "PairTag is called" do
      expect(described_class::PairTag)
        .to receive(:call)
        .with(name, options) do |&block|
          expect(block).to be(body)
        end
        .and_call_original

      described_class.build(name, options, &body)
    end
  end
end
