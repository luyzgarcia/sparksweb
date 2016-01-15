class CreateTableNiveis < ActiveRecord::Migration
  def change
    create_table :niveis do |t|
      t.string :titulo
      t.text :descricao
      t.string :dias_semana_letivo
    end
  end
end
