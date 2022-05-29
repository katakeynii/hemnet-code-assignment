class PriceUpdate < ApplicationRecord
  belongs_to :price

  validates :amount_before, :amount_after, 
      presence: true,
      numericality: { 
        greater_than_or_equal_to: 0
      }
end
