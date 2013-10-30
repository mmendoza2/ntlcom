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

ActiveRecord::Schema.define(version: 20131030180356) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "estados", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "estado"
    t.string   "slug"
    t.string   "poblacion"
  end

  add_index "estados", ["slug"], name: "index_estados_on_slug", using: :btree

  create_table "eventos", force: true do |t|
    t.string    "nombre"
    t.string    "descripcion"
    t.timestamp "fecha",              precision: 6
    t.string    "photo"
    t.string    "urloficial"
    t.string    "artista"
    t.string    "entradatipo"
    t.string    "precio"
    t.integer   "votos"
    t.string    "ranking"
    t.datetime  "created_at"
    t.datetime  "updated_at"
    t.string    "photo_file_name"
    t.string    "photo_content_type"
    t.integer   "photo_file_size"
    t.datetime  "photo_updated_at"
    t.string    "slug"
    t.string    "diaevento"
    t.string    "d1"
    t.string    "d2"
    t.string    "d3"
    t.string    "d4"
    t.string    "d5"
    t.string    "d6"
    t.string    "d7"
    t.string    "d8"
    t.string    "d9"
    t.string    "d10"
    t.string    "estado"
    t.string    "poblacion"
    t.integer   "principal"
    t.integer   "fechainicio"
    t.integer   "fechafin"
    t.integer   "mes"
    t.integer   "dia"
    t.integer   "actividad"
    t.string    "fotografia"
    t.integer   "institucion"
    t.integer   "user_id"
    t.integer   "estado_id"
  end

  add_index "eventos", ["slug"], name: "index_eventos_on_slug", using: :btree

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

  add_index "microposts", ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at", using: :btree

  create_table "micrositios", force: true do |t|
    t.string   "name"
    t.string   "descripcion"
    t.string   "username"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.string   "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "slug"
    t.string   "title"
    t.string   "alias"
    t.string   "title_alias"
    t.string   "introtext"
    t.string   "fulltext"
    t.integer  "state"
    t.integer  "sectionid"
    t.integer  "mask"
    t.integer  "catid"
    t.datetime "created"
    t.integer  "created_by"
    t.string   "created_by_alias"
    t.datetime "modified"
    t.integer  "modified_by"
    t.integer  "checked_out"
    t.datetime "checked_out_time"
    t.datetime "publish_up"
    t.datetime "publish_down"
    t.text     "images"
    t.text     "urls"
    t.text     "attribs"
    t.integer  "version"
    t.integer  "parentid"
    t.integer  "ordering"
    t.text     "metakey"
    t.text     "metadesc"
    t.integer  "acces"
    t.integer  "hits"
    t.text     "metadata"
    t.text     "imagen"
    t.text     "lugar"
    t.text     "munciudad"
    t.text     "mapa"
    t.text     "comollegar"
    t.integer  "votos"
    t.string   "fb_author"
    t.string   "tagcategorias"
    t.integer  "user_id"
    t.integer  "estado"
  end

  add_index "micrositios", ["slug"], name: "index_micrositios_on_slug", using: :btree

  create_table "relationeventos", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationeventos", ["followed_id"], name: "index_relationeventos_on_followed_id", using: :btree
  add_index "relationeventos", ["follower_id", "followed_id"], name: "index_relationeventos_on_follower_id_and_followed_id", unique: true, using: :btree
  add_index "relationeventos", ["follower_id"], name: "index_relationeventos_on_follower_id", using: :btree

  create_table "relationmicrositios", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationmicrositios", ["followed_id"], name: "index_relationmicrositios_on_followed_id", using: :btree
  add_index "relationmicrositios", ["follower_id", "followed_id"], name: "index_relationmicrositios_on_follower_id_and_followed_id", unique: true, using: :btree
  add_index "relationmicrositios", ["follower_id"], name: "index_relationmicrositios_on_follower_id", using: :btree

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id", using: :btree
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true, using: :btree
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id", using: :btree

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
    t.string   "slug"
    t.string   "username"
    t.string   "password"
    t.string   "usertype"
    t.integer  "block"
    t.integer  "sendEmail"
    t.integer  "gid"
    t.datetime "registerDate"
    t.datetime "lastvisitDate"
    t.string   "activation"
    t.text     "params"
    t.string   "fb_author"
    t.text     "ntlparam"
    t.string   "uid"
    t.string   "provider"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "avatar"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree
  add_index "users", ["slug"], name: "index_users_on_slug", using: :btree

end
