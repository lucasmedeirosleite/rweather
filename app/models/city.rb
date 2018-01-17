# frozen_string_literal: true

class City < ApplicationRecord
  validates :name, presence: true

  has_one :coordinate
  has_many :forecasts
  belongs_to :country
end
