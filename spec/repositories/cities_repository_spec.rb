# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CitiesRepository, type: :repository do
  subject(:repository) { described_class.new }

  describe '#find' do
    subject(:find) { repository.find(lat: lat, lon: lon) }

    let(:lat) { -3.72 }
    let(:lon) { -38.52 }

    let(:now) { Time.new(2_018, 1, 16) }

    before do
      Timecop.freeze(now)
    end

    after { Timecop.return }

    context 'when city does not exist' do
      it 'returns nil' do
        expect(find).to be_nil
      end
    end

    context 'when city exist' do
      let!(:city) { bootstrap_city(lat: lat, lon: lon, date: date) }

      context 'when forecast is more than one hour from now' do
        let(:date) { now - 2.hours }

        it 'returns nil' do
          expect(find).to be_nil
        end
      end

      context 'when forecast is less than one hour from now' do
        let(:date) { now - 30.minutes }

        it 'returns the city and its information' do
          expect(find).to eq(city)
        end
      end
    end
  end
end
