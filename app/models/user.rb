# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  before_create :skip_confirmation!

  protected

  def skip_confirmation!
    self.confirmed_at = Time.now.utc
  end

  has_many :chats, class_name: 'Chat', foreign_key: 'user_id', dependent: :destroy
  has_many :owned_chatrooms, class_name: 'Chatroom', foreign_key: 'owner_id', dependent: :destroy
  has_many :partnered_chatrooms, class_name: 'Chatroom', foreign_key: 'partner_id', dependent: :destroy
end
