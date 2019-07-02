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

ActiveRecord::Schema.define(version: 2019_07_02_021812) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "answer_avaliations", force: :cascade do |t|
    t.bigint "avaliation_id"
    t.string "answers", default: [], array: true
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "student_id"
    t.index ["avaliation_id"], name: "index_answer_avaliations_on_avaliation_id"
    t.index ["student_id"], name: "index_answer_avaliations_on_student_id"
  end

  create_table "answers", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "questionnaire_id"
    t.string "answers", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["questionnaire_id"], name: "index_answers_on_questionnaire_id"
    t.index ["student_id"], name: "index_answers_on_student_id"
  end

  create_table "avaliation_questions", force: :cascade do |t|
    t.text "Statement"
    t.string "altA"
    t.string "altB"
    t.string "altC"
    t.string "altD"
    t.string "altE"
    t.bigint "avaliation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["avaliation_id"], name: "index_avaliation_questions_on_avaliation_id"
  end

  create_table "avaliations", force: :cascade do |t|
    t.boolean "model"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "subject_id"
    t.bigint "teacher_id"
    t.index ["subject_id"], name: "index_avaliations_on_subject_id"
    t.index ["teacher_id"], name: "index_avaliations_on_teacher_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grades", force: :cascade do |t|
    t.integer "grade"
    t.bigint "student_id"
    t.bigint "questionnaire_id"
    t.bigint "subject_id"
    t.bigint "schoolroom_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["questionnaire_id"], name: "index_grades_on_questionnaire_id"
    t.index ["schoolroom_id"], name: "index_grades_on_schoolroom_id"
    t.index ["student_id"], name: "index_grades_on_student_id"
    t.index ["subject_id"], name: "index_grades_on_subject_id"
  end

  create_table "questionnaires", force: :cascade do |t|
    t.integer "noQuestion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "subject_id"
    t.bigint "user_id"
    t.boolean "avaliable", default: false
    t.index ["subject_id"], name: "index_questionnaires_on_subject_id"
    t.index ["user_id"], name: "index_questionnaires_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "textStatement"
    t.string "altA"
    t.string "altB"
    t.string "altC"
    t.string "altD"
    t.string "altE"
    t.string "correctAlt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "questionnaire_id"
    t.boolean "alternatives"
    t.index ["questionnaire_id"], name: "index_questions_on_questionnaire_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schoolrooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "schoolroom_id"
    t.index ["schoolroom_id"], name: "index_students_on_schoolroom_id"
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "subjectName"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "teacher_id"
    t.index ["teacher_id"], name: "index_subjects_on_teacher_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_teachers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "regNumber"
    t.bigint "role_id"
    t.string "firstName"
    t.string "lastName"
    t.boolean "admin"
    t.date "birth"
    t.string "subjects", default: [], array: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "answer_avaliations", "avaliations"
  add_foreign_key "answer_avaliations", "students"
  add_foreign_key "answers", "questionnaires"
  add_foreign_key "answers", "students"
  add_foreign_key "avaliation_questions", "avaliations"
  add_foreign_key "avaliations", "subjects"
  add_foreign_key "avaliations", "teachers"
  add_foreign_key "grades", "questionnaires"
  add_foreign_key "grades", "schoolrooms"
  add_foreign_key "grades", "students"
  add_foreign_key "grades", "subjects"
  add_foreign_key "questionnaires", "users"
  add_foreign_key "questions", "questionnaires"
  add_foreign_key "students", "schoolrooms"
  add_foreign_key "students", "users"
  add_foreign_key "subjects", "teachers"
  add_foreign_key "teachers", "users"
  add_foreign_key "users", "roles"
end
