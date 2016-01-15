class CreateEtiquetas < ActiveRecord::Migration
  def change
    create_table :etiquetas do |t|
      t.string :codigo
      t.string :status
      t.references :aluno, index: true

      t.timestamps null: false
    end
  end
end
