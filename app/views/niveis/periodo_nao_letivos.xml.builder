xml.instruct!

xml.rows  do
	xml.head do
		xml.column('type'=>'ed') do 
			xml.text! 'Descricao'
		end
		xml.column('type'=>'dhxCalendar') do 
			xml.text! 'Inicio'
		end	
		xml.column('type'=>'dhxCalendar') do 
			xml.text! 'Termino'
		end	
	end
  @periodo_nao_letivos.each do |dia|
  	xml.row('id'=>dia.id) do	
      xml.cell dia.descricao
      xml.cell dia.inicio
      xml.cell dia.termino
    end
  end
end