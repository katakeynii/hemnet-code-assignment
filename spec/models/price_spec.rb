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
