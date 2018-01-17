# frozen_string_literal: true

module API
  module V1
    class CoordinateSerializer < ActiveModel::Serializer
      attributes :latitude, :longitude
    end
  end
end
