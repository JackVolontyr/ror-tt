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

ActiveRecord::Schema.define(version: 2019_04_03_163154) do

  create_table "carriages", force: :cascade do |t|
    t.integer "number"
    t.string "type"
    t.string "seats", default: "{\n        \"1\": true,\n        \"2\": true,\n        \"3\": true,\n        \"4\": true,\n        \"5\": true,\n        \"6\": true,\n        \"7\": true,\n        \"8\": true,\n        \"9\": true\n      }"
  end

  create_table "routes", force: :cascade do |t|
    t.string "name"
  end

  create_table "routes_stations", id: false, force: :cascade do |t|
    t.integer "route_id"
    t.integer "station_id"
    t.index ["route_id"], name: "index_routes_stations_on_route_id"
    t.index ["station_id"], name: "index_routes_stations_on_station_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
  end

  create_table "stations", force: :cascade do |t|
    t.string "name"
  end

  create_table "stations_tickets", id: false, force: :cascade do |t|
    t.integer "station_id"
    t.integer "ticket_id"
    t.index ["station_id"], name: "index_stations_tickets_on_station_id"
    t.index ["ticket_id"], name: "index_stations_tickets_on_ticket_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "train_id"
    t.integer "user_id"
    t.integer "station_first"
    t.integer "station_last"
    t.index ["station_first"], name: "index_tickets_on_station_first"
    t.index ["station_last"], name: "index_tickets_on_station_last"
    t.index ["train_id"], name: "index_tickets_on_train_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "trains", force: :cascade do |t|
    t.string "number"
    t.integer "route_id"
    t.index ["route_id"], name: "index_trains_on_route_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
  end

end
