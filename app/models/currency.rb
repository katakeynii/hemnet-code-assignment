# == Schema Information
#
# Table name: currencies
#
#  id            :bigint           not null, primary key
#  code          :string
#  decimal_mark  :string           default("."), not null
#  name          :string
#  symbol        :string
#  thousand_mark :string           default(","), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_currencies_on_code  (code) UNIQUE
#
class Currency < ApplicationRecord
end
