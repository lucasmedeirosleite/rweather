# frozen_string_literal: true

module OpenWeather
  class Client
    Response = Struct.new(:status, :response, :success?)

    def initialize(config: OpenWeather)
      @config = config
    end

    def get(uri, params: {})
      Response.new(nil, nil, false)
    end

    private

    attr_reader :config
  end
end
