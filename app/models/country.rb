# frozen_string_literal: true

class Country < ApplicationRecord
  has_many :cities

  validates :acronym, presence: true, uniqueness: true
end
