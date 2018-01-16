# frozen_string_literal: true

require 'caze'

module OpenWeather
  module UseCases
    class Find
      include Caze

      export :call, as: :find

      def initialize(lat:, lon:, client: Client)
        @lat = lat
        @lon = lon
        @client = client
      end

      def call
        client.get(URI, lat: lat, lon: lon)
      end

      private

      URI = 'weather'

      attr_reader :lat, :lon, :client
    end
  end
end
