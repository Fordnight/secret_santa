FactoryBot.define do
  factory :gift_type do
    sequence(:name) { |n| "game #{n}" }
  end
end