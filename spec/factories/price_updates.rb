# == Schema Information
#
# Table name: price_updates
#
#  id            :bigint           not null, primary key
#  amount_after  :decimal(, )
#  amount_before :decimal(, )
#  end_date      :datetime
#  start_date    :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  price_id      :bigint           not null
#
# Indexes
#
#  index_price_updates_on_price_id  (price_id)
#
# Foreign Keys
#
#  fk_rails_...  (price_id => prices.id)
#
FactoryBot.define do
  factory :price_update do
    price { nil }
    amount_before { "9.99" }
    amount_after { "9.99" }
    start_date { "2022-05-29 15:59:46" }
    end_date { "2022-05-29 15:59:46" }
  end
end
