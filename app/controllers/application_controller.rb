class ApplicationController < ActionController::API
    def not_found
        render json: {error: 'not_found'}
    end

    def authorize_request
        header = header.split(' ').last if request.headers['Authorization']
        begin
            @decoded = JsonWebToken.decode(header)
            @current_user = User.find(@decoded[:user_id])
        rescue ActiveRecord::RecordNotFound => error
            render json: {errors: error.message }, status: :unauthorized
        rescue JWT::DecodeError => error
            render json: {errors: error.message}, status: :unauthorized
        end
    end
end
