class Api::V1::PackagesController < ApiController

    def index
        packages = Package.all
        render json: packages.to_json
    end

    def create
        data = create_params
        package = CreatePackageService.call data
        render json: package.to_json, status: :created
    end

    def update
        # package = Package.find(params[:id])
        data = update_params
        data[:package] = params[:id]
        package = UpdatePriceService.call data
        render json: package.to_json, status: :ok
    end

    private
        def update_params
            params.require(:price_id)
            params.permit(:price_id, :name, :amount)
        end
        def create_params
            params.require(:name)
            params.require(:municipality)
            params.require(:currency)
            params.require(:amount)
            params.permit(:amount, :municipality, :currency, :amount, :name)
        end
end
