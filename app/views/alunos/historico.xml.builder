xml.instruct!

xml.rows  do
  @registros_historico.each do |registro|
  	xml.row('id'=>registro.id) do
  		xml.cell registro.tipo
      xml.cell registro.dia.to_formatted_s if registro.dia
      xml.cell registro.hora.to_formatted_s(:time) if registro.hora
      xml.cell registro.etiqueta_id
    end
  end
end