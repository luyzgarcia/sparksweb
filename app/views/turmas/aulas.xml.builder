xml.instruct!

xml.rows  do
	xml.head do
		xml.column('type'=>'ed') do
			xml.text! 'Matéria'
		end
		xml.column('type'=>'ed') do
			xml.text! 'Horário de inicio'
		end
    xml.column('type'=>'ed') do
			xml.text! 'Horário de termino'
		end
    xml.column('type'=>'ed') do
			xml.text! 'dia'
		end
	end
  @aulas.each do |aula|
  	xml.row('id'=> aula.id) do
      xml.cell aula.titulo
      xml.cell aula.horario_inicio.to_s(:time)
      xml.cell aula.horario_termino.to_s(:time)
      xml.cell aula.dia_semana
    end
  end
end
