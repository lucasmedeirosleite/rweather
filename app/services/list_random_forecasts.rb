# frozen_string_literal: true

class ListRandomForecasts
  Response = Struct.new(:status, :data)

  def initialize(client: OpenWeather)
    @client = client
  end

  def call
    response = client.list(lat: random_latitude, lon: random_longitude)
    return Response.new(:not_found, []) unless response.success?

    cities = response.content['list'].map { |city_data| convert_to_model(city_data) }

    Response.new(:found, cities)
  end

  private

  attr_reader :client

  def random_latitude
    rand(0.00...63.00)
  end

  def random_longitude
    rand(-30.00...60.00)
  end

  def convert_to_model(line)
    city = City.new(name: line['name'])
    city.build_coordinate(latitude: line['coord']['lat'],
                          longitude: line['coord']['lon'])

    forecast = Forecast.new(date: Time.at(line['dt']).utc)

    forecast.build_wind(speed: line['wind']['speed'],
                        direction: line['wind']['deg'])

    forecast.build_weather(main: line['weather'][0]['main'],
                           description: line['weather'][0]['description'],
                           clouds: line['clouds']['all'])

    forecast.build_temperature(value: line['main']['temp'],
                               pressure: line['main']['pressure'],
                               humidity: line['main']['humidity'],
                               min: line['main']['temp_min'],
                               max: line['main']['temp_max'])

    city.forecasts << forecast

    city
  end
end
