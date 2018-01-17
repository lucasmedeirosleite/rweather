# frozen_string_literal: true

module API
  module V1
    class ForecastSerializer < ActiveModel::Serializer
      attributes :date
      has_one :wind
      has_one :weather
      has_one :temperature

      def date
        object.date.strftime('%Y-%m-%d %H:%M:%S')
      end
    end
  end
end
