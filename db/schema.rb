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

ActiveRecord::Schema.define(version: 20160731140810) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chained_letters", force: :cascade do |t|
    t.string   "first_letter"
    t.string   "second_letter"
    t.integer  "occurences",    default: 0
    t.decimal  "frequency",     default: 0.0
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "language_id"
  end

  add_index "chained_letters", ["first_letter"], name: "index_chained_letters_on_first_letter", using: :btree
  add_index "chained_letters", ["language_id"], name: "index_chained_letters_on_language_id", using: :btree
  add_index "chained_letters", ["second_letter"], name: "index_chained_letters_on_second_letter", using: :btree

  create_table "first_letters", force: :cascade do |t|
    t.string   "letter"
    t.integer  "occurences",  default: 0
    t.decimal  "frequency",   default: 0.0
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "language_id"
  end

  add_index "first_letters", ["language_id"], name: "index_first_letters_on_language_id", using: :btree
  add_index "first_letters", ["letter"], name: "index_first_letters_on_letter", using: :btree

  create_table "languages", force: :cascade do |t|
    t.string   "locale"
    t.string   "name"
    t.string   "local_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "chained_letters", "languages"
  add_foreign_key "first_letters", "languages"
end
