FactoryBot.define do
  factory :list do
    gift_type
    sequence(:title) { |n| "titleGame #{n}" }
    wishlist_max {"5"}
    price_min {"20"}
    price_max {"50"}
  end
end