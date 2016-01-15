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

ActiveRecord::Schema.define(version: 20150618131303) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "adminpack"

  create_table "alunos", force: true do |t|
    t.integer  "codigo"
    t.string   "nome"
    t.string   "rg"
    t.string   "cpf"
    t.string   "nome_mae"
    t.string   "telefone_mae"
    t.string   "celular_mae"
    t.string   "email_mae"
    t.string   "nome_pai"
    t.string   "telefone_pai"
    t.string   "celular_pai"
    t.string   "email_pai"
    t.integer  "turma_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "alunos", ["turma_id"], name: "index_alunos_on_turma_id", using: :btree

  create_table "aulas", force: true do |t|
    t.text     "titulo"
    t.time     "horario_inicio"
    t.time     "horario_termino"
    t.text     "descricao"
    t.integer  "dia_semana"
    t.integer  "turma_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "aulas", ["turma_id"], name: "index_aulas_on_turma_id", using: :btree

  create_table "dias_nao_letivos", force: true do |t|
    t.string   "motivo"
    t.datetime "dia"
    t.integer  "nivel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "dias_nao_letivos", ["nivel_id"], name: "index_dias_nao_letivos_on_nivel_id", using: :btree

  create_table "empresas", force: true do |t|
    t.string   "nome"
    t.string   "razao_social"
    t.string   "cnpj"
    t.integer  "numero"
    t.string   "status"
    t.string   "email"
    t.string   "telefone"
    t.string   "responsavel"
    t.string   "cidade"
    t.string   "estado"
    t.text     "observacao"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "etiquetas", force: true do |t|
    t.string   "codigo"
    t.string   "status"
    t.integer  "aluno_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "etiquetas", ["aluno_id"], name: "index_etiquetas_on_aluno_id", using: :btree

  create_table "niveis", force: true do |t|
    t.string   "titulo"
    t.text     "descricao"
    t.string   "dias_semana_letivo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "periodo_nao_letivos", force: true do |t|
    t.text     "descricao"
    t.date     "inicio"
    t.date     "termino"
    t.integer  "nivel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "periodo_nao_letivos", ["nivel_id"], name: "index_periodo_nao_letivos_on_nivel_id", using: :btree

  create_table "periodos", force: true do |t|
    t.time     "horario_entrada"
    t.time     "horario_saida"
    t.integer  "nivel_id"
    t.integer  "tipo_periodo_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "periodos", ["nivel_id"], name: "index_periodos_on_nivel_id", using: :btree
  add_index "periodos", ["tipo_periodo_id"], name: "index_periodos_on_tipo_periodo_id", using: :btree

  create_table "registros", force: true do |t|
    t.datetime "data_hora"
    t.string   "tipo"
    t.string   "etiqueta_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.date     "dia"
    t.time     "hora"
    t.integer  "aluno_id"
  end

  add_index "registros", ["aluno_id"], name: "index_registros_on_aluno_id", using: :btree

  create_table "series", force: true do |t|
    t.string   "titulo"
    t.integer  "nivel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "series", ["nivel_id"], name: "index_series_on_nivel_id", using: :btree

  create_table "tipo_periodos", force: true do |t|
    t.string   "titulo"
    t.integer  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "turmas", force: true do |t|
    t.string   "titulo"
    t.integer  "serie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "turmas", ["serie_id"], name: "index_turmas_on_serie_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "nome"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "status",                 default: "Ativo"
    t.string   "role"
    t.string   "email",                  default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "empresa_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["empresa_id"], name: "index_users_on_empresa_id", using: :btree

end
