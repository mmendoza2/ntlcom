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

ActiveRecord::Schema.define(version: 20131008062311) do

  create_table "estados", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "estado"
    t.string   "slug"
    t.string   "poblacion"
  end

  add_index "estados", ["slug"], name: "index_estados_on_slug"

  create_table "eventos", force: true do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.datetime "fecha",              limit: 255
    t.string   "photo"
    t.string   "urloficial"
    t.string   "artista"
    t.string   "entradatipo"
    t.string   "precio"
    t.integer  "votos",              limit: 255
    t.string   "ranking"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "slug"
    t.string   "diaevento"
    t.string   "d1"
    t.string   "d2"
    t.string   "d3"
    t.string   "d4"
    t.string   "d5"
    t.string   "d6"
    t.string   "d7"
    t.string   "d8"
    t.string   "d9"
    t.string   "d10"
    t.string   "estado"
    t.string   "poblacion"
    t.integer  "principal"
    t.integer  "fechainicio"
    t.integer  "fechafin"
    t.integer  "mes"
    t.integer  "dia"
    t.integer  "actividad"
    t.string   "fotografia"
    t.integer  "institucion"
    t.integer  "user_id"
    t.integer  "estado_id"
  end

  add_index "eventos", ["slug"], name: "index_eventos_on_slug"

  create_table "locations", force: true do |t|
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "city"
    t.string   "state"
    t.string   "state_code"
    t.string   "postal_code"
    t.string   "country"
    t.string   "country_code"
    t.string   "distance"
  end

  create_table "microposts", force: true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "microposts", ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"

  create_table "micrositios", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "descripcion"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "photo"
    t.integer  "user_id"
  end

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "search_suggestions", force: true do |t|
    t.string   "term"
    t.integer  "popularity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
