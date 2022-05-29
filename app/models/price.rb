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
class Price < ApplicationRecord

  
  belongs_to :currency
  belongs_to :package
  belongs_to :municipality
  has_many :price_updates

  validates :currency_code, presence: true
  validates :amount, 
      presence: true,
      numericality: { 
        greater_than_or_equal_to: 0
      }
end
