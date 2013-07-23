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

ActiveRecord::Schema.define(version: 20130624200153) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "crowdblog_assets", force: true do |t|
    t.integer  "post_id"
    t.string   "attachment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "crowdblog_posts", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "permalink"
    t.datetime "published_at"
    t.integer  "author_id"
    t.string   "state"
    t.integer  "publisher_id"
    t.boolean  "ready_for_review"
    t.datetime "marked_for_review_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "crowdblog_users", force: true do |t|
    t.string "email"
    t.string "name"
  end

  create_table "events", force: true do |t|
    t.string   "name",        null: false
    t.text     "description", null: false
    t.datetime "date",        null: false
    t.string   "location",    null: false
    t.string   "contact",     null: false
    t.string   "organizer"
    t.integer  "identity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "slug"
  end

  add_index "events", ["identity_id"], name: "index_events_on_identity_id", using: :btree
  add_index "events", ["slug"], name: "index_events_on_slug", unique: true, using: :btree

  create_table "identities", force: true do |t|
    t.string   "provider",                   null: false
    t.string   "uid",                        null: false
    t.string   "username",                   null: false
    t.string   "email"
    t.boolean  "blocked",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
