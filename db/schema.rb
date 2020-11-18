# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_18_110531) do

  create_table "customers", force: :cascade do |t|
    t.string "full_name"
    t.string "email"
    t.string "password"
    t.string "billing_address"
    t.string "shipping_address"
    t.string "city"
    t.integer "province_id", null: false
    t.string "country"
    t.string "phone_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "postal_code"
    t.index ["province_id"], name: "index_customers_on_province_id"
  end

  create_table "provinces", force: :cascade do |t|
    t.string "name"
    t.float "provincial_sales_tax"
    t.float "goods_and_services_tax"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "customers", "provinces"
end
