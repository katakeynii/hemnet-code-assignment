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
