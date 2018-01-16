# frozen_string_literal: true

require 'rails_helper'
require 'open_weather'

RSpec.describe OpenWeather do
  describe 'fields' do
    it { is_expected.to respond_to(:api_key) }
    it { is_expected.to respond_to(:base_url) }
  end

  describe 'api' do
    it { expect(described_class).to respond_to(:configure) }
  end

  describe '.configure' do
    subject(:configure) do
      described_class.configure do |config|
        config.api_key = api_key
        config.base_url = base_url
      end
    end

    let(:api_key) { 'api-key' }
    let(:base_url) { 'base-url' }

    context 'with valid configuration' do
      it 'configures the module properly' do
        configure

        expect(described_class.api_key).to eq(api_key)
        expect(described_class.base_url).to eq(base_url)
      end
    end

    context 'with invalid configuration' do
      context 'when api key nil' do
        let(:api_key) { nil }

        it 'warns api key is invalid' do
          expect {
            configure
          }.to raise_error(described_class::Error).with_message('API Key is invalid')
        end
      end

      context 'when base url is invalid' do
        let(:base_url) { nil }

        it 'warns base url is invalid' do
          expect {
            configure
        }.to raise_error(described_class::Error).with_message('Base URL is invalid')
        end
      end
    end
  end
end
