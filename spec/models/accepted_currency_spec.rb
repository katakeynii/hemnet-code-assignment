# == Schema Information
#
# Table name: accepted_currencies
#
#  id              :bigint           not null, primary key
#  deleted_at      :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  currency_id     :bigint           not null
#  municipality_id :bigint           not null
#
# Indexes
#
#  index_accepted_currencies_on_currency_id      (currency_id)
#  index_accepted_currencies_on_municipality_id  (municipality_id)
#
# Foreign Keys
#
#  fk_rails_...  (currency_id => currencies.id)
#  fk_rails_...  (municipality_id => municipalities.id)
#
require 'rails_helper'

RSpec.describe AcceptedCurrency, type: :model do
  describe "Associations" do
    it { should belong_to :currency }
    it { should belong_to :municipality }
  end
  describe "adding acceptance of currency in municipality" do
    # let(:municipalities)	{ create(:municipality) }
    # let(:currencies)	{ create(:currency, 3) }
    let(:accepted_currencies)	{ create_list(:accepted_currency, 3) }

    it "Bonjour"  do
      # accepted_currencies.first.tap do |item|
      #   item.deleted_at =  DateTime.now
      #   item.save
      # end
      # accepted_currencies.first.
      # puts accepted_currencies.inspect
    end
  end
end
