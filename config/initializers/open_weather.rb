# frozen_string_literal: true

require 'open_weather'

OpenWeather.configure do |config|
  config.api_key = ENV['OPEN_WEATHER_API_KEY']
  config.base_url = ENV['OPEN_WEATHER_BASE_URL']
  config.default_unit = ENV['OPEN_WEATHER_DEFAULT_UNIT']
end
