# frozen_string_literal: true

class City < ApplicationRecord
  validates :name, presence: true

  has_one :coordinate, dependent: :destroy
  has_many :forecasts, dependent: :destroy
  belongs_to :country

  def new_forecast?(date:)
    return true if new_record?
    current_forecast.date != date
  end

  def current_forecast
    ForecastDelegator.new(forecasts.last)
  end
end

class ForecastDelegator < SimpleDelegator
  def date
    return 3.years.ago if __getobj__.nil?
    __getobj__.date
  end
end
