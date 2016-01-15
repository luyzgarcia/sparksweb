class CreateAlunos < ActiveRecord::Migration
  def change
    create_table :alunos do |t|
      t.integer :codigo
      t.string :nome
      t.string :rg
      t.string :cpf
      t.string :nome_mae
      t.string :telefone_mae
      t.string :celular_mae
      t.string :email_mae
      t.string :nome_pai
      t.string :telefone_pai
      t.string :celular_pai
      t.string :email_pai

      
      t.belongs_to :turma, index: true

      t.timestamps null: false
    end
  end
end
