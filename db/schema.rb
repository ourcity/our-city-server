# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150513015008) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bodies", force: :cascade do |t|
    t.string   "name"
    t.integer  "body_type_id"
    t.boolean  "meet_flag"
    t.boolean  "active_flag"
    t.text     "description"
    t.integer  "person_id"
    t.string   "person_name"
    t.integer  "number_of_members"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "bodies", ["body_type_id"], name: "index_bodies_on_body_type_id", using: :btree
  add_index "bodies", ["person_id"], name: "index_bodies_on_person_id", using: :btree

  create_table "body_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.integer  "body_id"
    t.date     "date"
    t.string   "time"
    t.string   "agenda_status"
    t.string   "minute_status"
    t.string   "location"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "events", ["body_id"], name: "index_events_on_body_id", using: :btree

  create_table "matter_statuses", force: :cascade do |t|
    t.string   "name"
    t.boolean  "active_flag"
    t.string   "description"
    t.boolean  "used_flag"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "full_name"
    t.boolean  "active_flag"
    t.boolean  "used_sponsor_flag"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_foreign_key "bodies", "body_types"
  add_foreign_key "bodies", "people"
  add_foreign_key "events", "bodies"
end
