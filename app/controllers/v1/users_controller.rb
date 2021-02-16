# frozen_string_literal: true

module V1
  class UsersController < ApplicationController
    before_action :authorized, only: [:auto_login]

    def create
      @user = User.create(user_params || JSON.parse(request.raw_post))
      puts user_params
      puts JSON.parse(request.raw_post)
      if @user.valid?
        token = encode_token({ user_id: @user.id })
        render json: { user: @user, token: token }
      else
        render json: { error: "Invalid username or password" }
      end
    end

    def login
      @user = User.find_by(email: request.headers["email"])

      if @user&.valid_password?(request.headers["password"])
        token = encode_token({ user_id: @user.id })
        render json: { user: @user, token: token }
      else
        render json: { error: "Invalid username or password" }
      end
    end

    def auto_login
      render json: @user
    end

    private

    def user_params
      params.permit(:name, :email, :password)
    end
  end
end
