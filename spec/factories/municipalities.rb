FactoryBot.define do
  factory :municipality do
    sequence(:name) { |n| "Municipality #{n}" }
    sequence(:slug) { |n| "municipality-#{n}" }
  end
end
