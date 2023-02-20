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

ActiveRecord::Schema.define(version: 2023_02_19_155653) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cajagenerales", force: :cascade do |t|
    t.date "fecha"
    t.bigint "tiporegistro_id"
    t.bigint "concepto_id"
    t.bigint "subconcepto_id"
    t.bigint "tipocomprobante_id"
    t.string "nrocomprobante"
    t.string "nroordenpago"
    t.bigint "proveedor_id"
    t.bigint "formapago_id"
    t.decimal "importe"
    t.string "observacion"
    t.boolean "activo", default: true
    t.bigint "created_by_id"
    t.bigint "updated_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "canceled_by_id"
    t.datetime "canceled_at"
    t.index ["canceled_by_id"], name: "index_cajagenerales_on_canceled_by_id"
    t.index ["concepto_id"], name: "index_cajagenerales_on_concepto_id"
    t.index ["created_by_id"], name: "index_cajagenerales_on_created_by_id"
    t.index ["formapago_id"], name: "index_cajagenerales_on_formapago_id"
    t.index ["proveedor_id"], name: "index_cajagenerales_on_proveedor_id"
    t.index ["subconcepto_id"], name: "index_cajagenerales_on_subconcepto_id"
    t.index ["tipocomprobante_id"], name: "index_cajagenerales_on_tipocomprobante_id"
    t.index ["tiporegistro_id"], name: "index_cajagenerales_on_tiporegistro_id"
    t.index ["updated_by_id"], name: "index_cajagenerales_on_updated_by_id"
  end

  create_table "conceptos", force: :cascade do |t|
    t.string "descripcion"
    t.boolean "activo", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tiporegistro_id"
    t.index ["tiporegistro_id"], name: "index_conceptos_on_tiporegistro_id"
  end

  create_table "ctacteproveedores", force: :cascade do |t|
    t.date "fecha"
    t.bigint "proveedor_id"
    t.string "numerofactura"
    t.decimal "ingreso"
    t.decimal "egreso"
    t.boolean "activo", default: true
    t.datetime "canceled_at"
    t.bigint "created_by_id"
    t.bigint "updated_by_id"
    t.bigint "canceled_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["canceled_by_id"], name: "index_ctacteproveedores_on_canceled_by_id"
    t.index ["created_by_id"], name: "index_ctacteproveedores_on_created_by_id"
    t.index ["proveedor_id"], name: "index_ctacteproveedores_on_proveedor_id"
    t.index ["updated_by_id"], name: "index_ctacteproveedores_on_updated_by_id"
  end

  create_table "formapagos", force: :cascade do |t|
    t.string "descripcion"
    t.string "abreviacion"
    t.boolean "activo", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "permisos", force: :cascade do |t|
    t.string "url"
    t.string "descripcion"
    t.string "opcion"
    t.string "icono"
    t.boolean "activo", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "proveedores", force: :cascade do |t|
    t.string "descripcion"
    t.boolean "activo", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "created_by_id"
    t.bigint "updated_by_id"
    t.index ["created_by_id"], name: "index_proveedores_on_created_by_id"
    t.index ["updated_by_id"], name: "index_proveedores_on_updated_by_id"
  end

  create_table "subconceptos", force: :cascade do |t|
    t.string "descripcion"
    t.boolean "activo", default: true
    t.bigint "concepto_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["concepto_id"], name: "index_subconceptos_on_concepto_id"
  end

  create_table "subpermisos", force: :cascade do |t|
    t.string "url"
    t.string "descripcion"
    t.string "opcion"
    t.string "icono"
    t.boolean "activo", default: true
    t.bigint "permiso_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["permiso_id"], name: "index_subpermisos_on_permiso_id"
  end

  create_table "templates", force: :cascade do |t|
    t.string "codigo", limit: 50
    t.string "html"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipocomprobantes", force: :cascade do |t|
    t.string "descripcion"
    t.string "abreviacion"
    t.boolean "activo", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tiporegistros", force: :cascade do |t|
    t.string "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipousuario_permisos", force: :cascade do |t|
    t.bigint "tipousuario_id"
    t.bigint "permiso_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["permiso_id"], name: "index_tipousuario_permisos_on_permiso_id"
    t.index ["tipousuario_id"], name: "index_tipousuario_permisos_on_tipousuario_id"
  end

  create_table "tipousuario_subpermisos", force: :cascade do |t|
    t.bigint "tipousuario_id"
    t.bigint "subpermiso_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subpermiso_id"], name: "index_tipousuario_subpermisos_on_subpermiso_id"
    t.index ["tipousuario_id"], name: "index_tipousuario_subpermisos_on_tipousuario_id"
  end

  create_table "tipousuarios", force: :cascade do |t|
    t.string "descripcion"
    t.boolean "activo", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.string "nombre"
    t.string "apellido"
    t.string "dni"
    t.boolean "activo", default: true
    t.bigint "tipousuario_id"
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_usuarios_on_confirmation_token", unique: true
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
    t.index ["tipousuario_id"], name: "index_usuarios_on_tipousuario_id"
    t.index ["uid", "provider"], name: "index_usuarios_on_uid_and_provider", unique: true
  end

  add_foreign_key "cajagenerales", "conceptos"
  add_foreign_key "cajagenerales", "formapagos"
  add_foreign_key "cajagenerales", "subconceptos"
  add_foreign_key "cajagenerales", "tipocomprobantes"
  add_foreign_key "cajagenerales", "tiporegistros"
  add_foreign_key "cajagenerales", "usuarios", column: "canceled_by_id"
  add_foreign_key "cajagenerales", "usuarios", column: "created_by_id"
  add_foreign_key "cajagenerales", "usuarios", column: "updated_by_id"
  add_foreign_key "conceptos", "tiporegistros"
  add_foreign_key "ctacteproveedores", "proveedores"
  add_foreign_key "ctacteproveedores", "usuarios", column: "canceled_by_id"
  add_foreign_key "ctacteproveedores", "usuarios", column: "created_by_id"
  add_foreign_key "ctacteproveedores", "usuarios", column: "updated_by_id"
  add_foreign_key "proveedores", "usuarios", column: "created_by_id"
  add_foreign_key "proveedores", "usuarios", column: "updated_by_id"
  add_foreign_key "subconceptos", "conceptos"
  add_foreign_key "subpermisos", "permisos"
  add_foreign_key "tipousuario_permisos", "permisos"
  add_foreign_key "tipousuario_permisos", "tipousuarios"
  add_foreign_key "tipousuario_subpermisos", "subpermisos"
  add_foreign_key "tipousuario_subpermisos", "tipousuarios"
  add_foreign_key "usuarios", "tipousuarios"
end
