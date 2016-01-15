class PeriodosController < ApplicationController
  before_action :set_registro, only: [:show, :edit, :update, :destroy, :dias_nao_letivos, :periodo_nao_letivos]
  before_action :set_listagem, only: [:index]
  respond_to :html, :xml, :json
  protect_from_forgery :except => [:create, :update] 
  
  def new
    @turma = Serie.new(turmas_params)
  end
  def show
  end
  
  def edit
    #@nivel.dias_nao_letivos.build
    respond_with(@turma)
  end  
  
  def create
    logger.info params
    @record = Periodo.new(periodos_params)
    logger.debug Time.new(0001, 01, 01, params[:hora_entrada], params[:minuto_entrada], 0).to_s(:time)
    @record[:horario_entrada] = Time.new(0,01,01,params[:hora_entrada],params[:minuto_entrada],0).to_s(:time)
    @record[:horario_saida] = Time.new(0,01,01,params[:hora_saida],params[:minuto_saida],0).to_s(:time)
    logger.info 'Registro:'
    logger.info @record.inspect
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
    if(@turma.update(periodos_params))
      respond_to do |format|
         format.json { render json: {:message => 'Atualizado com sucesso!'}, status: 200}
      end
    end
  end
  
  private
  def set_listagem
    @periodos = Periodo.all.order(:created_at)
  end
  
  def set_registro
    @periodo = Periodo.find(params[:id])
  end
  
  def periodos_params
    params.permit(:horario_entrada, :horario_saida, :nivel_id, :tipo_periodo_id, :created_at, :updated_at)
  end
end
