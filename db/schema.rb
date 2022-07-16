# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_07_15_145751) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.text "body", default: "", null: false
    t.bigint "user_id", null: false
    t.string "commentable_type"
    t.bigint "commentable_id"
    t.datetime "delete_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "favoriteable_type"
    t.bigint "favoriteable_id"
    t.datetime "delete_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["favoriteable_type", "favoriteable_id"], name: "index_favorites_on_favoriteable"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "invitations", force: :cascade do |t|
    t.bigint "recipient_id", null: false
    t.boolean "agree"
    t.datetime "delete_at"
    t.index ["recipient_id"], name: "index_invitations_on_recipient_id"
  end

  create_table "marks", force: :cascade do |t|
    t.string "color", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "sender_id", null: false
    t.bigint "recipient_id", null: false
    t.string "body", default: "", null: false
    t.datetime "read_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recipient_id"], name: "index_notifications_on_recipient_id"
    t.index ["sender_id"], name: "index_notifications_on_sender_id"
  end

  create_table "project_marks", force: :cascade do |t|
    t.bigint "mark_id", null: false
    t.bigint "project_id", null: false
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["mark_id"], name: "index_project_marks_on_mark_id"
    t.index ["project_id"], name: "index_project_marks_on_project_id"
  end

  create_table "project_members", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_project_members_on_project_id"
    t.index ["user_id"], name: "index_project_members_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title", null: false
    t.bigint "author_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "delete_at"
    t.string "short_title", default: ""
    t.integer "status"
    t.index ["author_id"], name: "index_projects_on_author_id"
  end

  create_table "task_project_marks", force: :cascade do |t|
    t.bigint "project_mark_id", null: false
    t.bigint "task_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_mark_id"], name: "index_task_project_marks_on_project_mark_id"
    t.index ["task_id"], name: "index_task_project_marks_on_task_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title", default: "", null: false
    t.integer "status", default: 0, null: false
    t.bigint "author_id", null: false
    t.bigint "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "delete_at"
    t.integer "position", default: 0, null: false
    t.integer "priority", default: 0, null: false
    t.bigint "executor_id"
    t.index ["author_id"], name: "index_tasks_on_author_id"
    t.index ["executor_id"], name: "index_tasks_on_executor_id"
    t.index ["project_id"], name: "index_tasks_on_project_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username", default: "", null: false
    t.boolean "online", default: false
    t.string "locale", default: "en", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comments", "users"
  add_foreign_key "favorites", "users"
  add_foreign_key "invitations", "users", column: "recipient_id"
  add_foreign_key "notifications", "users", column: "recipient_id"
  add_foreign_key "notifications", "users", column: "sender_id"
  add_foreign_key "project_marks", "marks"
  add_foreign_key "project_marks", "projects"
  add_foreign_key "project_members", "projects"
  add_foreign_key "project_members", "users"
  add_foreign_key "projects", "users", column: "author_id"
  add_foreign_key "task_project_marks", "project_marks"
  add_foreign_key "task_project_marks", "tasks"
  add_foreign_key "tasks", "projects"
  add_foreign_key "tasks", "users", column: "author_id"
  add_foreign_key "tasks", "users", column: "executor_id"
end
