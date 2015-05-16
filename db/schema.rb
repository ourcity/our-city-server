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

ActiveRecord::Schema.define(version: 20150516202533) do

  create_table "actions", force: :cascade do |t|
    t.string   "name"
    t.boolean  "active_flag"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

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

  add_index "bodies", ["body_type_id"], name: "index_bodies_on_body_type_id"
  add_index "bodies", ["person_id"], name: "index_bodies_on_person_id"

  create_table "body_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_items", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "action_id"
    t.integer  "matter_id"
    t.integer  "agenda_sequence"
    t.integer  "minutes_sequence"
    t.text     "agenda_note"
    t.text     "minutes_note"
    t.text     "action_name"
    t.boolean  "passed_flag"
    t.string   "passed_flag_name"
    t.boolean  "roll_call_flag"
    t.string   "title"
    t.string   "tally"
    t.integer  "consent"
    t.integer  "mover_id"
    t.integer  "seconder_id"
    t.text     "matter_type"
    t.text     "matter_status"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "event_items", ["action_id"], name: "index_event_items_on_action_id"
  add_index "event_items", ["event_id"], name: "index_event_items_on_event_id"
  add_index "event_items", ["matter_id"], name: "index_event_items_on_matter_id"

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

  add_index "events", ["body_id"], name: "index_events_on_body_id"

  create_table "matter_statuses", force: :cascade do |t|
    t.string   "name"
    t.boolean  "active_flag"
    t.string   "description"
    t.boolean  "used_flag"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "matter_types", force: :cascade do |t|
    t.string   "name"
    t.integer  "sort"
    t.boolean  "active_flag"
    t.text     "description"
    t.boolean  "used_flag"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "matters", force: :cascade do |t|
    t.string   "file"
    t.string   "name"
    t.string   "title"
    t.integer  "matter_type_id"
    t.integer  "matter_status_id"
    t.integer  "body_id"
    t.date     "intro_date"
    t.date     "agenda_date"
    t.date     "passed_date"
    t.date     "enactment_date"
    t.string   "enactment_number"
    t.string   "requester"
    t.text     "notes"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "matters", ["body_id"], name: "index_matters_on_body_id"
  add_index "matters", ["matter_status_id"], name: "index_matters_on_matter_status_id"
  add_index "matters", ["matter_type_id"], name: "index_matters_on_matter_type_id"

  create_table "people", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "full_name"
    t.boolean  "active_flag"
    t.boolean  "used_sponsor_flag"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "vote_types", force: :cascade do |t|
    t.string   "name"
    t.integer  "used_for"
    t.integer  "result"
    t.integer  "sort"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "person_id"
    t.string   "value_name"
    t.integer  "sort"
    t.integer  "result"
    t.integer  "event_item_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "vote_type_id"
  end

  add_index "votes", ["event_item_id"], name: "index_votes_on_event_item_id"
  add_index "votes", ["person_id"], name: "index_votes_on_person_id"
  add_index "votes", ["vote_type_id"], name: "index_votes_on_vote_type_id"

end
