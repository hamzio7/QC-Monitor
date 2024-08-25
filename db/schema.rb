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

ActiveRecord::Schema[7.1].define(version: 2024_08_22_070334) do
  create_table "pallets", force: :cascade do |t|
    t.string "pallet_number"
    t.date "production_date"
    t.time "production_time"
    t.integer "color_number"
    t.integer "quantity"
    t.string "customer"
    t.integer "initial_grammage"
    t.float "final_grammage_min"
    t.float "final_grammage_max"
    t.integer "uf_tank"
    t.integer "mf_tank"
    t.time "cloudy_time"
    t.time "gel_time"
    t.float "volatile_content_set_min"
    t.string "volatile_content_set_max"
    t.float "volatile_content_min"
    t.float "volatile_content_max"
    t.integer "glossiness"
    t.string "supervisor"
    t.string "status"
    t.string "stop_reason"
    t.text "info"
    t.string "final_supervisor"
    t.string "final_status"
    t.string "final_stop_reason"
    t.text "final_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
