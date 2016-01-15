xml.instruct!

xml.rows  do
  @alunos.each do |aluno|
  	xml.row('id'=>aluno.id) do
  		xml.cell aluno.codigo
      xml.cell aluno.nome
      xml.cell aluno.rg
      xml.cell aluno.cpf
      xml.cell aluno.nome_mae
      xml.cell aluno.nome_pai
      xml.cell aluno.turma.serie.titulo+' '+aluno.turma.titulo if (aluno.turma)
    end
  end
end