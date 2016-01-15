class SeriesController < ApplicationController
  before_action :set_registro, only: [:show, :edit, :update, :destroy, :update1, :dias_nao_letivos, :periodo_nao_letivos]
  before_action :set_listagem, only: [:index]
  respond_to :html, :xml, :json
  protect_from_forgery :except => [:create, :update, :db_action]

  def index
      respond_with(@turmas)
  end

  def new
    @serie = Serie.new(series_params)
  end
  def show

  end

  def edit
    #@nivel.dias_nao_letivos.build
      respond_with(@serie)
  end

  def create
    #logger.debug nivel_params
    @record = Serie.new(series_params)
    logger.debug @record.inspect
    if(@record.save)
      respond_to do |format|
         format.json { render json: {:message => 'Cadastrado com sucesso!'}, status: 200}
      end
    end
    #respond_to do |format|
    #  format.html { render 'new', notice: 'Erro ao cadastradar!'}
    #end
  end

  def update
    logger.info 'entoru no update info'
    if(@serie.update(series_params))
      respond_to do |format|
         format.json { render json: {:message => 'Atualizado com sucesso!'}, status: 200}
      end
    end
  end

  def db_action
    @mode = params["!nativeeditor_status"]
    case @mode
    when "inserted"

    when "deleted"
      @record = Serie.find(params[:gr_id])
      @record.destroy
    end
  end

  def turmas
    @turmas = Turma.all.where(serie: params[:id] )
    respond_with(@turmas)
  end

  #def db_action_dias_nao_letivos
  #  logger.info 'Entrou db_action'
  #  logger.info params
  #  @mode = params["!nativeeditor_status"]
  #  logger.info @mode

  #  case @mode
  #  when "inserted"
  #      logger.info 'Inserted'

  #  when "deleted"
  #    @record = DiasNaoLetivo.find(params[:gr_id])
  #    @record.destroy
  #  when "updated"
  #      logger.info 'Updated'
  #  end
  #end

  #end
  #def new_periodo_nao_letivo
  #  @novo = PeriodoNaoLetivo.new(periodo_nao_letivos_params)
  #  if(@novo.save)
  #    respond_to do |format|
  #       format.json { render json: {:message => 'Cadastrado com sucesso!'}, status: 200}
  #    end
  #  end
  #end
  #def periodo_nao_letivos
  #  logger.info 'entrou no periodo nao letivo'
  #  @periodo_nao_letivos = PeriodoNaoLetivo.all.where(nivel: params[:id])
  #end

  private
  def set_listagem
    @niveis = Serie.all.order(:created_at)
  end

  def set_registro
    @serie = Serie.find(params[:id])
  end

  def series_params
    params.permit(:titulo, :nivel_id, :created_at, :updated_at)
  end
end
