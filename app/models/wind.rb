class Wind < ApplicationRecord
  belongs_to :forecast

  validates :speed, :direction, presence: true, numericality: true
end
