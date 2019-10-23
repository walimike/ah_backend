class Api::V1::UsersController < ApplicationController
    include UsersHelper

    def index
        render( json: {'status' => 'ok'})
    end

    def create
        @user = User.new(user_params)
        if @user.save
            UserMailer.with(user: @user).new_user_email.deliver_later
            render json: @user, status: :created
        else
            render json: { errors: @user.errors },
                    status: :unprocessable_entity
        end
    end
end
