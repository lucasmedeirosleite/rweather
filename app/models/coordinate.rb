# frozen_string_literal: true

class Coordinate < ApplicationRecord
  belongs_to :city

  validates :latitude, :longitude, presence: true

  validates_numericality_of :latitude,
                            greater_than_or_equal_to: -90.000_000_000,
                            less_than_or_equal_to: 90.000_000_000

  validates_numericality_of :longitude,
                            greater_than_or_equal_to: -180.000_000_000,
                            less_than_or_equal_to: 180.000_000_000

  validates_uniqueness_of :longitude, scope: :latitude
end
