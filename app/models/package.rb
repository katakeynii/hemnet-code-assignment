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
class Package < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged
    has_many :prices
    has_many :price_updates, through: :prices

    validates :name, presence: true
    validates_uniqueness_of :slug
end
