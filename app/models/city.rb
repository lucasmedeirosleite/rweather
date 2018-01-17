# frozen_string_literal: true

class City < ApplicationRecord
  validates :name, presence: true

  has_one :coordinate, dependent: :destroy
  has_many :forecasts, dependent: :destroy
  belongs_to :country
end
