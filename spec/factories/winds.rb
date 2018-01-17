# frozen_string_literal: true

FactoryBot.define do
  factory(:wind) do
    sequence(:speed)
    sequence(:direction)
  end
end
