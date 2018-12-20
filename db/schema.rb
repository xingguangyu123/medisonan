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

ActiveRecord::Schema.define(version: 2018_12_12_053811) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.integer "question_type"
    t.integer "question_id"
    t.integer "patient_id"
    t.string "answer_single"
    t.boolean "answer_judge"
    t.text "subjective_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "answer_multiple", default: [], array: true
    t.integer "sub_survey_id"
    t.date "date_answer"
    t.index ["sub_survey_id"], name: "index_answers_on_sub_survey_id"
  end

  create_table "dummy_surveys", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "frequency"
    t.integer "interval"
  end

  create_table "patients", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "sex"
    t.string "sickHistory"
    t.string "mainDoctor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "medical_history"
    t.string "education_level"
    t.boolean "Smoking"
    t.string "father_age"
    t.string "father_sick_history"
    t.string "mother_age"
    t.string "mother_sick_history"
    t.integer "age"
    t.string "cellPhoneType"
    t.boolean "acceptSurvey"
    t.integer "surveyType"
    t.integer "smokeType"
    t.integer "smokeAmount"
    t.integer "smokeHistory"
    t.integer "alcoholType"
    t.integer "alcoholAmount"
    t.text "currentSick"
  end

  create_table "question_libraries", force: :cascade do |t|
    t.text "description"
    t.boolean "has_date_field"
    t.string "date_field_description"
    t.boolean "has_comment_field"
    t.string "comment_field_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "multipleselections", default: [], array: true
    t.text "selections", default: [], array: true
    t.integer "questiontype"
  end

  create_table "questions", force: :cascade do |t|
    t.integer "questiontype"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "selections", default: [], array: true
    t.text "multipleselections", default: [], array: true
    t.boolean "has_date_field"
    t.string "date_field_description"
    t.boolean "has_comment_field"
    t.string "comment_field_description"
  end

  create_table "sub_surveys", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.bigint "survey_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_id"], name: "index_sub_surveys_on_survey_id"
  end

  create_table "survey_patients", force: :cascade do |t|
    t.integer "survey_id"
    t.integer "patient_id"
    t.boolean "hasdone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hasdone"], name: "index_survey_patients_on_hasdone"
    t.index ["patient_id"], name: "index_survey_patients_on_patient_id"
    t.index ["survey_id", "patient_id"], name: "index_survey_patients_on_survey_id_and_patient_id", unique: true
    t.index ["survey_id"], name: "index_survey_patients_on_survey_id"
  end

  create_table "survey_questions", force: :cascade do |t|
    t.integer "survey_id"
    t.integer "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_survey_questions_on_question_id"
    t.index ["survey_id", "question_id"], name: "index_survey_questions_on_survey_id_and_question_id", unique: true
    t.index ["survey_id"], name: "index_survey_questions_on_survey_id"
  end

  create_table "surveys", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "start_date"
    t.date "end_date"
    t.integer "frequency"
    t.integer "interval"
  end

  add_foreign_key "sub_surveys", "surveys"
end
