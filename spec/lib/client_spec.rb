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

    let(:url) { 'weather' }
    let(:params) do
      { lat: -3.72, lon: -38.52 }
    end

    context 'when base_url invalid' do
      let(:base_url) { 'http://www.google.com' }

      it 'does not succeeds' do
        VCR.use_cassette('client/not_found_get_from_base_url') do
          response = get_data

          expect(response).not_to be_success
          expect(response.status).to eq(404)
        end
      end
    end

    context 'when api_key invalid' do
      let(:api_key) { 'invalid-key' }

      it 'does not succeeds' do
        VCR.use_cassette('client/unauthorized_get') do
          response = get_data

          expect(response).not_to be_success
          expect(response.status).to eq(401)
        end
      end
    end

    context 'when uri invalid' do
      let(:url) { 'invalid-resource' }

      it 'does not succeeds' do
        VCR.use_cassette('client/not_found_get_from_uri') do
          response = get_data

          expect(response).not_to be_success
          expect(response.status).to eq(404)
        end
      end
    end

    context 'when valid request' do
      it 'succeeds' do
        VCR.use_cassette('client/success_get') do
          response = get_data

          expect(response).to be_success
          expect(response.status).to eq(200)
          expect(response.content).to be_present
        end
      end
    end
  end
end
