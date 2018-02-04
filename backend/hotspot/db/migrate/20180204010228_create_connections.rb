class CreateConnections < ActiveRecord::Migration[5.1]
  def change
    create_table :connections do |t|
      t.integer :requester_id, null: false
      t.integer :requested_id, null: false
      t.boolean :pending_boolean, default: true
      t.timestamps
    end
    add_index :connections, [:requester_id, :requested_id], unique: true
  end
end
