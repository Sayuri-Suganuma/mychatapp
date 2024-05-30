class ChangeChatsForeignKeyToUsers < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :chats, :chatrooms, column: :user_id
    add_foreign_key :chats, :users, column: :user_id
  end
end
