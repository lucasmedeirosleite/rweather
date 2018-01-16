# frozen_string_literal: true

require 'caze'

module OpenWeather
  module UseCases
    class List
      include Caze

      export :call, as: :list

      def initialize(lat:, lon:, count: 10, client: Client.new)
        @lat = lat
        @lon = lon
        @count = count
        @client = client
      end

      def call
        client.get(URI, params: { lat: lat, lon: lon, cnt: count })
      end

      private

      URI = 'find'

      attr_reader :lat, :lon, :count, :client
    end
  end
end
