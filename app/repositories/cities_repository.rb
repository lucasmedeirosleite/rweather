# frozen_string_literal: true

class CitiesRepository
  def initialize(data_source: City)
    @data_source = data_source
  end

  def find(name:)
    data_source
      .includes(:country)
      .includes(:coordinate)
      .includes(forecasts: %i[wind weather temperature])
      .where('name LIKE :name', name: "%#{name}%")
      .where('forecasts.date >= ?', 1.hour.ago)
      .order('forecasts.date DESC')
      .limit(1)
      .first
  end

  private

  attr_reader :data_source
end
