# frozen_string_literal: true

class Temperature < ApplicationRecord
  belongs_to :forecast

  validates :min,
            :max,
            :value,
            :pressure,
            :humidity,
            presence: true,
            numericality: true
end
