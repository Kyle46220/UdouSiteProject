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

ActiveRecord::Schema.define(version: 2019_11_08_033054) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "cab_configs", force: :cascade do |t|
    t.float "height"
    t.float "width"
    t.float "depth"
    t.integer "style"
    t.integer "colour"
    t.integer "shelf_qty"
    t.integer "drawer_qty"
    t.integer "cupboard_qty"
    t.boolean "back_panel"
    t.bigint "profile_id"
    t.bigint "collection_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price", default: 1
    t.index ["collection_id"], name: "index_cab_configs_on_collection_id"
    t.index ["profile_id"], name: "index_cab_configs_on_profile_id"
  end

  create_table "cart_items", force: :cascade do |t|
    t.bigint "cab_config_id"
    t.bigint "cart_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity", default: 1
    t.bigint "order_id"
    t.index ["cab_config_id"], name: "index_cart_items_on_cab_config_id"
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["order_id"], name: "index_cart_items_on_order_id"
  end

  create_table "carts", force: :cascade do |t|
    t.boolean "result_of_transaction"
    t.datetime "transaction_date"
    t.bigint "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_carts_on_profile_id"
  end

  create_table "collections", force: :cascade do |t|
    t.string "name"
    t.bigint "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "public_display"
    t.index ["profile_id"], name: "index_collections_on_profile_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string "name"
    t.integer "user_type"
    t.boolean "email_opt_in"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.string "title"
    t.text "description"
    t.text "image_upload"
    t.bigint "cart_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_reviews_on_cart_id"
  end

  create_table "uploads", force: :cascade do |t|
    t.text "image_upload"
    t.bigint "cab_config_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cab_config_id"], name: "index_uploads_on_cab_config_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "cab_configs", "collections"
  add_foreign_key "cab_configs", "profiles"
  add_foreign_key "cart_items", "cab_configs"
  add_foreign_key "cart_items", "carts"
  add_foreign_key "cart_items", "orders"
  add_foreign_key "carts", "profiles"
  add_foreign_key "collections", "profiles"
  add_foreign_key "profiles", "users"
  add_foreign_key "reviews", "carts"
  add_foreign_key "uploads", "cab_configs"
end
