class Package < ApplicationRecord
    has_many :prices
    has_many :price_updates, through: :prices
end
