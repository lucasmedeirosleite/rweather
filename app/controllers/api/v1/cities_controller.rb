# frozen_string_literal: true

module API
  module V1
    class CitiesController < APIController
      def search
        result = FindCityForecast.new.call(lat: params[:lat], lon: params[:lon])

        case result.status
        when :found
          render json: result.data, status: :ok
        when :not_found
          render json: { message: 'City not found' }, status: result.status
        end
      end

      def random
        result = ListRandomForecasts.new.call
        render json: result.data, root: false, status: :ok
      end
    end
  end
end
