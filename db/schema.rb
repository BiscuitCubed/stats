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

ActiveRecord::Schema.define(version: 20180328022420) do

  create_table "games", force: :cascade do |t|
    t.integer "player_id"
    t.integer "at_bat"
    t.integer "run"
    t.integer "hit"
    t.integer "walk"
    t.integer "run_batted_in"
    t.integer "home_run"
    t.integer "stolen_base"
    t.integer "strike_out"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.integer "number"
    t.integer "bats"
    t.boolean "throws"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
