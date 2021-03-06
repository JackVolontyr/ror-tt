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

ActiveRecord::Schema.define(version: 2019_08_02_111144) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.text "body"
    t.bigint "question_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "attachments", force: :cascade do |t|
    t.string "file"
    t.bigint "attachmentable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "attachmentable_type"
    t.index ["attachmentable_id"], name: "index_attachments_on_attachmentable_id"
    t.index ["attachmentable_type"], name: "index_attachments_on_attachmentable_type"
  end

  create_table "carriages", force: :cascade do |t|
    t.integer "number"
    t.string "carriage_type"
    t.string "seats"
    t.bigint "train_id"
    t.integer "top_seats"
    t.integer "bottom_seats"
    t.integer "side_top_seats"
    t.integer "side_bottom_seats"
    t.string "type"
    t.integer "position"
    t.index ["train_id"], name: "index_carriages_on_train_id"
  end

  create_table "orders", id: false, force: :cascade do |t|
    t.bigint "station_id"
    t.bigint "ticket_id"
    t.index ["station_id"], name: "index_orders_on_station_id"
    t.index ["ticket_id"], name: "index_orders_on_ticket_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "routes", force: :cascade do |t|
    t.string "name"
  end

  create_table "stations", force: :cascade do |t|
    t.string "name"
  end

  create_table "tickets", force: :cascade do |t|
    t.bigint "train_id"
    t.bigint "user_id"
    t.integer "station_first_id"
    t.integer "station_last_id"
    t.string "name"
    t.string "user_name"
    t.integer "route_id"
    t.string "comments"
    t.date "date"
    t.index ["station_first_id"], name: "index_tickets_on_station_first_id"
    t.index ["station_last_id"], name: "index_tickets_on_station_last_id"
    t.index ["train_id"], name: "index_tickets_on_train_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "trains", force: :cascade do |t|
    t.string "number"
    t.bigint "route_id"
    t.index ["route_id"], name: "index_trains_on_route_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "ways", force: :cascade do |t|
    t.bigint "station_id"
    t.bigint "route_id"
    t.integer "position", default: 1, null: false
    t.string "arrival", default: "2x:xx"
    t.string "departure", default: "2x:xx"
    t.index ["route_id"], name: "index_ways_on_route_id"
    t.index ["station_id"], name: "index_ways_on_station_id"
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users"
  add_foreign_key "questions", "users"
end
