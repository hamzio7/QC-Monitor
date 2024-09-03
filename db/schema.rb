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

ActiveRecord::Schema[7.1].define(version: 2024_09_03_170053) do
  create_table "line_stops", force: :cascade do |t|
    t.string "date"
    t.string "line_number"
    t.string "time_stopped"
    t.string "time_restarted"
    t.string "reason"
    t.string "shift"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "production_day_id"
  end

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
    t.integer "production_day_id"
  end

  create_table "pallets", force: :cascade do |t|
    t.string "pallet_number", null: false
    t.string "production_date"
    t.string "production_time"
    t.string "color_number"
    t.string "quantity"
    t.string "customer", null: false
    t.string "initial_grammage"
    t.string "final_grammage_min"
    t.string "final_grammage_max"
    t.string "cloudy_time"
    t.string "gel_time"
    t.string "volatile_content_set_min"
    t.string "volatile_content_set_max"
    t.string "volatile_content_min"
    t.string "volatile_content_max"
    t.string "glossiness"
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
    t.string "grammage_min_set"
    t.string "grammage_max_set"
    t.integer "production_day_id", null: false
    t.string "line_speed"
    t.string "final_date"
    t.string "actions_taken"
    t.string "shift"
    t.string "dimensions"
    t.string "finish"
    t.string "press_quality"
    t.string "pallet_quality"
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

  create_table "resin_programs", force: :cascade do |t|
    t.string "date"
    t.string "time"
    t.string "uf_wlf"
    t.string "uf_837"
    t.string "uf_1448"
    t.string "mf_es700"
    t.string "mf_es501"
    t.string "mf_1010"
    t.string "mf_837"
    t.string "mf_1014"
    t.string "uf_tank_num"
    t.string "mf_tank_num"
    t.string "mixing_1"
    t.string "mixing_2"
    t.string "shift"
    t.string "line"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "production_day_id"
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
    t.integer "production_day_id"
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
