# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_05_29_184523) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accepted_currencies", force: :cascade do |t|
    t.bigint "municipality_id", null: false
    t.bigint "currency_id", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["currency_id"], name: "index_accepted_currencies_on_currency_id"
    t.index ["municipality_id"], name: "index_accepted_currencies_on_municipality_id"
  end

  create_table "currencies", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "symbol"
    t.string "decimal_mark", default: ".", null: false
    t.string "thousand_mark", default: ",", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_currencies_on_code", unique: true
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "municipalities", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_municipalities_on_slug", unique: true
  end

  create_table "packages", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.text "description"
    t.boolean "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_packages_on_slug", unique: true
  end

  create_table "price_updates", force: :cascade do |t|
    t.bigint "price_id", null: false
    t.decimal "amount_before"
    t.decimal "amount_after"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["price_id"], name: "index_price_updates_on_price_id"
  end

  create_table "prices", force: :cascade do |t|
    t.string "currency_code"
    t.bigint "currency_id", null: false
    t.bigint "package_id", null: false
    t.bigint "municipality_id", null: false
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["currency_id", "package_id", "municipality_id"], name: "index_prices_on_currency_id_and_package_id_and_municipality_id", unique: true
    t.index ["currency_id"], name: "index_prices_on_currency_id"
    t.index ["municipality_id"], name: "index_prices_on_municipality_id"
    t.index ["package_id"], name: "index_prices_on_package_id"
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.bigint "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  add_foreign_key "accepted_currencies", "currencies"
  add_foreign_key "accepted_currencies", "municipalities"
  add_foreign_key "price_updates", "prices"
  add_foreign_key "prices", "currencies"
  add_foreign_key "prices", "municipalities"
  add_foreign_key "prices", "packages"
end
