# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Forecast, type: :model do
  describe 'fields' do
    it { is_expected.to respond_to(:date) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:date) }
  end

  describe 'relations' do
    it { is_expected.to belong_to(:city) }
  end
end
