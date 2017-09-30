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

ActiveRecord::Schema.define(version: 20170930213635) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "asks", force: :cascade do |t|
    t.string   "ask_type"
    t.string   "question"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "project_id"
    t.index ["project_id"], name: "index_asks_on_project_id", using: :btree
  end

  create_table "credits", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "project_id"
    t.index ["project_id"], name: "index_credits_on_project_id", using: :btree
  end

  create_table "project_testers", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "tester_id"
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_testers_on_project_id", using: :btree
    t.index ["tester_id"], name: "index_project_testers_on_tester_id", using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
    t.string   "url"
    t.string   "test_platform"
    t.string   "status"
    t.string   "url_html"
  end

  create_table "publics", force: :cascade do |t|
    t.integer  "age_range_start"
    t.integer  "age_range_end"
    t.string   "gender"
    t.string   "schooling"
    t.string   "locale"
    t.string   "role"
    t.string   "kind_of_disability"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "project_id"
    t.integer  "participants"
    t.index ["project_id"], name: "index_publics_on_project_id", using: :btree
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "objective"
    t.string   "url"
    t.string   "cenary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "project_id"
    t.index ["project_id"], name: "index_tasks_on_project_id", using: :btree
  end

  create_table "testers", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "age"
    t.string   "gender"
    t.string   "schooling"
    t.string   "locale"
    t.string   "role"
    t.string   "kind_of_disability"
    t.index ["email"], name: "index_testers_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_testers_on_reset_password_token", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "asks", "projects"
  add_foreign_key "credits", "projects"
  add_foreign_key "publics", "projects"
  add_foreign_key "tasks", "projects"
end
