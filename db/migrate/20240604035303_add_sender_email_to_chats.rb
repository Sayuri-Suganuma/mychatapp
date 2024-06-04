class AddSenderEmailToChats < ActiveRecord::Migration[7.1]
  def change
    add_column :chats, :sender_email, :string
  end
end
