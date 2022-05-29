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
FactoryBot.define do
  factory :package do
    name { "MyString" }
    slug { "MyString" }
    description { "MyText" }
    is_active { false }
  end
end
