# frozen_string_literal: true

class CitiesRepository
  def initialize(data_source: City)
    @data_source = data_source
  end

  def find(lat:, lon:)
    one_hour_ago = (Time.now - 1.hour).utc

    data_source
      .includes(:country)
      .includes(:coordinate)
      .includes(forecasts: %i[wind weather temperature])
      .where(coordinates: { latitude: lat, longitude: lon })
      .where('forecasts.date >= ?', one_hour_ago)
      .first
  end

  private

  attr_reader :data_source
end
