class CreateSpots < ActiveRecord::Migration[5.1]
  def change
    create_table :spots do |t|
      t.string :yelp_name, null: false
      t.timestamps
    end
    add_index :spots, :yelp_name, unique: true
  end
end
