# frozen_string_literal: true

module ModelsHelper
  def bootstrap_city(city: 'Fortaleza', country: 'BR', lat: -3.72, lon: -38.52, date: Time.now.utc)
    country = FactoryBot.create(:country, acronym: country)
    city = FactoryBot.create(:city, name: city, country: country)
    FactoryBot.create(:coordinate, latitude: lat, longitude: lon, city: city)
    forecast = FactoryBot.create(:forecast, date: date, city: city)
    FactoryBot.create(:wind, forecast: forecast)
    FactoryBot.create(:weather, forecast: forecast)
    FactoryBot.create(:temperature, forecast: forecast)
    city
  end
end
