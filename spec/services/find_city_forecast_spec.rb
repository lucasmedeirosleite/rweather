# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FindCityForecast, type: :service do
  subject(:service) { described_class.new }

  before { Timecop.freeze(now) }
  after { Timecop.return }

  describe '#call' do
    subject(:find) { service.call(name: name) }

    let(:name) { 'Fortaleza' }
    let(:now) { Time.new(2_018, 1, 17, 11, 0).utc }

    let(:result) { double(:result, status: status, data: city) }

    context 'when city not in db' do
      context 'when city not found by open weather' do
        let(:name) { 'asjlsajasdjasd' }

        it 'does not find the city' do
          VCR.use_cassette('open_weather/integration/find_location_weather_invalid_location') do
            expect(find.status).to eq(:not_found)
            expect(find.data).to be_nil
          end
        end
      end

      context 'when city found by open weather' do
        it 'retrieves the city info from open weather api' do
          VCR.use_cassette('open_weather/integration/find_location_weather') do
            expect(find.status).to eq(:found)

            city = find.data

            expect(city).to be_a(City)
            expect(city.name).to eq('Fortaleza')

            country = city.country

            expect(country).to be_a(Country)
            expect(country.acronym).to eq('BR')

            coordinate = city.coordinate

            expect(coordinate).to be_a(Coordinate)
            expect(coordinate.latitude).to eq(-3.73)
            expect(coordinate.longitude).to eq(-38.52)

            forecast = city.forecasts.first

            expect(forecast).to be_a(Forecast)
            expect(forecast.date).to eq(Time.at(1_516_327_200).utc)

            temperature = forecast.temperature

            expect(temperature).to be_a(Temperature)
            expect(temperature.value).to eq(27)
            expect(temperature.min).to eq(27)
            expect(temperature.max).to eq(27)
            expect(temperature.pressure).to eq(1_013)
            expect(temperature.humidity).to eq(78)

            wind = forecast.wind

            expect(wind).to be_a(Wind)
            expect(wind.speed).to eq(3.6)
            expect(wind.direction).to eq(60)

            weather = forecast.weather

            expect(weather).to be_a(Weather)
            expect(weather.main).to eq('Clouds')
            expect(weather.description).to eq('scattered clouds')
            expect(weather.visibility).to eq(10_000)
            expect(weather.clouds).to eq(40)
          end
        end

        it 'stores the city info in db' do
          VCR.use_cassette('open_weather/integration/find_location_weather') do
            find

            expect(City.count).to be > 0
            expect(Coordinate.count).to be > 0
            expect(Country.count).to be > 0
            expect(Forecast.count).to be > 0
            expect(Weather.count).to be > 0
            expect(Temperature.count).to be > 0
            expect(Wind.count).to be > 0
          end
        end
      end
    end

    context 'when city in db' do
      let(:status) { :found }
      let!(:city) { bootstrap_city(city: name, date: now) }

      it 'retrieves city from db' do
        expect(find.status).to eq(:found)
        expect(find.data).to eq(city)
      end
    end
  end
end
