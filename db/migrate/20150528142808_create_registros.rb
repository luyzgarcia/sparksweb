class CreateRegistros < ActiveRecord::Migration
  def change
    create_table :registros do |t|
      t.datetime :data_hora
      t.string :tipo
      t.string :etiqueta_id

      t.timestamps null: false
    end
  end
end
