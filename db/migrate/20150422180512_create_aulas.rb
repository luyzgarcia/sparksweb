class CreateAulas < ActiveRecord::Migration
  def change
    create_table :aulas do |t|
      t.text :titulo
      t.time :horario_inicio
      t.time :horario_termino
      t.text :descricao
      t.integer :dia_semana
      t.belongs_to :turma, index: true

      t.timestamps null: false
    end
  end
end
