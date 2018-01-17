class Forecast < ApplicationRecord
  belongs_to :city

  validates :date, presence: true
end
