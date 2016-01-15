class CreateTurmas < ActiveRecord::Migration
  def change
    create_table :turmas do |t|
      t.string :titulo
      t.belongs_to :serie, index: true

      t.timestamps null: false
    end
  end
end
