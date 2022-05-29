require 'rails_helper'

RSpec.describe Currency, type: :model do
  describe "Validations" do 
    it { should validate_presence_of :name }
    it { should validate_presence_of :code }
    it { should validate_uniqueness_of :code }
  end
  # describe "Associations" do
  #   it { should have_many(:accepted_currencies) }
  #   it { should have_many(:municipalities).through(:accepted_currencies) }
  # end
end
