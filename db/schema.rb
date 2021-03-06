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

ActiveRecord::Schema.define(version: 20180807120722) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "street"
    t.string   "zip_code"
    t.string   "city"
    t.string   "phone_number"
    t.text     "address_complement"
    t.string   "address_title"
    t.string   "last_name"
    t.index ["user_id"], name: "index_addresses_on_user_id", using: :btree
  end

  create_table "attachinary_files", force: :cascade do |t|
    t.string   "attachinariable_type"
    t.integer  "attachinariable_id"
    t.string   "scope"
    t.string   "public_id"
    t.string   "version"
    t.integer  "width"
    t.integer  "height"
    t.string   "format"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent", using: :btree
  end

  create_table "campaigns", force: :cascade do |t|
    t.integer  "seed_id"
    t.string   "status",     default: "pending"
    t.float    "price"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["seed_id"], name: "index_campaigns_on_seed_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
    t.index ["slug"], name: "index_categories_on_slug", unique: true, using: :btree
  end

  create_table "exchanges", force: :cascade do |t|
    t.integer  "pick_id"
    t.text     "question"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "user_id"
    t.boolean  "admin_review", default: false
    t.index ["pick_id"], name: "index_exchanges_on_pick_id", using: :btree
    t.index ["user_id"], name: "index_exchanges_on_user_id", using: :btree
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "picks", force: :cascade do |t|
    t.float    "price"
    t.integer  "seed_id"
    t.integer  "user_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "amount_cents",       default: 0,         null: false
    t.string   "state",              default: "pending"
    t.jsonb    "payment"
    t.string   "first_name"
    t.string   "street"
    t.string   "zip_code"
    t.string   "city"
    t.string   "phone_number"
    t.string   "address_complement"
    t.jsonb    "deal_price"
    t.string   "last_name"
    t.boolean  "reminder",           default: false
    t.string   "size"
    t.index ["seed_id"], name: "index_picks_on_seed_id", using: :btree
    t.index ["user_id"], name: "index_picks_on_user_id", using: :btree
  end

  create_table "seeds", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "expiration",           default: '2018-07-23 12:46:39'
    t.integer  "category_id"
    t.integer  "user_id"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.integer  "popularity",           default: 0
    t.string   "url"
    t.integer  "view_counter",         default: 0
    t.string   "sale_point_url"
    t.string   "sale_point_contact"
    t.text     "official_description"
    t.float    "price"
    t.string   "admin_review",         default: "not-reviewed"
    t.string   "slug"
    t.string   "size_guide"
    t.float    "expedition_costs"
    t.string   "status",               default: "pending"
    t.index ["category_id"], name: "index_seeds_on_category_id", using: :btree
    t.index ["slug"], name: "index_seeds_on_slug", unique: true, using: :btree
    t.index ["user_id"], name: "index_seeds_on_user_id", using: :btree
  end

  create_table "signal_seeds", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "seed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["seed_id"], name: "index_signal_seeds_on_seed_id", using: :btree
    t.index ["user_id"], name: "index_signal_seeds_on_user_id", using: :btree
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
    t.string   "pseudo"
    t.string   "sex"
    t.date     "date_of_birth"
    t.boolean  "admin",                  default: false
    t.string   "city"
    t.text     "mini_bio"
    t.string   "insta"
    t.string   "youtube"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "customer_id"
    t.string   "slug"
    t.float    "reputation",             default: 1.0
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["slug"], name: "index_users_on_slug", unique: true, using: :btree
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "campaigns", "seeds"
  add_foreign_key "exchanges", "picks"
  add_foreign_key "picks", "seeds"
  add_foreign_key "picks", "users"
  add_foreign_key "seeds", "categories"
  add_foreign_key "seeds", "users"
  add_foreign_key "signal_seeds", "seeds"
  add_foreign_key "signal_seeds", "users"
end
