class AcceptedCurrency < ApplicationRecord
  belongs_to :municipality
  belongs_to :currency
end
