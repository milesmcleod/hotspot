class CreateConnections < ActiveRecord::Migration[5.1]
  def change
    create_table :connections do |t|
      t.integer :user1_id, null: false
      t.integer :user2_id, null: false
      t.timestamps
    end
    add_index :connections, [:user1_id, :user2_id], unique: true
  end
end
