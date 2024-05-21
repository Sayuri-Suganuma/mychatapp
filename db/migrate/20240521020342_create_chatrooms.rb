class CreateChatrooms < ActiveRecord::Migration[7.1]
  def change
    create_table :chatrooms do |t|
      t.integer :owner_id, null: false
      t.integer :partner_id, null: false
      t.string :title

      t.timestamps
    end
    add_index :chatrooms, :owner_id
    add_index :chatrooms, :partner_id

    add_foreign_key :chatrooms, :users, column: :owner_id
    add_foreign_key :chatrooms, :users, column: :partner_id
  end
end
