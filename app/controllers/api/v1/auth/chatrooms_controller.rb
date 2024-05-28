class Api::V1::Auth::ChatroomsController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken
  
  before_action :set_chatroom, only: %i[ show edit update destroy ]
  # before_action :authenticate_api_v1_user!

  def index
    @chatrooms = Chatroom.where(
      "owner_id = :user_id OR partner_id = :user_id",
      user_id: current_user.id
    )
    render json: @chatrooms
  end

  def show
    render json: @chatroom
  end

  def new
    @chatroom = Chatroom.new
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    Rails.logger.debug("Authenticate user before action called.")
    Rails.logger.debug("Params: #{params.inspect}")
    if @chatroom.save
      # render json: @chatroom, status: :created, location: @chatroom
      render json: @chatroom
      Rails.logger.debug("Chatroom saved successfully!")
    else
      render json: @chatroom.errors.full_messages, status: :unprocessable_entity
      Rails.logger.debug("Failed to save chatroom: #{@chatroom.errors}")
    end
  end
  

  def update
    if @chatroom.update(chatroom_params)
      render json: @chatroom
    else
      render json: @chatroom.errors, status: :unprocessable_entity
    end
  end


  def destroy

  end

  def edit

  end

  private

  def set_chatroom
    @chatroom = Chatroom.find(params[:id])
  end

  def chatroom_params
    params.require(:chatroom).permit(:owner_id, :partner_id, :title)
  end

  def current_user
    @current_user ||= User.find_by(uid: request.headers['uid'])
  end

end