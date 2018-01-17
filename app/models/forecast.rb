# frozen_string_literal: true

class Forecast < ApplicationRecord
  belongs_to :city
  has_one :wind, dependent: :destroy
  has_one :weather, dependent: :destroy
  has_one :temperature, dependent: :destroy

  validates :date, presence: true
end
