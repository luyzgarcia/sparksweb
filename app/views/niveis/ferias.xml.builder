xml.instruct!

xml.rows  do
	xml.head do
		xml.column('type'=>'ed') do 
			xml.text! 'Motivo'
		end
		xml.column('type'=>'dhxCalendar') do 
			xml.text! 'Dia'
		end	
	end
  @ferias.each do |dia|
  	xml.row('id'=>dia.id) do	
      xml.cell dia.motivo
      xml.cell dia.dia
    end
  end
end