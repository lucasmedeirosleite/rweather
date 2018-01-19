# frozen_string_literal: true

require 'caze'

module OpenWeather
  module UseCases
    class Find
      include Caze

      export :call, as: :find

      def initialize(term:, client: Client.new)
        @term=term
        @client = client
      end

      def call
        client.get(URI, params: { q: term })
      end

      private

      URI = 'weather'

      attr_reader :term, :client
    end
  end
end
