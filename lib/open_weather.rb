# frozen_string_literal

require_relative './open_weather/client'

module OpenWeather
  Error = Class.new(RuntimeError).freeze

  class << self
    attr_reader :api_key, :base_url

    def configure
      yield self
    end

    def api_key=(api_key)
      raise Error, 'API Key is invalid' unless api_key
      @api_key = api_key
    end

    def base_url=(base_url)
      raise Error, 'Base URL is invalid' unless base_url
      @base_url = base_url
    end
  end
end
