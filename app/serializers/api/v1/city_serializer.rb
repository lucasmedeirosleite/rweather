# frozen_string_literal: true

module API
  module V1
    class CitySerializer < ActiveModel::Serializer
      attributes :name
      has_one :country
      has_one :coordinate
      has_many :forecasts
    end
  end
end
