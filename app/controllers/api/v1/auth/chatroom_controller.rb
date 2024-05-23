class Api::V1::Auth::ChatroomController < ApplicationController
  before_action :set_chatroom, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    chatroom = Chatroom.all
    render json:chatrooms
  end

  def show

  end

  def new
  end

  def create

  end

  def update

  end

  def destroy

  end

end