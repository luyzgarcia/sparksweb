class Turma < ActiveRecord::Base
  belongs_to :serie
  has_many :alunos
end
