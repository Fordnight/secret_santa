# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    sequence(:title) { |n| "Test Article #{n}" }
    text { Faker::Lorem.paragraphs(number: 1) }
  end
end
