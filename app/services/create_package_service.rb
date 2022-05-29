class CreatePackageService < ApplicationService    
    def initialize params
        @name = params[:name]
        @amount = params[:amount]
        @currency = params[:currency]
        @municipality = params[:municipality]
    end

    def call
        ActiveRecord::Base.transaction do

        end
    end
end