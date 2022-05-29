require 'rails_helper'

RSpec.describe Api::V1::PackagesController, type: :request do
  # describe "GET /index" do
  #   pending "add some examples (or delete) #{__FILE__}"
  # end

  describe "POST /api/v1/packages" do
    
    let(:base_error_message)	{ "param is missing or the value is empty:" }
    let(:municipality)	{ create(:municipality, name: "Stockholm", slug: "stockholm") }
    let(:currency)	{ create(:currency, code: "SEK", name: "SEK") }
    let(:accepted_currency)	{ create(:accepted_currency, municipality: municipality, currency: currency) }

    it "require presence of param name" do
      post "/api/v1/packages"
      expect(response.body).to include("#{base_error_message} name") 
    end
    it "require presence of param municipality" do
      post "/api/v1/packages", params: { name: "Good" }
      expect(response.body).to include("#{base_error_message} municipality") 
    end
    it "require presence of param currency" do
      post "/api/v1/packages", params: { name: "Good", municipality: municipality.slug }
      expect(response.body).to include("#{base_error_message} currency") 
    end
    it "require presence of param amount" do
      post "/api/v1/packages", params: { 
        name: "Good", 
        municipality: municipality.slug, 
        currency: currency.code 
      }
      expect(response.body).to include("#{base_error_message} amount") 
    end

    it "Should create a new package" do
      municipality.currencies = [currency]
      post "/api/v1/packages", params: { 
        name: "Good", 
        municipality: municipality.slug, 
        currency: currency.code,
        amount: 6000 
      }
      last_inserted = Package.last
      data = JSON.parse(response.body)

      expect(last_inserted.id).to eq(data["id"])
      expect(last_inserted.prices.last.amount).to eq(6000)
      expect(response).to have_http_status(201) 
    end
  end
  describe "PUT /api/v1/packages" do
      let(:municipality)	{ create(:municipality, name: "Stockholm", slug: "stockholm") }
      let(:currency)	{ create(:currency, code: "SEK", name: "SEK") }
      let(:accepted_currency)	{ create(:accepted_currency, municipality: municipality, currency: currency) }

      let(:package)	{ create(:package, name: "Basic", slug: 'basic') }
      let(:price)	{ create(:price, 
        currency_code: currency.code,
        currency: currency,
        package: package,
        municipality: municipality,
        amount: 3000
      ) }
      it "Should update a package price" do

        
        
        municipality.currencies = [currency]
        put "/api/v1/packages/#{package.id}", params: { 
          name: "Basic Plus", 
          price_id: price.id, 
          amount: 6000 
        }
        last_inserted = Package.last
        data = JSON.parse(response.body)
        updated_price = last_inserted.prices.last
        price_updates = updated_price.price_updates
        expect(last_inserted.id).to eq(data["id"])
        expect(updated_price.id).to eq(price.id) # it should be the same price objects
        expect(updated_price.amount).not_to eq(price.amount) # but different amount

        expect(price_updates.size).to eq(1) # if contains an update change

        expect(price_updates.last.amount_before).to eq(price.amount)
        expect(price_updates.last.amount_after).to eq(updated_price.amount)
        expect(response).to have_http_status(200) 
      end
  end
end
