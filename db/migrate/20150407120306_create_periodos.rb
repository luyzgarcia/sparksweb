class CreatePeriodos < ActiveRecord::Migration
  def change
    create_table :periodos do |t|
      t.time :horario_entrada
      t.time :horario_saida
      t.belongs_to :nivel, index: true
      t.belongs_to :tipo_periodo, index: true

      t.timestamps null: false
    end
  end
end
