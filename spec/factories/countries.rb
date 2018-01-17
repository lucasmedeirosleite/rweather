# frozen_string_literal: true

FactoryBot.define do
  factory(:country) do
    sequence(:acronym) { |i| "C#{i}" }
  end
end
