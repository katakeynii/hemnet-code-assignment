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
FactoryBot.define do
  factory :municipality do
    sequence(:name) { |n| "Municipality #{n}" }
    sequence(:slug) { |n| "municipality-#{n}" }
  end
end
