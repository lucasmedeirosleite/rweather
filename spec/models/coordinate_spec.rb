# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Coordinate, type: :model do
  describe 'fields' do
    it { is_expected.to respond_to(:latitude) }
    it { is_expected.to respond_to(:longitude) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:latitude) }
    it { is_expected.to validate_presence_of(:longitude) }

    it 'validates numericality of latitude' do
      expect(subject).to validate_numericality_of(:latitude)
        .is_greater_than_or_equal_to(-90.000_000_000)
        .is_less_than_or_equal_to(90.000_000_000)
    end

    it 'validates numericality of longitude' do
      expect(subject).to validate_numericality_of(:longitude)
        .is_greater_than_or_equal_to(-180.000_000_000)
        .is_less_than_or_equal_to(180.000_000_000)
    end

    it 'validates uniquesses of latitude and longitudes' do
      expect(subject).to validate_uniqueness_of(:longitude)
        .scoped_to(:latitude)
    end
  end

  describe 'relations' do
    it { is_expected.to belong_to(:city) }
  end
end
