class Etiqueta < ActiveRecord::Base
  belongs_to :aluno
  validates :codigo, uniqueness: { message: "Este código de etiqueta já esta cadastrado para outro aluno." }
end
