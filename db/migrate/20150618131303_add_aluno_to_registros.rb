class AddAlunoToRegistros < ActiveRecord::Migration
  def change
  	add_reference :registros, :aluno, index: true
  end
end
