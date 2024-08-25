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

ActiveRecord::Schema[7.1].define(version: 2024_08_25_182654) do
  create_table "mf_tanks", force: :cascade do |t|
    t.string "date"
    t.float "initial_temp"
    t.integer "tank_number"
    t.float "ph"
    t.float "viscosity"
    t.float "density"
    t.integer "reaction_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "solid_content"
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
  end

  create_table "uf_tanks", force: :cascade do |t|
    t.string "date"
    t.float "initial_temp"
    t.integer "tank_number"
    t.float "ph"
    t.float "viscosity"
    t.float "density"
    t.integer "reaction_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "solid_content"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "shift"
    t.boolean "isAdmin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
