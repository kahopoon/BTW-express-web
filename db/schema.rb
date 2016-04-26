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

ActiveRecord::Schema.define(version: 20160425121536) do

  create_table "details", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "weight"
    t.integer  "prepay"
    t.integer  "fee"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "addressees_mobile"
    t.string   "addressees_name"
    t.text     "description"
  end

  add_index "details", ["order_id"], name: "index_details_on_order_id"

  create_table "orders", force: :cascade do |t|
    t.integer  "owner_id"
    t.integer  "courier_id"
    t.string   "status"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.datetime "pickup_time"
    t.datetime "deliver_time"
    t.text     "pickup_addr"
    t.text     "deliver_addr"
    t.string   "pickup_latlng"
    t.string   "deliver_latlng"
    t.string   "category"
    t.string   "photo"
    t.integer  "rate_owner"
    t.integer  "rate_courier"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "orders", ["courier_id"], name: "index_orders_on_courier_id"
  add_index "orders", ["owner_id"], name: "index_orders_on_owner_id"

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
    t.string   "fb_uid"
    t.string   "fb_token"
    t.string   "authentication_token"
    t.string   "phone"
    t.string   "fullname"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["fb_uid"], name: "index_users_on_fb_uid"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
