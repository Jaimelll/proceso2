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

ActiveRecord::Schema[7.0].define(version: 2022_11_09_181809) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "activities", force: :cascade do |t|
    t.integer "actividad"
    t.string "tipo"
    t.string "numero"
    t.date "pfecha"
    t.date "plan"
    t.integer "moneda"
    t.float "importe"
    t.string "obs"
    t.bigint "admin_user_id", null: false
    t.bigint "phase_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_user_id"], name: "index_activities_on_admin_user_id"
    t.index ["phase_id"], name: "index_activities_on_phase_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "periodo"
    t.integer "categoria"
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "formulas", force: :cascade do |t|
    t.string "nombre"
    t.string "descripcion"
    t.string "obs"
    t.integer "orden"
    t.integer "cantidad"
    t.integer "numero"
    t.integer "acti"
    t.integer "respon"
    t.integer "respon2"
    t.bigint "admin_user_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_user_id"], name: "index_formulas_on_admin_user_id"
    t.index ["product_id"], name: "index_formulas_on_product_id"
  end

  create_table "phases", force: :cascade do |t|
    t.string "nomenclatura"
    t.string "proceso"
    t.string "descripcion"
    t.integer "moneda"
    t.float "referencial"
    t.float "estimado"
    t.integer "periodo"
    t.integer "convocatoria"
    t.integer "sele"
    t.float "sele2"
    t.string "sele3"
    t.integer "sele4"
    t.integer "sele5"
    t.integer "sele6"
    t.integer "sele7"
    t.string "obs"
    t.bigint "admin_user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_user_id"], name: "index_phases_on_admin_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "nombre"
    t.string "descripcion"
    t.integer "orden"
    t.string "obs"
    t.bigint "admin_user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_user_id"], name: "index_products_on_admin_user_id"
  end

  add_foreign_key "activities", "admin_users"
  add_foreign_key "activities", "phases"
  add_foreign_key "formulas", "admin_users"
  add_foreign_key "formulas", "products"
  add_foreign_key "phases", "admin_users"
  add_foreign_key "products", "admin_users"
end
