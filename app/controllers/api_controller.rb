class ApiController < ActionController::API
    rescue_from StandardError do |error|
        @error = error
        render json: {
            message: @error.message
        }, 
        status: :bad_request
      end
end
