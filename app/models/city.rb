class City < ApplicationRecord
  validates :name, presence: true

  has_one :coordinate
end
