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

ActiveRecord::Schema.define(version: 20160511191004) do

  create_table "game_consoles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_consoles_games", id: false, force: :cascade do |t|
    t.integer  "game_consoles_id"
    t.integer  "games_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "game_consoles_games", ["game_consoles_id"], name: "index_game_consoles_games_on_game_consoles_id"
  add_index "game_consoles_games", ["games_id"], name: "index_game_consoles_games_on_games_id"

  create_table "game_genres", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_genres_games", id: false, force: :cascade do |t|
    t.integer  "game_genres_id"
    t.integer  "games_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "game_genres_games", ["game_genres_id"], name: "index_game_genres_games_on_game_genres_id"
  add_index "game_genres_games", ["games_id"], name: "index_game_genres_games_on_games_id"

  create_table "games", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "current_votes"
    t.integer  "game_progress"
    t.integer  "game_queue"
    t.integer  "hours_to_beat"
    t.string   "vote_command"
    t.string   "vote_file_name"
    t.boolean  "is_blind_playthrough"
    t.string   "wikipedia_link"
    t.string   "metacritic_link"
    t.string   "how_long_to_beat_link"
    t.string   "youtube_playlist_link"
  end

  create_table "vote_records", force: :cascade do |t|
    t.integer  "game_id"
    t.datetime "vote_record_date"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "vote_total"
  end

  add_index "vote_records", ["game_id"], name: "index_vote_records_on_game_id"

end
