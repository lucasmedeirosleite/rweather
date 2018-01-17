# frozen_string_literal: true

FactoryBot.define do
  factory(:weather) do
    sequence(:main) { |i| "Clouds #{i}" }
    sequence(:clouds)
    sequence(:visibility)
    sequence(:description) { |i| "Description #{i}" }
  end
end
