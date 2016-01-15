xml.instruct!

xml.rows  do
	
  @etiquetas_aluno.each do |etiqueta|
  	xml.row('id'=>etiqueta.id) do	
      xml.cell etiqueta.codigo
      xml.cell etiqueta.created_at
    end
  end
end