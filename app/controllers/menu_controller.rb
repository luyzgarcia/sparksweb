class MenuController < ApplicationController
  respond_to :html, :xml, :json


  def menu_xml
    @niveis = Nivel.all.order(titulo: :asc)
    #logger.info @niveis.series.inspect
    respond_with(@niveis)
  end

  def minutos
  end
  def horas
  end
  
end
