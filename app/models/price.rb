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
