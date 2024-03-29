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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121219215954) do

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "ticker"
    t.decimal  "market_cap"
    t.decimal  "enterprise_value"
    t.decimal  "sales_ltm"
    t.decimal  "sales_cy"
    t.decimal  "sales_cy_plus_one"
    t.decimal  "earnings_ltm"
    t.decimal  "earnings_cy"
    t.decimal  "earnings_cy_plus_one"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.decimal  "low_sales_cy"
    t.decimal  "high_sales_cy"
    t.decimal  "low_sales_cy_plus_one"
    t.decimal  "high_sales_cy_plus_one"
    t.decimal  "low_earnings_cy"
    t.decimal  "high_earnings_cy"
    t.decimal  "low_earnings_cy_plus_one"
    t.decimal  "high_earnings_cy_plus_one"
    t.decimal  "ev_ebitda"
    t.decimal  "stock_price"
    t.string   "group"
  end

end
