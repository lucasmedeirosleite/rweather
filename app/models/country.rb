class Country < ApplicationRecord
  has_many :cities

  validates :acronym, presence: true, uniqueness: true
end
