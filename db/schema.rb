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

ActiveRecord::Schema.define(version: 20171027102432) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.string "images_link"
    t.string "videos_link"
    t.string "assignment_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "job_seekers_id"
    t.index ["job_seekers_id"], name: "index_assignments_on_job_seekers_id"
  end

  create_table "available_dates", force: :cascade do |t|
    t.string "internfrom"
    t.string "internto"
    t.string "projectfrom"
    t.string "projectto"
    t.string "fulltimefrom"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "job_seekers_id"
    t.index ["job_seekers_id"], name: "index_available_dates_on_job_seekers_id"
  end

  create_table "awards", force: :cascade do |t|
    t.bigint "job_seekers_id"
    t.string "award_name"
    t.string "award_description"
    t.date "year_of_the_award"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_seekers_id"], name: "index_awards_on_job_seekers_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "education_details", force: :cascade do |t|
    t.bigint "job_seekers_id"
    t.string "university"
    t.string "course_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "graduation"
    t.string "place"
    t.string "grade"
    t.date "fromdate"
    t.date "todate"
    t.index ["job_seekers_id"], name: "index_education_details_on_job_seekers_id"
  end

  create_table "experiance_details", force: :cascade do |t|
    t.bigint "job_seekers_id"
    t.string "organisation_name"
    t.string "place"
    t.date "start_date"
    t.date "end_date"
    t.string "designation"
    t.string "work_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_seekers_id"], name: "index_experiance_details_on_job_seekers_id"
  end

  create_table "job_applications", force: :cascade do |t|
    t.bigint "job_seekers_id"
    t.bigint "job_listings_id"
    t.date "apply_date"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_listings_id"], name: "index_job_applications_on_job_listings_id"
    t.index ["job_seekers_id"], name: "index_job_applications_on_job_seekers_id"
  end

  create_table "job_listings", force: :cascade do |t|
    t.bigint "recruiters_id"
    t.string "job_title"
    t.string "job_type"
    t.string "job_location"
    t.string "job_category"
    t.string "job_period"
    t.string "job_description"
    t.decimal "compensation"
    t.string "company_name"
    t.string "website"
    t.string "company_description"
    t.string "linkedin_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "phone_number"
    t.string "email"
    t.index ["recruiters_id"], name: "index_job_listings_on_recruiters_id"
  end

  create_table "job_seekers", force: :cascade do |t|
    t.bigint "users_id"
    t.string "preffered_role"
    t.string "prefferd_industry"
    t.string "preffered_location"
    t.string "preffered_organisation"
    t.decimal "current_salary"
    t.decimal "expected_salary"
    t.string "linkedin_link"
    t.string "skype_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "dob"
    t.string "profile_title"
    t.string "profile_description"
    t.string "carreer_aspiration"
    t.string "preffered_job_type"
    t.string "address"
    t.string "phone_number"
    t.index ["users_id"], name: "index_job_seekers_on_users_id"
  end

  create_table "language_knowns", force: :cascade do |t|
    t.string "english"
    t.string "spanish"
    t.string "scotish"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "job_seekers_id"
    t.index ["job_seekers_id"], name: "index_language_knowns_on_job_seekers_id"
  end

# Could not dump table "languages_knowns" because of following StandardError
#   Unknown type 'level' for column 'english'

  create_table "recruiters", force: :cascade do |t|
    t.bigint "users_id"
    t.string "organisation_name"
    t.string "designation"
    t.string "linkedin_link"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "email"
    t.string "mobilenumber"
    t.index ["users_id"], name: "index_recruiters_on_users_id"
  end

  create_table "shortlists", force: :cascade do |t|
    t.bigint "job_seekers_id"
    t.bigint "recruiters_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_seekers_id"], name: "index_shortlists_on_job_seekers_id"
    t.index ["recruiters_id"], name: "index_shortlists_on_recruiters_id"
  end

  create_table "skillsets", force: :cascade do |t|
    t.bigint "job_seekers_id"
    t.string "sill_name"
    t.string "skill_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_seekers_id"], name: "index_skillsets_on_job_seekers_id"
  end

  create_table "uploads", force: :cascade do |t|
    t.bigint "job_seekers_id"
    t.string "cover_letter"
    t.string "resume"
    t.string "video_pitch"
    t.string "sample_project"
    t.string "project_description"
    t.string "career_aspirations"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_seekers_id"], name: "index_uploads_on_job_seekers_id"
  end

# Could not dump table "users" because of following StandardError
#   Unknown type 'user_roles' for column 'roles'

  create_table "views", force: :cascade do |t|
    t.bigint "job_seekers_id"
    t.bigint "recruiters_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_seekers_id"], name: "index_views_on_job_seekers_id"
    t.index ["recruiters_id"], name: "index_views_on_recruiters_id"
  end

  add_foreign_key "assignments", "job_seekers", column: "job_seekers_id"
  add_foreign_key "available_dates", "job_seekers", column: "job_seekers_id"
  add_foreign_key "language_knowns", "job_seekers", column: "job_seekers_id"
end
