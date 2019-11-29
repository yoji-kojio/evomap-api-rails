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

ActiveRecord::Schema.define(version: 2019_11_29_133614) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "careers", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "careers_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "career_id", null: false
    t.index ["career_id", "user_id"], name: "index_careers_users_on_career_id_and_user_id"
    t.index ["user_id", "career_id"], name: "index_careers_users_on_user_id_and_career_id"
  end

  create_table "contents", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contents_requirements", id: false, force: :cascade do |t|
    t.bigint "requirement_id", null: false
    t.bigint "content_id", null: false
    t.index ["content_id", "requirement_id"], name: "index_contents_requirements_on_content_id_and_requirement_id"
    t.index ["requirement_id", "content_id"], name: "index_contents_requirements_on_requirement_id_and_content_id"
  end

  create_table "requirements", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.text "description"
    t.bigint "career_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["career_id"], name: "index_requirements_on_career_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "authentication_token", limit: 30
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "requirements", "careers"
end
