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

ActiveRecord::Schema.define(version: 2020_11_18_152645) do

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

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

  create_table "designers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "sneaker_id", null: false
    t.integer "order_id", null: false
    t.float "price"
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["sneaker_id"], name: "index_order_items_on_sneaker_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.float "total_price"
    t.string "shipping_address"
    t.string "order_address"
    t.string "order_email"
    t.date "order_date"
    t.string "order_status"
    t.integer "stripe_order_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  create_table "provinces", force: :cascade do |t|
    t.string "name"
    t.float "provincial_sales_tax"
    t.float "goods_and_services_tax"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sneakers", force: :cascade do |t|
    t.integer "brand_id", null: false
    t.integer "category_id", null: false
    t.integer "designer_id", null: false
    t.string "main_colour"
    t.string "colour_way"
    t.string "gender"
    t.text "grid_picture"
    t.text "main_picture"
    t.string "midsole"
    t.string "name"
    t.string "nickname"
    t.string "release_date"
    t.integer "price_cents"
    t.text "shoe_story"
    t.string "upper_material"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["brand_id"], name: "index_sneakers_on_brand_id"
    t.index ["category_id"], name: "index_sneakers_on_category_id"
    t.index ["designer_id"], name: "index_sneakers_on_designer_id"
  end

  add_foreign_key "customers", "provinces"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "sneakers"
  add_foreign_key "orders", "customers"
  add_foreign_key "sneakers", "brands"
  add_foreign_key "sneakers", "categories"
  add_foreign_key "sneakers", "designers"
end
