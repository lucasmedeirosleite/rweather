# frozen_string_literal: true

FactoryBot.define do
  factory(:temperature) do
    sequence(:min)
    sequence(:max)
    sequence(:value)
    sequence(:pressure)
    sequence(:humidity)
  end
end
