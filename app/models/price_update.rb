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
  # composed_of :period, class_name: "Period", mapping: %w(start_date end_date)
  # composed_of :amount_before, class_name: "Amount", mapping: %w(amount_before)
  # composed_of :amount_after, class_name: "Amount", mapping: %w(amount_after)

  validates :amount_before, :amount_after, 
      presence: true,
      numericality: { 
        greater_than_or_equal_to: 0
      }

  scope :by_month, ->(month_number) { where('extract(year  from start_date) = ?', month_number) }
  scope :by_year, ->(year) { where('extract(year  from start_date) = ?', year) }
end
