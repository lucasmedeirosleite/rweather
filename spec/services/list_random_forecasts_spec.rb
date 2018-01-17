# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ListRandomForecasts, type: :service do
  subject(:service) { described_class.new }

  describe '#call' do
    subject(:list) { service.call }

    before do
      allow(service).to receive(:rand)
        .with(0.00...63.00)
        .and_return(27.487968729680095)

      allow(service).to receive(:rand)
        .with(-30.00...60.00)
        .and_return(14.881592210390643)
    end

    it 'lists random forecasts' do
      VCR.use_cassette('rweather/integration/list_random_forecasts') do
        expect(list.status).to eq(:found)
        expect(list.data.count).to be > 0
      end
    end
  end
end
