FactoryBot.define do
  factory :player do
    sequence(:name) { |n| "player#{n}" }
    sequence(:email) { |n| "player#{n}@gmail.com" }
  end
end