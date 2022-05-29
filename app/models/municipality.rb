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
class Municipality < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged

    has_many :accepted_currencies
    has_many :currencies, through: :accepted_currencies
    validates_presence_of :name
    validates_uniqueness_of :slug
end
