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

ActiveRecord::Schema.define(version: 20150703070832) do

  create_table "books", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "author",       limit: 255
    t.string   "language",     limit: 255
    t.string   "details",      limit: 255
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "user_id",      limit: 255
    t.integer  "no_of_copies", limit: 4
    t.integer  "price",        limit: 4
    t.boolean  "purchasable",  limit: 1,   default: false
  end

  add_index "books", ["user_id"], name: "index_books_on_user_id", using: :btree

  create_table "countries", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "user_sessions", force: :cascade do |t|
    t.string   "session_id", limit: 255,   null: false
    t.text     "data",       limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_sessions", ["session_id"], name: "index_user_sessions_on_session_id", using: :btree
  add_index "user_sessions", ["updated_at"], name: "index_user_sessions_on_updated_at", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.string   "address",           limit: 255
    t.string   "email",             limit: 255
    t.string   "phone",             limit: 255
    t.string   "state",             limit: 255
    t.string   "country",           limit: 255
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.string   "book_name",         limit: 255
    t.integer  "book_count",        limit: 4,   default: 0
    t.string   "crypted_password",  limit: 255
    t.string   "password_salt",     limit: 255
    t.string   "persistence_token", limit: 255
    t.boolean  "role",              limit: 1,   default: false
    t.boolean  "activated",         limit: 1,   default: false
  end

end
