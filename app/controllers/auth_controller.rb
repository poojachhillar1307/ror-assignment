class AuthController < ApplicationController
  require 'jwt'

  SECRET_KEY = Rails.application.secrets.secret_key_base

  def signup
    user = User.new(user_params)
    if user.save
      render json: { message: 'User created successfully' }, status: :created
    else
      render json: { error: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def login
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      token = generate_token(user.id)
      render json: { token: token }, status: :ok
    else
      render json: { error: 'Invalid credentials' }, status: :unauthorized
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end

  def generate_token(user_id)
    JWT.encode({ user_id: user_id }, SECRET_KEY, 'HS256')
  end
end
