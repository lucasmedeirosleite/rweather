# frozen_string_literal: true

require 'open_weather'

class FindCityForecast
  Result = Struct.new(:status, :data)

  def initialize(client: OpenWeather, repository: CitiesRepository.new)
    @client = client
    @repository = repository
  end

  def call(lat:, lon:)
    city = repository.find(lat: lat, lon: lon)
    return Result.new(:found, city) if city.present?

    result = client.find(lat: lat, lon: lon)
    return Result.new(:not_found, nil) unless result.success?


    Result.new(:found, from_response(result.content))
  end

  private

  attr_reader :client, :repository

  def from_response(response)
    city = City.find_or_initialize_by(name: response['name'])

    return city unless city.new_forecast?(date: Time.at(response['dt']).utc)

    country = Country.find_or_initialize_by(acronym: response['sys']['country'])
    coordinate = Coordinate.find_or_initialize_by(latitude: response['coord']['lat'],
                                                  longitude: response['coord']['lon'])

    city.country = country
    city.coordinate = coordinate

    forecast = Forecast.new(date: Time.at(response['dt']).utc)

    forecast.build_wind(speed: response['wind']['speed'],
                        direction: response['wind']['deg'])

    forecast.build_temperature(min: response['main']['temp_min'],
                               max: response['main']['temp_max'],
                               value: response['main']['temp'],
                               pressure: response['main']['pressure'],
                               humidity: response['main']['humidity'])

    forecast.build_weather(main: response['weather'][0]['main'],
                           description: response['weather'][0]['description'],
                           visibility: response['visibility'],
                           clouds: response['clouds']['all'])

    city.forecasts << forecast

    city.save

    city.reload
  end
end
