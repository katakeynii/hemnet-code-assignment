class UpdatePriceService < ApplicationService
    def initialize params
        # @package = Package.friendly.find(params[:package])
        @price = Price.find(params[:price_id])
        @amount = params[:amount]
    end

    def call
        ActiveRecord::Base.transaction do
            PriceUpdate.create! do |update|
                update.price =  @price
                update.amount_before =  @price.amount
                update.amount_after =  @amount
                update.start_date =  @price.created_at
                update.end_date =  DateTime.now.utc
            end

            puts "********************************"
            puts @amount.inspect
            @price.update_column(:amount, @amount)
        end
    end
end