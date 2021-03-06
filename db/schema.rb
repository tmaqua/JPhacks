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

ActiveRecord::Schema.define(version: 20151126125829) do

  create_table "plains", force: :cascade do |t|
    t.string   "boke_origin"
    t.string   "tsukkomi_origin"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "boke_basic"
    t.string   "tsukkomi_basic"
  end

  add_index "plains", ["boke_origin"], name: "index_plains_on_boke_origin"

end
