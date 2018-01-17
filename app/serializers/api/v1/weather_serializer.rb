# frozen_string_literal: true

module API
  module V1
    class WeatherSerializer < ActiveModel::Serializer
      attributes :main, :description, :visibility, :clouds
    end
  end
end
