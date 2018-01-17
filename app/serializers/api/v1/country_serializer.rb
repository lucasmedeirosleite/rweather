# frozen_string_literal: true

module API
  module V1
    class CountrySerializer < ActiveModel::Serializer
      attributes :acronym
    end
  end
end
