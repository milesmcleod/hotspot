class CreateRecommendations < ActiveRecord::Migration[5.1]
  def change
    create_table :recommendations do |t|
      t.integer :sender_id, null: false
      t.integer :recipient_id, null: false
      t.integer :spot_id, null: false
      t.string :content
      t.timestamps
    end
    add_index :recommendations, :sender_id
    add_index :recommendations, :recipient_id
    add_index :recommendations, [:sender_id, :recipient_id], unique: true
  end
end
