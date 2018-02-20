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

ActiveRecord::Schema.define(version: 20180220141557) do

  create_table "orders", force: :cascade do |t|
    t.string   "visa"
    t.boolean  "fast_track"
    t.boolean  "private_letter"
    t.integer  "amount"
    t.string   "speed"
    t.string   "border_point"
    t.date     "entry_date"
    t.string   "email"
    t.string   "customer_name"
    t.string   "phone"
    t.string   "passport_number"
    t.string   "passport_name"
    t.string   "nationality"
    t.date     "passport_issued"
    t.date     "passport_end"
    t.string   "gender"
    t.date     "birthday"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "status"
    t.integer  "qty"
  end

  create_table "passports", force: :cascade do |t|
    t.integer  "order_id"
    t.string   "number"
    t.string   "nationality"
    t.string   "gender"
    t.date     "issue_date"
    t.date     "finish_date"
    t.string   "name"
    t.date     "birhday"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "passports", ["order_id"], name: "index_passports_on_order_id"

  create_table "visas", force: :cascade do |t|
    t.string   "name"
    t.string   "category"
    t.integer  "price"
    t.text     "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
