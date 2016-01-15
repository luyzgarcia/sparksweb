class CreatePeriodoNaoLetivos < ActiveRecord::Migration
  def change
    create_table :periodo_nao_letivos do |t|
      t.text :descricao
      t.date :inicio
      t.date :termino
      t.belongs_to :nivel, index: true

      t.timestamps null: false
    end
  end
end
