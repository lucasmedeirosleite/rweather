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
    it { expect(described_class).to respond_to(:find) }
    it { expect(described_class).to respond_to(:list) }
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

  describe 'integration' do
    before do
      described_class.configure do |config|
        config.api_key = ENV['OPEN_WEATHER_API_KEY']
        config.base_url = ENV['OPEN_WEATHER_BASE_URL']
      end
    end

    let(:lat) { -3.72 }
    let(:lon) { -38.52 }

    describe '.find' do
      subject(:find) do
        described_class.find(lat: lat, lon: lon)
      end

      it 'returns only one city' do
        VCR.use_cassette('open_weather/integration/find_location_weather') do
          expect(find).to be_success
          expect(find.status).to eq(200)
          expect(find.content).not_to be(Array)

          expect(find.content).to have_key('weather')
          expect(find.content).to have_key('name')
          expect(find.content).to have_key('sys')
        end
      end
    end

    describe '.list' do
      subject(:list) do
        described_class.list(lat: lat, lon: lon)
      end

      it 'returns a collection of cities' do
        VCR.use_cassette('open_weather/integration/list_cities_weathers_around_location') do
          expect(list).to be_success
          expect(list.status).to eq(200)
          expect(list.content['list']).to be_kind_of(Array)
        end
      end
    end
  end
end
