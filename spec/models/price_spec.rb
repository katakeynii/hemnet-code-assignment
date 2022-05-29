# == Schema Information
#
# Table name: prices
#
#  id              :bigint           not null, primary key
#  amount          :decimal(, )
#  currency_code   :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  currency_id     :bigint           not null
#  municipality_id :bigint           not null
#  package_id      :bigint           not null
#
# Indexes
#
#  index_prices_on_currency_id                                     (currency_id)
#  index_prices_on_currency_id_and_package_id_and_municipality_id  (currency_id,package_id,municipality_id) UNIQUE
#  index_prices_on_municipality_id                                 (municipality_id)
#  index_prices_on_package_id                                      (package_id)
#
# Foreign Keys
#
#  fk_rails_...  (currency_id => currencies.id)
#  fk_rails_...  (municipality_id => municipalities.id)
#  fk_rails_...  (package_id => packages.id)
#
require 'rails_helper'

RSpec.describe Price, type: :model do
  describe "Validations" do 
    it { should validate_presence_of :amount}
    it { should validate_presence_of :currency_code}
    it do
      is_expected.to validate_numericality_of(:amount)
        .is_greater_than_or_equal_to(0)
    end
    it "should not create a package price a price with same currency in the same municipality "
  end
  describe "Associations" do
    it { should belong_to :package }
    it { should belong_to :currency }
    it { should belong_to :municipality }
    it { should have_many :price_updates }
  end
end
