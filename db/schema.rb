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

ActiveRecord::Schema.define(version: 20180420023402) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "detail_schedules", force: :cascade do |t|
    t.string "day"
    t.time "time_in"
    t.time "time_out_collation"
    t.time "time_in_collation"
    t.time "time_out"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "schedule_id"
    t.string "collation_time"
    t.string "work_time"
    t.index ["schedule_id"], name: "index_detail_schedules_on_schedule_id"
  end

  create_table "employee_schedules", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "schedule_id"
    t.bigint "employee_id"
    t.index ["employee_id"], name: "index_employee_schedules_on_employee_id"
    t.index ["schedule_id"], name: "index_employee_schedules_on_schedule_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "names"
    t.string "last_name"
    t.string "mother_last_name"
    t.string "rut"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fingerprints", force: :cascade do |t|
    t.string "hash_fingerprint"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "employee_id"
    t.integer "id_in_sensor"
    t.index ["employee_id"], name: "index_fingerprints_on_employee_id"
  end

  create_table "marks", force: :cascade do |t|
    t.datetime "date_time_mark"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "employee_id"
    t.string "aasm_state"
    t.bigint "type_mark_id"
    t.bigint "employee_schedule_id"
    t.index ["employee_id"], name: "index_marks_on_employee_id"
    t.index ["employee_schedule_id"], name: "index_marks_on_employee_schedule_id"
    t.index ["type_mark_id"], name: "index_marks_on_type_mark_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type_marks", force: :cascade do |t|
    t.string "name_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "detail_schedules", "schedules"
  add_foreign_key "employee_schedules", "employees"
  add_foreign_key "employee_schedules", "schedules"
  add_foreign_key "fingerprints", "employees"
  add_foreign_key "marks", "employee_schedules"
  add_foreign_key "marks", "employees"
  add_foreign_key "marks", "type_marks"
end
