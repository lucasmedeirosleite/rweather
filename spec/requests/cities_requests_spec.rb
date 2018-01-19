# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Cities', type: :request do
  let(:country) { 'BR' }
  let(:term) { 'Fortaleza' }
  let(:now) { Time.new(2_018, 1, 17, 14, 0, 0).utc }

  let(:headers) do
    {
      'Content-Type' => 'application/json',
      'Accept' => 'application/vnd.rweather.com; version=1'
    }
  end

  before { Timecop.freeze(now) }
  after { Timecop.return }

  describe 'GET #search' do
    subject(:get_search_city) do
      get search_api_cities_path, params: { term: term }, headers: headers
    end

    context 'when city exists' do
      let!(:city) do
        bootstrap_city(city: term, country: country, date: now)
      end

      it 'returns a success response' do
        get_search_city

        expect(response).to have_http_status(:ok)
      end
    end

    context 'when city does not exist' do
      let(:term) { 'asjlsajasdjasd' }

      it 'returns a not found response' do
        VCR.use_cassette('rweather/integration/not_found_location') do
          get_search_city

          expect(response).to have_http_status(:not_found)
        end
      end
    end
  end

  describe 'GET #random' do
    subject(:get_random_forecasts) do
      get random_api_cities_path, headers: headers
    end

    context 'when forecasts found' do
      before do
        allow_any_instance_of(ListRandomForecasts).to receive(:rand)
          .with(0.00...63.00)
          .and_return(27.487968729680095)

        allow_any_instance_of(ListRandomForecasts).to receive(:rand)
          .with(-30.00...60.00)
          .and_return(14.881592210390643)
      end

      it 'returns a success response' do
        VCR.use_cassette('rweather/integration/list_random_forecasts') do
          get_random_forecasts

          expect(response).to have_http_status(:ok)
        end
      end
    end

    context 'when city does not exist' do
      before do
        allow_any_instance_of(ListRandomForecasts).to receive(:rand)
          .with(0.00...63.00)
          .and_return(280)

        allow_any_instance_of(ListRandomForecasts).to receive(:rand)
          .with(-30.00...60.00)
          .and_return(380)
      end


      it 'returns a success response' do
        VCR.use_cassette('rweather/integration/list_random_forecasts_invalid') do
          get_random_forecasts

          expect(response.body).to eq('[]')
          expect(response).to have_http_status(:ok)
        end
      end
    end
  end
end


