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
end
