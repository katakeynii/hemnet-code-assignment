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
