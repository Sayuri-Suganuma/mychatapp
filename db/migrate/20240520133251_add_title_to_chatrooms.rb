class AddTitleToChatrooms < ActiveRecord::Migration[7.1]
  def change
    add_column :chatrooms, :title, :string
  end
end
