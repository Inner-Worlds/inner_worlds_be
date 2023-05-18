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

ActiveRecord::Schema[7.0].define(version: 2023_05_17_230519) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dream_emotions", force: :cascade do |t|
    t.bigint "emotion_id", null: false
    t.bigint "dream_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dream_id"], name: "index_dream_emotions_on_dream_id"
    t.index ["emotion_id"], name: "index_dream_emotions_on_emotion_id"
  end

  create_table "dream_tags", force: :cascade do |t|
    t.bigint "dream_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dream_id"], name: "index_dream_tags_on_dream_id"
    t.index ["tag_id"], name: "index_dream_tags_on_tag_id"
  end

  create_table "dreams", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "description"
    t.integer "lucidity"
    t.string "title"
    t.datetime "dream_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_dreams_on_user_id"
  end

  create_table "emotions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "default", default: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "default", default: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "dream_emotions", "dreams"
  add_foreign_key "dream_emotions", "emotions"
  add_foreign_key "dream_tags", "dreams"
  add_foreign_key "dream_tags", "tags"
  add_foreign_key "dreams", "users"
end
