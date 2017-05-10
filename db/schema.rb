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

ActiveRecord::Schema.define(version: 20170510113444) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beacons", force: :cascade do |t|
    t.integer  "major",                   null: false
    t.integer  "minor",                   null: false
    t.string   "passcode",                null: false
    t.integer  "status",      default: 0
    t.integer  "user_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "major_minor",             null: false
    t.string   "name"
    t.index ["major", "minor"], name: "index_beacons_on_major_and_minor", unique: true, using: :btree
    t.index ["major_minor"], name: "index_beacons_on_major_minor", unique: true, using: :btree
    t.index ["user_id"], name: "index_beacons_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "name",            null: false
    t.string   "api_token",       null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["api_token"], name: "index_users_on_api_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "beacons", "users"
end
