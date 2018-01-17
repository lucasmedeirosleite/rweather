# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Country, type: :model do
  describe 'fields' do
    it { is_expected.to respond_to(:acronym) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:acronym) }
  end

  describe 'relations' do
    it { is_expected.to have_many(:cities) }
    it { is_expected.to validate_uniqueness_of(:acronym) }
  end
end
