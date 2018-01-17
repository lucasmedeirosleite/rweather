# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Weather, type: :model do
  describe 'fields' do
    it { is_expected.to respond_to(:main) }
    it { is_expected.to respond_to(:clouds) }
    it { is_expected.to respond_to(:visibility) }
    it { is_expected.to respond_to(:description) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:main) }
    it { is_expected.to validate_presence_of(:clouds) }
    it { is_expected.to validate_presence_of(:visibility) }
    it { is_expected.to validate_presence_of(:description) }

    it 'validates numericality clouds' do
      expect(subject).to validate_numericality_of(:clouds)
    end

    it 'validates visibility clouds' do
      expect(subject).to validate_numericality_of(:visibility)
    end
  end

  describe 'relations' do
    it { is_expected.to belong_to(:forecast) }
  end
end
