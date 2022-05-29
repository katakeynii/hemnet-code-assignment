# == Schema Information
#
# Table name: municipalities
#
#  id         :bigint           not null, primary key
#  name       :string
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_municipalities_on_slug  (slug) UNIQUE
#
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
