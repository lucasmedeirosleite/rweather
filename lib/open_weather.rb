# frozen_string_literal: true

# frozen_string_literal

require 'caze'

require_relative './open_weather/client'
require_relative './open_weather/use_cases/find'
require_relative './open_weather/use_cases/list'

module OpenWeather
  include Caze

  has_use_case :find, UseCases::Find
  has_use_case :list, UseCases::List

  Error = Class.new(RuntimeError).freeze

  class << self
    attr_reader :api_key, :base_url
    attr_accessor :default_unit

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
