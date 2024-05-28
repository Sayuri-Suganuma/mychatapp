# app/controllers/users_controller.rb
class Api::V1::Auth::UsersController < DeviseTokenAuth::RegistrationsController
  before_action :authenticate_api_v1_user!

  validates :email, uniqueness: true

  # def create
  #   @user = User.find_by(email: sign_in_params[:email])
  #   if @user&.valid_password?(sign_in_params[:password])
  #     new_auth_header = @user.create_new_auth_token
  #     response.headers.merge!(new_auth_header)

  #     render json: { user: { id: @user.id, email: @user.email } }, status: :ok
  #   else
  #     render json: { errors: ['Invalid email or password'] }, status: :unprocessable_entity
  #   end
  # end

end




