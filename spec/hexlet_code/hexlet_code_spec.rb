# frozen_string_literal: true

require 'spec_helper'

# rubocop:disable Metrics/BlockLength
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

        expected_matcher = have_tag 'form', with: { action: '/users', method: 'post' } do
          with_tag 'label', with: { for: 'name' }, text: 'Name'
          with_tag 'input', with: { name: 'name', value: user.name, type: 'text', class: 'user-input' }
          with_tag 'label', with: { for: 'job' }, text: 'Job'
          with_tag 'textarea', with: { name: 'job', cols: 20, rows: 40 }, text: user.job
          with_select('gender') do
            with_option('m', selected: true)
            with_option('f')
          end
          with_tag 'input', with: { name: 'commit', type: 'submit', value: 'Save' }
        end

        expect(actual).to expected_matcher
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
# rubocop:enable Metrics/BlockLength
