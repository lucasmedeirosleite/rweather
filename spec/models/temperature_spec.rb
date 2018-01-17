# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Temperature, type: :model do
  describe 'fields' do
    it { is_expected.to respond_to(:min) }
    it { is_expected.to respond_to(:max) }
    it { is_expected.to respond_to(:value) }
    it { is_expected.to respond_to(:pressure) }
    it { is_expected.to respond_to(:humidity) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:min) }
    it { is_expected.to validate_presence_of(:max) }
    it { is_expected.to validate_presence_of(:value) }
    it { is_expected.to validate_presence_of(:pressure) }
    it { is_expected.to validate_presence_of(:humidity) }

    it { is_expected.to validate_numericality_of(:min) }
    it { is_expected.to validate_numericality_of(:max) }
    it { is_expected.to validate_numericality_of(:value) }
    it { is_expected.to validate_numericality_of(:pressure) }
    it { is_expected.to validate_numericality_of(:humidity) }
  end

  describe 'relations' do
    it { is_expected.to belong_to(:forecast) }
  end
end
