FactoryBot.define do
  factory :accepted_currency do
    municipality { create(:municipality) }
    currency { create(:currency) }
    deleted_at { nil }
    # deleted_at { "2022-05-29 15:18:02" }
  end
end
