class CreateLists < ActiveRecord::Migration[5.1]
  def change
    create_table :lists do |t|
      t.integer :owner_id, null: false
      t.string :title, null: false
      t.boolean :public_boolean, null: false
      t.boolean :queue_boolean, null: false
      t.timestamps
    end
    add_index :lists, [:owner_id, :title], unique: true
  end
end
