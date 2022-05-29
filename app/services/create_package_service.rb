class CreatePackageService < ApplicationService    
    def initialize params
        @name = params[:name]
        @amount = params[:amount]
        @currency = params[:currency]
        @municipality = params[:municipality]
    end

    def call
        ActiveRecord::Base.transaction do

            municipality = Municipality.friendly.find(@municipality)
            currency = Currency.find_by(code: @currency)

            raise CurrencyMunicipalityUseError.new unless municipality.currencies.include?(currency)

            package = Package.create! name: @name
            price = Price.create! amount: @amount, 
                currency: currency,
                currency_code: currency.code,
                municipality: municipality,
                package: package
            package
        end
    end
end