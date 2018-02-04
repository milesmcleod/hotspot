class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.integer :spot_id, null: false
      t.integer :list_id, null: false
      t.integer :owner_id, null: false
      t.timestamps
    end
    add_index :listings, [:list_id, :spot_id], unique: true
  end
end
