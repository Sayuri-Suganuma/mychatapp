class AddReceiverToChats < ActiveRecord::Migration[7.1]
  def change
    add_column :chats, :receiver_id, :string
  end
end
