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

ActiveRecord::Schema.define(version: 20170601212243) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "beacons", force: :cascade do |t|
    t.integer "major", null: false
    t.integer "minor", null: false
    t.string "passcode", null: false
    t.integer "status", default: 0
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "major_minor", null: false
    t.string "name"
    t.index ["major", "minor"], name: "index_beacons_on_major_and_minor", unique: true
    t.index ["major_minor"], name: "index_beacons_on_major_minor", unique: true
    t.index ["user_id"], name: "index_beacons_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.integer "beacon_id"
    t.integer "user_id"
    t.float "latitude", null: false
    t.float "longitude", null: false
    t.string "address"
    t.string "city"
    t.string "country"
    t.string "country_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["beacon_id"], name: "index_locations_on_beacon_id"
    t.index ["user_id"], name: "index_locations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "name", null: false
    t.string "api_token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["api_token"], name: "index_users_on_api_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "beacons", "users"
  add_foreign_key "locations", "beacons"
  add_foreign_key "locations", "users"
end
