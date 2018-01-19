# frozen_string_literal: true

require 'rails_helper'
require 'open_weather'

RSpec.describe OpenWeather::UseCases::Find do
  subject(:use_case) { described_class.new(term: term, client: client) }

  let(:term) { 'Fortaleza' }
  let(:client) { double(:client) }

  describe '#call' do
    subject(:find) { use_case.call }

    let(:content) { double }
    let(:params) { { q: term } }

    before do
      allow(client).to receive(:get)
        .with('weather', params: params)
        .and_return(expected_response)
    end

    context 'when found' do
      let(:expected_response) do
        double(:response, status: 200, success?: true, content: content)
      end

      it 'returns a success response' do
        expect(find).to be_success
        expect(find.status).to eq(200)
        expect(find.content).to eq(content)
      end
    end

    context 'when not found' do
      let(:expected_response) do
        double(:response, status: 404, success?: false, content: content)
      end

      it 'returns an error response' do
        expect(find).not_to be_success
        expect(find.status).to eq(404)
        expect(find.content).to eq(content)
      end
    end

    context 'when unauthorized' do
      let(:expected_response) do
        double(:response, status: 401, success?: false, content: content)
      end

      it 'returns an error response' do
        expect(find).not_to be_success
        expect(find.status).to eq(401)
        expect(find.content).to eq(content)
      end
    end

    context 'when internal error' do
      let(:expected_response) do
        double(:response, status: 500, success?: false, content: content)
      end

      it 'returns an error response' do
        expect(find).not_to be_success
        expect(find.status).to eq(500)
        expect(find.content).to eq(content)
      end
    end
  end
end
