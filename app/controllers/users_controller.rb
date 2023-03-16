class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :user_not_found_error_response

    def show
        user = User.find(params[:id])
        render json: user, include: :items
    end

    private

    def user_not_found_error_response invalid
        render json: {error: "User not found"}, status: :not_found
    end
end
