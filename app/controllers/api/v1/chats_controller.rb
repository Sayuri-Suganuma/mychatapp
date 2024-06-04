class Api::V1::ChatsController < ApplicationController

  def index
    chatroom_id = params[:chatroom_id]
    if chatroom_id
      chatroom = Chatroom.find(chatroom_id)
      chats = chatroom.chats
      render json: chats
    else
      render json: { error: "Chatroom ID is required" }, status: :bad_request
    end
  end

  def create
    chatroom = Chatroom.find_by(id: chat_params[:chatroom_id])
    user = User.find_by(email: chat_params[:user_email])
    sender = User.find(chat_params[:sender_id])
    
    Rails.logger.info "chat_params: #{chat_params.inspect}"

    chat = chatroom.chats.new(chat_params)
    chat.user_id = chat_params[:user_id]
    chat.receiver_id = chat_params[:receiver_id]
    chat.user = user
    chat_json = chat.as_json
    chat_json[:sender_email] = sender.email
      if chat.save
        # render json: chat
        render json: chat_json
      else
        render json: { errors: chat.errors.full_messages }, status: :unprocessable_entity
      end
  end

  def show
    render json: chats
  end


  private

  def chat_params
    params.require(:chat).permit(:content, :chatroom_id, :sender_id, :sent_at, :user_id, :user_email, :receiver_id, :uid, :sender_email)
  end
end
