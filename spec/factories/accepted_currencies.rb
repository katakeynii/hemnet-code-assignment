# == Schema Information
#
# Table name: accepted_currencies
#
#  id              :bigint           not null, primary key
#  deleted_at      :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  currency_id     :bigint           not null
#  municipality_id :bigint           not null
#
# Indexes
#
#  index_accepted_currencies_on_currency_id      (currency_id)
#  index_accepted_currencies_on_municipality_id  (municipality_id)
#
# Foreign Keys
#
#  fk_rails_...  (currency_id => currencies.id)
#  fk_rails_...  (municipality_id => municipalities.id)
#
FactoryBot.define do
  factory :accepted_currency do
    municipality { create(:municipality) }
    currency { create(:currency) }
    deleted_at { nil }
    # deleted_at { "2022-05-29 15:18:02" }
  end
end
