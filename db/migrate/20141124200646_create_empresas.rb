class CreateEmpresas < ActiveRecord::Migration
  def change
    create_table :empresas do |t|
      t.string :nome
      t.string :razao_social
      t.string :cnpj
      t.integer :numero
      t.string :status
      t.string :email
      t.string :telefone
      t.string :responsavel
      t.string :cidade
      t.string :estado
      t.text :observacao
      t.attachment :logo

      t.timestamps null: false
    end
  end
end
