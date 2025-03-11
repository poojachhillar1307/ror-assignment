class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: [:signup, :login]

  def signup
    user = User.new(user_params)
    if user.save
      token = JsonWebToken.encode(user_id: user.id)
      render json: { token: token, user: user }, status: :created
    else
      render json: { error: user.errors.full_messages }, status: :unprocessable_entity
    end
  end
  def upload_image
    user = User.find_by(id: params[:id])
    unless user
      return render json: { error: "User not found" }, status: :not_found
    end
    image_param = params[:image] || params.values.find { |p| p.is_a?(ActionDispatch::Http::UploadedFile) }
    if image_param.present?
      user.image.attach(image_param)
      render json: { message: "Image uploaded successfully", image_url: url_for(user.image) }, status: :ok
    else
      render json: { error: "No image uploaded" }, status: :unprocessable_entity
    end
  end  
  

  def login
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: user.id)
      render json: { token: token, user: user }, status: :ok
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
