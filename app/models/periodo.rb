class Periodo < ActiveRecord::Base
  belongs_to :nivel
  belongs_to :tipo_periodo
end
