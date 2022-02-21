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

ActiveRecord::Schema.define(version: 2022_02_21_155659) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hero_powers", force: :cascade do |t|
    t.bigint "powers_id", null: false
    t.bigint "heros_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["heros_id"], name: "index_hero_powers_on_heros_id"
    t.index ["powers_id"], name: "index_hero_powers_on_powers_id"
  end

  create_table "heros", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.integer "price"
    t.bigint "users_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["users_id"], name: "index_heros_on_users_id"
  end

  create_table "missions", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.string "status"
    t.string "location"
    t.text "content"
    t.string "title"
    t.bigint "users_id", null: false
    t.bigint "heros_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["heros_id"], name: "index_missions_on_heros_id"
    t.index ["users_id"], name: "index_missions_on_users_id"
  end

  create_table "powers", force: :cascade do |t|
    t.string "power"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "comment"
    t.bigint "users_id", null: false
    t.bigint "heros_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["heros_id"], name: "index_reviews_on_heros_id"
    t.index ["users_id"], name: "index_reviews_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "hero_powers", "heros", column: "heros_id"
  add_foreign_key "hero_powers", "powers", column: "powers_id"
  add_foreign_key "heros", "users", column: "users_id"
  add_foreign_key "missions", "heros", column: "heros_id"
  add_foreign_key "missions", "users", column: "users_id"
  add_foreign_key "reviews", "heros", column: "heros_id"
  add_foreign_key "reviews", "users", column: "users_id"
end
