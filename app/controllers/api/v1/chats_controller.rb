class Api::V1::ChatsController < ApplicationController

  def index
    chats = Chat.all
    render json: chats
  end

  def create
    # chatroom = Chatroom.find_by(id: params[:chat][:chatroom_id])
    # chat = chatroom.chats.new(content: params[:chat][:content])
    chatroom = Chatroom.find_by(id: chat_params[:chatroom_id])
    chat = chatroom.chats.new(chat_params)
    

    if chat.save
      # render json: chat, status: :created
      render json: chat
    else
      render json: { errors: chat.errors.full_messages }, status: :unprocessable_entity
    end
  end


  private

  def chat_params
    params.require(:chat).permit(:content, :chatroom_id, :sender_id, :sent_at, :user_id)
  end
end
