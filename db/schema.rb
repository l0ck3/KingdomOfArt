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

ActiveRecord::Schema.define(version: 20170315215218) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.string   "status"
    t.integer  "product_id"
    t.integer  "user_id"
    t.integer  "artist_id"
    t.string   "offer_title"
    t.text     "offer_body"
    t.float    "offer_price"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "product_sku"
    t.string   "amount_currency", default: "EUR", null: false
    t.json     "payment"
    t.integer  "amount_cents",    default: 0,     null: false
    t.index ["product_id"], name: "index_orders_on_product_id", using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "picture"
    t.float    "old_price"
    t.integer  "user_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "sku"
    t.integer  "price_cents", default: 0, null: false
    t.index ["user_id"], name: "index_products_on_user_id", using: :btree
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "profile_type"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "picture"
    t.date     "birth_date"
    t.text     "biography"
    t.string   "address"
    t.string   "city"
    t.string   "country"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "universe_name"
    t.string   "universe_picture"
    t.float    "latitude"
    t.float    "longitude"
    t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "orders", "products"
  add_foreign_key "orders", "users"
  add_foreign_key "products", "users"
  add_foreign_key "profiles", "users"
end
