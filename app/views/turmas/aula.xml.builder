xml.instruct!

xml.data  do
  xml.id_aula @aula.id
  xml.titulo @aula.titulo
  xml.dia_semana @aula.dia_semana_number
  xml.hora_entrada @aula.horario_inicio.hour
  xml.minuto_entrada @aula.horario_inicio.min
  xml.hora_saida @aula.horario_termino.hour
  xml.minuto_saida @aula.horario_termino.min

end
