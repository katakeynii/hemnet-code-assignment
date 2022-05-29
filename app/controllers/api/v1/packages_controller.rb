class Api::V1::PackagesController < ApiController

    def index
        packages = Package.all
        render json: packages.to_json
    end

    def create
    end

    def update
    end

    private
        def create_params
            params.require(:name)
            params.require(:municipality)
            params.require(:currency)
            params.require(:amount)
            params.permit(:amount)
        end
end
