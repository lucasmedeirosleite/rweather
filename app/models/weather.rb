# frozen_string_literal: true

class Weather < ApplicationRecord
  belongs_to :forecast

  validates :main, :clouds, :visibility, :description, presence: true

  validates_numericality_of :clouds, only_integer: true
  validates_numericality_of :visibility, only_integer: true
end
