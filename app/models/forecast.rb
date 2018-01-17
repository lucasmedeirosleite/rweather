class Forecast < ApplicationRecord
  belongs_to :city
  has_one :wind
  has_one :weather
  has_one :temperature

  validates :date, presence: true
end
