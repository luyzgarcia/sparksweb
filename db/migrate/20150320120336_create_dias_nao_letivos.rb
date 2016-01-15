class CreateDiasNaoLetivos < ActiveRecord::Migration
  def change
    create_table :dias_nao_letivos do |t|
      t.string :motivo
      t.datetime :dia
      t.belongs_to :nivel, index: true

      t.timestamps null: false
    end
  end
end
