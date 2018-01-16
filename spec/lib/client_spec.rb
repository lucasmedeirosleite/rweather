# frozen_string_literal: true

require 'rails_helper'
require 'open_weather'

describe OpenWeather::Client do
  subject(:client) { described_class.new(config: config) }

  let(:config) { double(:config, api_key: api_key, base_url: base_url) }
  let(:api_key) { ENV['OPEN_WEATHER_API_KEY'] }
  let(:base_url) { ENV['OPEN_WEATHER_BASE_URL'] }

  describe '#get' do
    subject(:get_data) { client.get(url: uri, params: params) }

    context 'when base_url invalid' do
    end

    context 'when api_key invalid' do
    end

    context 'when uri invalid' do
    end

    context 'when valid request' do
    end
  end
end
