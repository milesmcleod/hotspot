# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180204010317) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "connections", force: :cascade do |t|
    t.integer "requester_id", null: false
    t.integer "requested_id", null: false
    t.boolean "pending_boolean", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["requester_id", "requested_id"], name: "index_connections_on_requester_id_and_requested_id", unique: true
  end

  create_table "listings", force: :cascade do |t|
    t.integer "spot_id", null: false
    t.integer "list_id", null: false
    t.integer "owner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["list_id", "spot_id"], name: "index_listings_on_list_id_and_spot_id", unique: true
  end

  create_table "lists", force: :cascade do |t|
    t.integer "owner_id", null: false
    t.string "title", null: false
    t.boolean "public_boolean", null: false
    t.boolean "queue_boolean", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id", "title"], name: "index_lists_on_owner_id_and_title", unique: true
  end

  create_table "recommendations", force: :cascade do |t|
    t.integer "sender_id", null: false
    t.integer "recipient_id", null: false
    t.integer "spot_id", null: false
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipient_id"], name: "index_recommendations_on_recipient_id"
    t.index ["sender_id", "recipient_id"], name: "index_recommendations_on_sender_id_and_recipient_id", unique: true
    t.index ["sender_id"], name: "index_recommendations_on_sender_id"
  end

  create_table "spots", force: :cascade do |t|
    t.string "yelp_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["yelp_name"], name: "index_spots_on_yelp_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "username", null: false
    t.string "img_url", null: false
    t.string "password_digest", null: false
    t.string "session_token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["session_token"], name: "index_users_on_session_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
