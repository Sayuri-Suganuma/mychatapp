# app/controllers/users_controller.rb
class UsersController < ApplicationController
  before_action :authenticate_user!

  def profile
    render json: { id: current_user.id, email: current_user.email }
  end
end




