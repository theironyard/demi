# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141101211311) do

  create_table "api_keys", force: true do |t|
    t.integer  "user_id"
    t.string   "nonce"
    t.datetime "expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "api_keys", ["user_id"], name: "index_api_keys_on_user_id"

  create_table "assignments", force: true do |t|
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "goals", force: true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resources", force: true do |t|
    t.string   "url"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "timelines", force: true do |t|
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "timelines", ["course_id"], name: "index_timelines_on_course_id"

  create_table "users", force: true do |t|
    t.string   "email",               default: "",        null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0,         null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role",                default: "peasant"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

  create_table "week_assignments", id: false, force: true do |t|
    t.integer "assignment_id", null: false
    t.integer "week_id",       null: false
  end

  add_index "week_assignments", ["week_id", "assignment_id"], name: "index_assignments_weeks_on_week_id_and_assignment_id"

  create_table "week_goals", id: false, force: true do |t|
    t.integer "goal_id", null: false
    t.integer "week_id", null: false
  end

  add_index "week_goals", ["week_id", "goal_id"], name: "index_goals_weeks_on_week_id_and_goal_id"

  create_table "week_resources", id: false, force: true do |t|
    t.integer "resource_id", null: false
    t.integer "week_id",     null: false
  end

  add_index "week_resources", ["week_id", "resource_id"], name: "index_resources_weeks_on_week_id_and_resource_id"

  create_table "weeks", force: true do |t|
    t.integer  "timeline_id"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "weeks", ["timeline_id"], name: "index_weeks_on_timeline_id"

end
