FactoryBot.define do
  factory :price_update do
    price { nil }
    amount_before { "9.99" }
    amount_after { "9.99" }
    start_date { "2022-05-29 15:59:46" }
    end_date { "2022-05-29 15:59:46" }
  end
end
