class RemoveReceiverFromChats < ActiveRecord::Migration[7.1]
  def change
    remove_column :chats, :receiver, :string
  end
end
