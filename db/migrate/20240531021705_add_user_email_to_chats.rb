class AddUserEmailToChats < ActiveRecord::Migration[7.1]
  def change
    add_column :chats, :user_email, :string
  end
end
