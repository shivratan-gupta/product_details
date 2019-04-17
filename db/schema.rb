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

ActiveRecord::Schema.define(version: 2019_04_17_160506) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.integer "duration"
    t.datetime "booked_date"
    t.integer "user_id"
    t.integer "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "end_date"
    t.integer "status"
  end

  create_table "fascilities", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "holidays", force: :cascade do |t|
    t.string "title"
    t.datetime "holiday_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "product_type"
    t.string "product_name"
    t.string "model"
    t.string "brand"
    t.integer "year"
    t.integer "ram"
    t.integer "external_storage"
    t.integer "internal_storage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "project_name"
    t.string "project_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "room_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shortened_urls", id: :serial, force: :cascade do |t|
    t.integer "owner_id"
    t.string "owner_type", limit: 20
    t.text "url", null: false
    t.string "unique_key", limit: 10, null: false
    t.string "category"
    t.integer "use_count", default: 0, null: false
    t.datetime "expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["category"], name: "index_shortened_urls_on_category"
    t.index ["owner_id", "owner_type"], name: "index_shortened_urls_on_owner_id_and_owner_type"
    t.index ["unique_key"], name: "index_shortened_urls_on_unique_key", unique: true
    t.index ["url"], name: "index_shortened_urls_on_url"
  end

  create_table "tasks", force: :cascade do |t|
    t.integer "project_id"
    t.string "task_name"
    t.string "task_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_roles", force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_tasks", force: :cascade do |t|
    t.integer "user_id"
    t.integer "project_id"
    t.integer "task_id"
    t.integer "task_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
