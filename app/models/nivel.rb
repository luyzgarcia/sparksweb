class Nivel < ActiveRecord::Base
  has_many :dias_nao_letivos
  has_many :series, :class_name => "Serie"
  has_many :periodos
  accepts_nested_attributes_for :dias_nao_letivos, :reject_if => proc { |a| a['motivo'].blank? }

#SQL para verificar se o nivel tem aula no dia X
#select 'true' where exists (select dias_semana_letivo from niveis where id = 3 and dias_semana_letivo like '%4%')   
  private 
  def rejeita_dias_nao_letivo
    attribute['motivo'].blank?
  end
end
