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

ActiveRecord::Schema.define(version: 20160215190410) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "audio_clips", force: :cascade do |t|
    t.integer  "song_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "audio_file"
  end

  add_index "audio_clips", ["song_id"], name: "index_audio_clips_on_song_id", using: :btree

  create_table "bands", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bands_users", force: :cascade do |t|
    t.integer  "band_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "bands_users", ["band_id"], name: "index_bands_users_on_band_id", using: :btree
  add_index "bands_users", ["user_id"], name: "index_bands_users_on_user_id", using: :btree

  create_table "songs", force: :cascade do |t|
    t.string   "name"
    t.integer  "band_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "lyrics"
    t.integer  "position"
  end

  add_index "songs", ["band_id"], name: "index_songs_on_band_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "auth_token"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "band_id"
  end

  add_index "users", ["auth_token"], name: "index_users_on_auth_token", unique: true, using: :btree
  add_index "users", ["band_id"], name: "index_users_on_band_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "audio_clips", "songs"
  add_foreign_key "bands_users", "bands"
  add_foreign_key "bands_users", "users"
  add_foreign_key "songs", "bands"
  add_foreign_key "users", "bands"
end
