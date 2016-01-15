xml.instruct!

xml.rows  do
	xml.head do
		xml.column('type'=>'ed') do 
			xml.text! 'Periodo'
		end
		xml.column('type'=>'ed') do 
			xml.text! 'Horário de entrada'
		end	
		xml.column('type'=>'ed') do 
			xml.text! 'Horário de saída'
		end	
	end
  @periodos.each do |periodo|
  	xml.row('id'=>periodo.id) do	
      xml.cell periodo.tipo_periodo.titulo
      xml.cell periodo.horario_entrada.to_s(:time)
      xml.cell periodo.horario_saida.to_s(:time)
    end
  end
end