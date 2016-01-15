class Serie < ActiveRecord::Base
  belongs_to :nivel
  has_many :turmas
end
