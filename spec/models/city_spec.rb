# frozen_string_literal: true

require 'rails_helper'

RSpec.describe City, type: :model do
  describe 'fields' do
    it { is_expected.to respond_to(:name) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'relation' do
    it { is_expected.to have_one(:coordinate) }
  end
end
