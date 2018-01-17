# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Wind, type: :model do
  describe 'fields' do
    it { is_expected.to respond_to(:speed) }
    it { is_expected.to respond_to(:direction) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:speed) }
    it { is_expected.to validate_presence_of(:direction) }

    it { is_expected.to validate_numericality_of(:speed) }
    it { is_expected.to validate_numericality_of(:direction) }
  end

  describe 'relations' do
    it { is_expected.to belong_to(:forecast) }
  end
end
