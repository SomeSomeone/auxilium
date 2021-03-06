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

ActiveRecord::Schema.define(version: 20160216233308) do

  create_table "answers", force: :cascade do |t|
    t.string   "content"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id"

  create_table "questions", force: :cascade do |t|
    t.text     "text"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "correct_answer_id"
    t.integer  "level"
  end

  add_index "questions", ["correct_answer_id"], name: "index_questions_on_correct_answer_id"

  create_table "questions_results", id: false, force: :cascade do |t|
    t.integer "result_id"
    t.integer "question_id"
  end

  add_index "questions_results", ["question_id"], name: "index_questions_results_on_question_id"
  add_index "questions_results", ["result_id", "question_id"], name: "index_questions_results_on_result_id_and_question_id"

  create_table "results", force: :cascade do |t|
    t.integer  "question_count"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "results", ["user_id"], name: "index_results_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "mail"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
