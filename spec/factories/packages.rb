FactoryBot.define do
  factory :package do
    name { "MyString" }
    slug { "MyString" }
    description { "MyText" }
    is_active { false }
  end
end
