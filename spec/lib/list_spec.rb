# frozen_string_literal: true

require 'rails_helper'
require 'open_weather'

RSpec.describe OpenWeather::UseCases::List do
  subject(:use_case) { described_class.new(lat: lat, lon: lon, count: count, client: client) }

  let(:lat) { -3.72 }
  let(:lon) { -38.52 }
  let(:count) { 10 }
  let(:client) { double(:client) }

  describe '#call' do
    subject(:list) { use_case.call }

    let(:content) { double }
    let(:params) { { lat: lat, lon: lon, cnt: count } }

    before do
      allow(client).to receive(:get)
        .with('find', params: params)
        .and_return(expected_response)
    end

    context 'when found' do
      let(:expected_response) do
        double(:response, status: 200, success?: true, content: content)
      end

      it 'returns a success response' do
        expect(list).to be_success
        expect(list.status).to eq(200)
        expect(list.content).to eq(content)
      end
    end

    context 'when not found' do
      let(:expected_response) do
        double(:response, status: 404, success?: false, content: content)
      end

      it 'returns an error response' do
        expect(list).not_to be_success
        expect(list.status).to eq(404)
        expect(list.content).to eq(content)
      end
    end

    context 'when unauthorized' do
      let(:expected_response) do
        double(:response, status: 401, success?: false, content: content)
      end

      it 'returns an error response' do
        expect(list).not_to be_success
        expect(list.status).to eq(401)
        expect(list.content).to eq(content)
      end
    end

    context 'when internal error' do
      let(:expected_response) do
        double(:response, status: 500, success?: false, content: content)
      end

      it 'returns an error response' do
        expect(list).not_to be_success
        expect(list.status).to eq(500)
        expect(list.content).to eq(content)
      end
    end
  end
end
