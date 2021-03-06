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

ActiveRecord::Schema.define(version: 20180511201011) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carted_dishes", force: :cascade do |t|
    t.string   "status"
    t.integer  "user_id"
    t.integer  "dish_id"
    t.integer  "quantity"
    t.integer  "order_id"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "session_id"
    t.text     "comments"
    t.string   "make_your_own"
    t.decimal  "price",              precision: 7, scale: 2
    t.string   "toppings"
    t.string   "salad_ingredients"
    t.string   "dressing"
    t.string   "dressing_placement"
    t.string   "salad_mix"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "tagline"
  end

  create_table "delivery_areas", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price",      precision: 5, scale: 2
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "dishes", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "price",          precision: 7, scale: 2
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "subcategory_id"
    t.string   "dressing"
    t.integer  "category_id"
  end

  create_table "images", force: :cascade do |t|
    t.string   "file_name"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "dish_id"
    t.integer  "salad_topping_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.decimal  "subtotal",         precision: 7, scale: 2
    t.decimal  "tax",              precision: 7, scale: 2
    t.decimal  "total",            precision: 7, scale: 2
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "ref_num"
    t.string   "email"
    t.string   "order_method"
    t.string   "delivery_address"
  end

  create_table "salad_ingredients", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "salad_toppings", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "image"
    t.decimal  "price",      precision: 7, scale: 2
  end

  create_table "subcategories", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "admin",           default: false
  end

end
