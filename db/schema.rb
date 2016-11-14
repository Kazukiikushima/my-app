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

ActiveRecord::Schema.define(version: 20161114085108) do

  create_table "contacts", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.text     "comment"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "contacts", ["receiver_id"], name: "index_contacts_on_receiver_id"
  add_index "contacts", ["sender_id"], name: "index_contacts_on_sender_id"

  create_table "dwellings", force: :cascade do |t|
    t.integer  "estimate_id"
    t.integer  "person_id"
    t.text     "comment"
    t.date     "start_time"
    t.date     "end_time"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "dwellings", ["estimate_id"], name: "index_dwellings_on_estimate_id"
  add_index "dwellings", ["person_id"], name: "index_dwellings_on_person_id"

  create_table "estimates", force: :cascade do |t|
    t.string   "name"
    t.integer  "fee"
    t.string   "floortype"
    t.text     "comment"
    t.string   "place"
    t.integer  "realtor_id"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "vacants"
    t.string   "avatar"
  end

  add_index "estimates", ["realtor_id"], name: "index_estimates_on_realtor_id"

  create_table "favorites", force: :cascade do |t|
    t.integer  "estimate_id"
    t.integer  "person_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "favorites", ["estimate_id"], name: "index_favorites_on_estimate_id"
  add_index "favorites", ["person_id"], name: "index_favorites_on_person_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "phonenumber"
    t.string   "sex"
    t.string   "job"
    t.integer  "age"
    t.text     "comment"
    t.string   "type"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
