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

ActiveRecord::Schema[7.0].define(version: 2022_05_29_151802) do
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

  add_foreign_key "accepted_currencies", "currencies"
  add_foreign_key "accepted_currencies", "municipalities"
end
