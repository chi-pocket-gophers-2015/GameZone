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

ActiveRecord::Schema.define(version: 20150520194120) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "user_id"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["game_id"], name: "index_comments_on_game_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "game_types", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "game_types", ["game_id"], name: "index_game_types_on_game_id", using: :btree
  add_index "game_types", ["type_id"], name: "index_game_types_on_type_id", using: :btree

  create_table "games", force: :cascade do |t|
    t.string   "title"
    t.integer  "players_min"
    t.integer  "players_max"
    t.integer  "duration"
    t.string   "complexity"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "ownerships", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "ownerships", ["game_id"], name: "index_ownerships_on_game_id", using: :btree
  add_index "ownerships", ["user_id"], name: "index_ownerships_on_user_id", using: :btree

  create_table "types", force: :cascade do |t|
    t.string   "phrase"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "user_id"
    t.integer  "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "votes", ["game_id"], name: "index_votes_on_game_id", using: :btree
  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree

  add_foreign_key "comments", "games"
  add_foreign_key "comments", "users"
  add_foreign_key "game_types", "games"
  add_foreign_key "game_types", "types"
  add_foreign_key "ownerships", "games"
  add_foreign_key "ownerships", "users"
  add_foreign_key "votes", "games"
  add_foreign_key "votes", "users"
end
