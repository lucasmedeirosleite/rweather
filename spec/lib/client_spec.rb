# frozen_string_literal: true

require 'rails_helper'
require 'open_weather'

describe OpenWeather::Client do
  subject(:client) { described_class.new(config: config) }

  let(:config) { double(:config, api_key: api_key, base_url: base_url) }
  let(:api_key) { ENV['OPEN_WEATHER_API_KEY'] }
  let(:base_url) { ENV['OPEN_WEATHER_BASE_URL'] }

  describe '#get' do
    subject(:get_data) { client.get(url, params: params) }

    let(:params) do
      { lat: -3.72, lon: -38.52 }
    end

    context 'when base_url invalid' do
      let(:base_url) { 'http://ivalid-weather.com' }
      let(:url) { "#{base_url}/weather" }

      it 'does not succeeds' do
        VCR.use_cassette('client/invalid_get') do
          expect(get_data).not_to be_success
        end
      end
    end

    context 'when api_key invalid' do
    end

    context 'when uri invalid' do
    end

    context 'when valid request' do
    end
  end
end
