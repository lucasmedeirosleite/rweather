# frozen_string_literal: true

module API
  module V1
    class CitySerializer < ActiveModel::Serializer
      attributes :name, :forecast
      has_one :country
      has_one :coordinate

      def forecast
        ForecastSerializer.new(object.forecasts.first, root: false)
      end
    end
  end
end
