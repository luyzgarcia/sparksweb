xml.instruct!

xml.rows  do
	xml.head do
		xml.column('type'=>'ed') do 
			xml.text! 'Titulo'
		end
		xml.column('type'=>'ed') do 
			xml.text! 'Criado em'
		end 
		xml.column('type'=>'ed') do 
			xml.text! 'Atualizado por ultimo'
		end 	
	end
  @turmas.each do |turma|
  
  	xml.row('id'=>turma.id) do		  		
      xml.cell turma.titulo
      xml.cell turma.created_at
      xml.cell turma.updated_at
    end
  end
end