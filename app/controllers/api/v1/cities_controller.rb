# frozen_string_literal: true

module API
  module V1
    class CitiesController < APIController
      def search
        result = find_forecast

        case result.status
        when :found
          render json: result.data, status: :ok
        when :not_found
          render json: { message: 'City not found' }, status: result.status
        end
      end

      def random
        result = ListRandomForecasts.new.call
        render json: result.data, status: :ok
      end

      private

      def find_forecast
        FindCityForecast.new.call(lat: params[:lat], lon: params[:lon])
      end
    end
  end
end
