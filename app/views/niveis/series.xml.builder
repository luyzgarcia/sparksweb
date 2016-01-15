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
  @series.each do |serie|
  
  	xml.row('id'=>serie.id) do		  		
      xml.cell serie.titulo
      xml.cell serie.created_at
      xml.cell serie.updated_at
    end
  end
end