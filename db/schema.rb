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

ActiveRecord::Schema[7.1].define(version: 2024_08_28_130052) do
  create_table "mf_tanks", force: :cascade do |t|
    t.string "date"
    t.float "initial_temp"
    t.integer "tank_number"
    t.float "ph"
    t.float "viscosity"
    t.float "density"
    t.string "reaction_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "solid_content"
    t.string "shift"
    t.string "time"
  end

  create_table "pallets", force: :cascade do |t|
    t.string "pallet_number", null: false
    t.string "production_date"
    t.string "production_time"
    t.integer "color_number", default: 1014
    t.integer "quantity", default: 1200
    t.string "customer", null: false
    t.integer "initial_grammage", default: 81
    t.float "final_grammage_min", null: false
    t.float "final_grammage_max", null: false
    t.string "cloudy_time"
    t.string "gel_time"
    t.float "volatile_content_set_min", default: 5.0
    t.float "volatile_content_set_max", default: 5.3
    t.float "volatile_content_min", null: false
    t.float "volatile_content_max", null: false
    t.integer "glossiness", null: false
    t.string "supervisor", null: false
    t.string "status", null: false
    t.string "stop_reason"
    t.text "info"
    t.string "final_supervisor"
    t.string "final_status"
    t.string "final_stop_reason"
    t.text "final_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "mf_tank_id"
    t.integer "uf_tank_id"
    t.float "grammage_min_set", default: 185.0
    t.float "grammage_max_set", default: 190.0
    t.integer "production_day_id", null: false
    t.integer "line_speed", default: 40
    t.string "final_date"
    t.string "actions_taken"
    t.string "dimensions", default: "368x186"
    t.string "shift"
    t.index ["production_day_id"], name: "index_pallets_on_production_day_id"
  end

  create_table "production_days", force: :cascade do |t|
    t.date "production_date"
    t.text "info"
    t.integer "stopped_pallets_count"
    t.integer "approved_pallets_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "shift"
  end

  create_table "uf_tanks", force: :cascade do |t|
    t.string "date"
    t.float "initial_temp"
    t.integer "tank_number"
    t.float "ph"
    t.float "viscosity"
    t.float "density"
    t.string "reaction_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "solid_content"
    t.string "time"
    t.string "shift"
  end

  create_table "users", force: :cascade do |t|
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "username"
    t.string "full_name"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "pallets", "production_days"
end
