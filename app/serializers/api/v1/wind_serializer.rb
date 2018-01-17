# frozen_string_literal: true

module API
  module V1
    class WindSerializer < ActiveModel::Serializer
      attributes :speed, :direction
    end
  end
end
