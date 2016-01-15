class Aula < ActiveRecord::Base
  belongs_to :turma
  before_save :verifica_conflito

  def dia_semana
    I18n.t(Date::DAYNAMES[self[:dia_semana].to_i])
  end

  def dia_semana_number
    self[:dia_semana]
  end

  def hora_entrada
    
  end

  private 
  def verifica_conflito
  	logger.info self.inspect

  	@aulas = Aula.where(turma_id: self[:turma_id])
  	if self[:horario_inicio] >= self[:horario_termino]
  		errors.add(:aula, "Horário de inicio não pode ser superior ao horário de término");
  		return false;
  	end

  	#@aulas.each do |aula|
  	#	if aula[:id] != self[:id] && aula[:dia_semana] == self[:dia_semana] && (self[:horario_inicio] <= aula[:horario_inicio] || self[:horario_inicio] <= aula[:horario_termino] || self[:horario_termino] <= aula[:horario_inicio] || self[:horario_termino] <= aula[:horario_termino])
  	#		errors.add(:aula, "Houve conflito com a matéria de #{aula[:titulo]}");
  	#		return false;
	#  	end
  	#end
    #logger.info @aulas.inspect
  end

end
