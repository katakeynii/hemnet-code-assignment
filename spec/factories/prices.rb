FactoryBot.define do
  factory :price do
    currency_code { "MyString" }
    currency { nil }
    package { nil }
    municipality { nil }
    amount { "9.99" }
  end
end
