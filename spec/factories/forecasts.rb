# frozen_string_literal: true

FactoryBot.define do
  factory(:forecast) do
    sequence(:date) { |i| Time.new(2_017, 1, i + 1) }
  end
end
