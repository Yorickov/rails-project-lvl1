# frozen_string_literal: true

require 'spec_helper'

RSpec.describe HexletCode do
  it 'has a version number' do
    expect(HexletCode::VERSION).not_to be nil
  end

  describe '#form_for' do
    let(:url) { '/users' }
    let(:user) do
      Struct.new(:name, :job, :gender, keyword_init: true)
            .new(name: 'rob', job: 'hexlet', gender: 'm')
    end

    context 'when successfully called' do
      it 'returns form in html' do
        actual = described_class.form_for user, url: url do |f|
          f.input :name, class: 'user-input'
          f.input :job, as: :text
          f.input :gender, as: :select, collection: %w[m f]
          f.submit
        end

        expected =
          '<form action="/users" method="post">' \
          '<label for="name">Name</label>' \
          '<input type="text" name="name" value="rob" class="user-input">' \
          '<label for="job">Job</label>' \
          '<textarea name="job" cols="20" rows="40">hexlet</textarea>' \
          '<label for="gender">Gender</label>' \
          '<select name="gender">' \
          '<option value="m" selected>m</option>' \
          '<option value="f">f</option>' \
          '</select>' \
          '<input type="submit" name="commit" value="Save">' \
          '</form>'

        expect(actual).to eq expected
      end
    end

    context 'with errors' do
      it 'if record has wrong type' do
        expect { described_class.form_for({}) { '' } }
          .to raise_error ArgumentError, 'Record has wrong type'
      end

      it 'if there are no select options' do
        expect do
          described_class.form_for(user) { |f| f.input :gender, as: :select }
        end.to raise_error HexletCode::Error, 'No options for select'
      end
    end
  end
end
