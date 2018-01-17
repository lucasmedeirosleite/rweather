# frozen_string_literal: true

FactoryBot.define do
  factory(:city) do
    sequence(:name) { |i| "City #{i}" }
  end
end
