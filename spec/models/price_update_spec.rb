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
require 'rails_helper'

RSpec.describe PriceUpdate, type: :model do
  describe "Validations" do 
    it { should validate_presence_of :amount_before }
    it { should validate_presence_of :amount_after }
    it do
      is_expected.to validate_numericality_of(:amount_before)
        .is_greater_than_or_equal_to(0)
    end
    it do
      is_expected.to validate_numericality_of(:amount_after)
        .is_greater_than_or_equal_to(0)
    end

  end

  describe "Associations" do 
    it { should belong_to :price}
  end
end
