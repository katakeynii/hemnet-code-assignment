require 'rails_helper'

RSpec.describe Municipality, type: :model do
  describe "Validations" do 
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :slug}
  end

  # describe "Associations" do 
  #   it { should have_many :prices}
  #   it { should have_many :accepted_currency}
  #   it { should have_many(currency).through(:accepted_currency)}
  # end
end
