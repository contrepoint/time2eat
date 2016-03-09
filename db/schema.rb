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

ActiveRecord::Schema.define(version: 20160308093725) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "eating_places", force: :cascade do |t|
    t.text     "name"
    t.text     "description"
    t.text     "food_type"
    t.text     "price_range"
    t.text     "house_number"
    t.text     "street_name"
    t.text     "city"
    t.text     "state"
    t.text     "postcode"
    t.text     "country"
    t.float    "lat"
    t.float    "lng"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "question_options", force: :cascade do |t|
    t.integer  "question_id"
    t.text     "option_text"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "group_id"
    t.text     "question_text"
    t.string   "question_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.string   "role"
    t.integer  "question_options_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "users_groups", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.string   "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "voter_id"
    t.integer  "question_options_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

end