xml.instruct!

xml.rows  do
	xml.head do
		xml.column('type'=>'ed') do 
			xml.text! 'ID'
		end
		xml.column('type'=>'ed') do 
			xml.text! 'Titulo'
		end
		xml.column('type'=>'ed') do 
			xml.text! 'Dias da semana'
		end
		xml.column('type'=>'ed') do 
			xml.text! 'Criado em'
		end 
		xml.column('type'=>'ed') do 
			xml.text! 'Atualizado por ultimo'
		end 	
	end
  @niveis.each do |nivel|
  
  	xml.row('id'=>nivel.id) do		  		
  		#xml.item('id'=>'Dias', 'text'=>'Dias Sem aula', 'im0'=>'folderClosed.gif') do
	  	#	nivel.dias_nao_letivos.each do |dia| 
	  	#		xml.item('id'=>dia.dia,'text'=>dia.dia) do
	  	#			xml.id dia.dia
	  	#		end
	  	#	end
  		#end
  	  xml.cell nivel.id
      xml.cell nivel.titulo
      xml.cell nivel.dias_semana_letivo
      xml.cell nivel.created_at
      xml.cell nivel.updated_at
    end
  end
end