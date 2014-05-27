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

ActiveRecord::Schema.define(version: 20140527212658) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "interests", force: true do |t|
    t.string   "name",                              null: false
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "color",       default: "dark-blue", null: false
  end

  add_index "interests", ["name"], name: "index_interests_on_name", unique: true, using: :btree

  create_table "user_interests", force: true do |t|
    t.integer  "user_id"
    t.integer  "interest_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_interests", ["interest_id"], name: "index_user_interests_on_interest_id", using: :btree
  add_index "user_interests", ["user_id", "interest_id"], name: "index_user_interests_on_user_id_and_interest_id", unique: true, using: :btree
  add_index "user_interests", ["user_id"], name: "index_user_interests_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username",                    null: false
    t.text     "password_digest",             null: false
    t.string   "session_token",               null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sail_count",      default: 0, null: false
  end

  add_index "users", ["session_token"], name: "index_users_on_session_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "votes", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "website_id", null: false
    t.boolean  "upvote",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["user_id", "website_id"], name: "index_votes_on_user_id_and_website_id", unique: true, using: :btree
  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree
  add_index "votes", ["website_id"], name: "index_votes_on_website_id", using: :btree

  create_table "website_interests", force: true do |t|
    t.integer  "website_id",  null: false
    t.integer  "interest_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "website_interests", ["interest_id"], name: "index_website_interests_on_interest_id", using: :btree
  add_index "website_interests", ["website_id", "interest_id"], name: "index_website_interests_on_website_id_and_interest_id", unique: true, using: :btree
  add_index "website_interests", ["website_id"], name: "index_website_interests_on_website_id", using: :btree

  create_table "websites", force: true do |t|
    t.string   "url",          null: false
    t.string   "title",        null: false
    t.integer  "submitter_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "websites", ["url"], name: "index_websites_on_url", unique: true, using: :btree

end
