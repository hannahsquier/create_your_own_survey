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

ActiveRecord::Schema.define(version: 20160809044115) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "mc_options", force: :cascade do |t|
    t.string   "option"
    t.integer  "mc_question_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "mc_options", ["mc_question_id"], name: "index_mc_options_on_mc_question_id", using: :btree

  create_table "mc_questions", force: :cascade do |t|
    t.integer  "survey_id"
    t.text     "question_text",             null: false
    t.integer  "num_options",   default: 0, null: false
    t.boolean  "required",                  null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "mc_questions", ["survey_id"], name: "index_mc_questions_on_survey_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.string   "question_type"
    t.integer  "question_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "survey_id"
  end

  add_index "questions", ["question_type", "question_id"], name: "index_questions_on_question_type_and_question_id", using: :btree
  add_index "questions", ["survey_id"], name: "index_questions_on_survey_id", using: :btree

  create_table "range_questions", force: :cascade do |t|
    t.integer  "survey_id"
    t.text     "question_text", null: false
    t.integer  "min",           null: false
    t.integer  "max",           null: false
    t.boolean  "required",      null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "range_questions", ["survey_id"], name: "index_range_questions_on_survey_id", using: :btree

  create_table "surveys", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_foreign_key "mc_options", "mc_questions"
  add_foreign_key "mc_questions", "surveys"
  add_foreign_key "range_questions", "surveys"
end
