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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121130220040) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.float    "weight"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "courses", :force => true do |t|
    t.integer  "task_id"
    t.string   "name"
    t.string   "semester"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "evals", :force => true do |t|
    t.string   "rating"
    t.text     "comments"
    t.integer  "task_id"
    t.integer  "team_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "evals", ["task_id"], :name => "index_evals_on_task_id"
  add_index "evals", ["team_id"], :name => "index_evals_on_team_id"

  create_table "grades", :force => true do |t|
    t.integer  "course_id"
    t.integer  "task_id"
    t.integer  "student_id"
    t.integer  "earned"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "grades", ["course_id"], :name => "index_grades_on_course_id"
  add_index "grades", ["student_id"], :name => "index_grades_on_student_id"
  add_index "grades", ["task_id"], :name => "index_grades_on_task_id"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "students", :force => true do |t|
    t.integer  "course_id"
    t.integer  "team_id"
    t.string   "username"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "students", ["course_id"], :name => "index_students_on_course_id"
  add_index "students", ["team_id"], :name => "index_students_on_team_id"

  create_table "tasks", :force => true do |t|
    t.integer  "course_id"
    t.integer  "category_id"
    t.string   "name"
    t.integer  "total"
    t.datetime "due_date"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "tasks", ["course_id"], :name => "index_tasks_on_course_id"

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.integer  "course_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "teams", ["course_id"], :name => "index_teams_on_course_id"

end
