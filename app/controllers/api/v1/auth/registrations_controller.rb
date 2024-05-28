class Api::V1::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  before_action :validate_sign_up_params, only: [ :create ]
  # before_action :authenticate_api_v1_user!, only: [:new, :create, :edit, :update, :destroy]
  def validate_sign_up_params
    if User.exists?(email: sign_up_params[:email])
      render json: { errors: ['Email is already']}, status: :unprocessable_entity
    else
      super
    end
  end

  def create
    super
  end

  private
  
  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
  
  
  def account_update_params
    params.permit(:email, :password, :user_id, :password_confirmation, :current_password)
  end

end
