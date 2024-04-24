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

ActiveRecord::Schema.define(version: 2024_04_18_170747) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "product_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_order_items_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "processor_id"
    t.bigint "motherboard_id"
    t.bigint "ram_id"
    t.bigint "video_card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "status"
    t.index ["motherboard_id"], name: "index_orders_on_motherboard_id"
    t.index ["processor_id"], name: "index_orders_on_processor_id"
    t.index ["ram_id"], name: "index_orders_on_ram_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
    t.index ["video_card_id"], name: "index_orders_on_video_card_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "specifications"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
    t.index ["category_id"], name: "index_products_on_category_id"
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

  add_foreign_key "order_items", "products"
  add_foreign_key "orders", "products", column: "motherboard_id"
  add_foreign_key "orders", "products", column: "processor_id"
  add_foreign_key "orders", "products", column: "ram_id"
  add_foreign_key "orders", "products", column: "video_card_id"
  add_foreign_key "orders", "users"
  add_foreign_key "products", "categories"
end
