# frozen_string_literal: true

RSpec.describe HexletCode do
  it "has a version number" do
    expect(HexletCode::VERSION).not_to be nil
  end

  describe "#form_for" do
    let(:options) { { url: "/users" } }
    let(:user) { nil }

    context "without options" do
      it "returns form with empty action" do
        expected = '<form action="#" method="post"></form>'

        expect(described_class.form_for(user) { "" }).to eq expected
      end
    end

    context "with options" do
      it "returns form with url action" do
        expected = '<form action="/users" method="post"></form>'

        expect(described_class.form_for(user, options) { "" }).to eq expected
      end
    end
  end
end
