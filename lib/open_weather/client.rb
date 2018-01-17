# frozen_string_literal: true

require 'httparty'

module OpenWeather
  class Client
    Response = Struct.new(:status, :content, :success?)

    def initialize(config: OpenWeather, http_client: HTTParty)
      @config = config
      @http_client = http_client
    end

    def get(uri, params: {})
      url = build_url(uri)
      params = build_query(params)

      response = HTTParty.get(url, params)
      code = response.code
      Response.new(response.code, response.parsed_response, code >= 200 && code < 400)
    end

    private

    attr_reader :config, :http_client
    delegate :base_url, :api_key, :default_unit, to: :config

    def build_url(uri)
      "#{base_url}/#{uri}"
    end

    def build_query(params = {})
      params = { appid: api_key }.merge(params)
      params.merge!({ units: default_unit }) if default_unit.present?
      { query: params }
    end
  end
end
