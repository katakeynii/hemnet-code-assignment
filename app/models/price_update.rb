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
class PriceUpdate < ApplicationRecord
  belongs_to :price

  validates :amount_before, :amount_after, 
      presence: true,
      numericality: { 
        greater_than_or_equal_to: 0
      }
end
