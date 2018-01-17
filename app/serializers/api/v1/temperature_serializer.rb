# frozen_string_literal: true

module API
  module V1
    class TemperatureSerializer < ActiveModel::Serializer
      attributes :value, :min, :max, :pressure, :humidity
    end
  end
end
