class Api::V1::Auth::SessionsController < DeviseTokenAuth::SessionsController
  def create
    @user = User.find_by(email: sign_in_params[:email])
    if @user&.valid_password?(sign_in_params[:password])
      new_auth_header = @user.create_new_auth_token
      response.headers.merge!(new_auth_header)

      render json: { user: { id: @user.id, email: @user.email } }, status: :ok
    else
      render json: { errors: ['Invalid email or password'] }, status: :unprocessable_entity
    end
  end

  def validate_token
    if current_user
      render json: { data: current_user }, status: :ok
    else
      render json: { error: ['Invalid token']}, status: :unauthorized
    end
  end

  private

  def sign_in_params
    params.require(:user).permit(:email, :password)
  end
end
