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

ActiveRecord::Schema.define(version: 20160325100903) do

  create_table "csvfiles", force: :cascade do |t|
    t.string "col1"
    t.string "col2"
    t.string "col3"
    t.string "col4"
    t.string "col5"
    t.string "col6"
    t.string "col7"
    t.string "col8"
    t.string "col9"
    t.string "col10"
    t.string "col11"
    t.string "col12"
    t.string "col13"
    t.string "col14"
    t.string "col15"
    t.string "col16"
    t.string "col17"
    t.string "col18"
    t.string "col19"
    t.string "col20"
    t.string "col21"
    t.string "col22"
    t.string "col23"
    t.string "col24"
    t.string "col25"
    t.string "col26"
    t.string "col27"
    t.string "col28"
    t.string "col29"
    t.string "col30"
    t.string "col31"
    t.string "col32"
    t.string "col33"
    t.string "col34"
    t.string "col35"
    t.string "col36"
    t.string "col37"
    t.string "col38"
    t.string "col39"
    t.string "col40"
  end

  create_table "order_items", force: :cascade do |t|
    t.string   "itemdescription"
    t.integer  "orderqty"
    t.integer  "receivedqty"
    t.integer  "remainingqty"
    t.string   "receivedby"
    t.integer  "order_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id"

  create_table "orderfiles", force: :cascade do |t|
    t.string   "projectcode"
    t.string   "projectname"
    t.string   "orderno"
    t.string   "orderdate"
    t.string   "suppliername"
    t.string   "orderitem"
    t.string   "orderqty"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string   "orderno"
    t.datetime "orderdate"
    t.string   "suppliername"
    t.string   "orderstatus"
    t.integer  "project_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "orders", ["project_id"], name: "index_orders_on_project_id"

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "projects", ["user_id"], name: "index_projects_on_user_id"

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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
