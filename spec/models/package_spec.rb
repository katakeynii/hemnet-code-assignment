# == Schema Information
#
# Table name: packages
#
#  id          :bigint           not null, primary key
#  description :text
#  is_active   :boolean
#  name        :string
#  slug        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_packages_on_slug  (slug) UNIQUE
#
require 'rails_helper'

RSpec.describe Package, type: :model do

  describe "Validations" do 
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :slug}
  end

  describe "Associations" do 
    it { should have_many :prices}
    it { should have_many(:price_updates).through(:prices)}
  end
end
