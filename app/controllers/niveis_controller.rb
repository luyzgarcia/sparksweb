class NiveisController < ApplicationController
  before_action :set_registro, only: [:show, :edit, :update, :destroy, :update1, :dias_nao_letivos, :periodo_nao_letivos, :periodos]
  before_action :set_listagem, only: [:index]
  respond_to :html, :xml, :json
  protect_from_forgery :except => [:create, :db_action_dias_nao_letivos, :update1, :new_dia_nao_letivo, :new_periodo_nao_letivo,
      :new_periodo,:db_action, :db_action_periodos, :db_action_periodo_nao_letivos, :db_action_periodos]
  def index
    respond_with(@niveis)
  end
  def niveis_toolbar
    respond_with()
  end

  def new
    @nivel = Nivel.new
    #@nivel.create_dias_nao_letivo
    @nivel.dias_nao_letivos.build
  end

  def edit
    @nivel.dias_nao_letivos.build
    respond_with(@nivel)
  end

  def create
    #logger.debug nivel_params
    #return false
    @nivel = Nivel.new(nivel_params)
    @nivel.save
    #logger.debug
    #return false
    respond_to do |format|
      format.html { render 'new', notice: 'Erro ao cadastradar!'}
    end
  end

  def update1
    logger.info 'entoru no update info'
    @nivel.update(nivel_params)
  end

  def update
    if(@nivel.update(nivel_params))
      respond_to do |format|
        if (request.format == 'text/html')
          format.html {redirect_to niveis_path, notice: 'Usuário atualizado com sucesso!'}
        else
          format.html { render 'edit', notice: 'Erro ao atualizar'}
        end
      end
    else
      respond_to do |format|
        format.json { render json: {:errors => @user.errors}, status: 422}
        format.html { render 'edit', notice: 'Erro ao cadastradar!'}
      end
    end
  end

  def db_action
    logger.info 'entoru no destroy'
    logger.info params
    @mode = params["!nativeeditor_status"]
    logger.info @mode
    case @mode
    when "inserted"
        logger.info 'Inserted'

    when "deleted"
      @record = Nivel.find(params[:gr_id])
      @record.destroy
    end
  end



  def db_action_dias_nao_letivos
    logger.info 'Entrou db_action'
    logger.info params
    @mode = params["!nativeeditor_status"]
    logger.info @mode

    case @mode
    when "inserted"
        logger.info 'Inserted'

    when "deleted"
      @record = DiasNaoLetivo.find(params[:gr_id])
      @record.destroy
    when "updated"
        logger.info 'Updated'
    end
  end


  def dias_nao_letivos
    #logger.info ' Dias não letivos método'
    #logger.info params[:id]
    @dias_nao_letivos = DiasNaoLetivo.all.where(nivel: params[:id])
    #logger.info @dias_nao_letivos.inspect
  end
  def ferias
    #@ferias = DiasNaoLetivo.all.where(nivel: params[:id])
    #logger.info @dias_nao_letivos.inspect
  end

  def new_dia_nao_letivo
    @novo = DiasNaoLetivo.new(dias_nao_letivos_params)
    if(@novo.save)
      respond_to do |format|
         format.json { render json: {:message => 'Cadastrado com sucesso!'}, status: 200}
      end
    end
  end

  #def delete_dia_nao_letivo
  #  @dia = DiasNaoLetivo.all.where(id: params[:id])
  #end
  def new_periodo_nao_letivo
    @novo = PeriodoNaoLetivo.new(periodo_nao_letivos_params)
    if(@novo.save)
      respond_to do |format|
         format.json { render json: {:message => 'Cadastrado com sucesso!'}, status: 200}
      end
    end
  end
  def periodo_nao_letivos
    logger.info 'entrou no periodo nao letivo'
    @periodo_nao_letivos = PeriodoNaoLetivo.all.where(nivel: params[:id])
  end

  def db_action_periodo_nao_letivos
    logger.info 'Entrou db_action'
    logger.info params
    @mode = params["!nativeeditor_status"]
    logger.info @mode

    case @mode
    when "inserted"
        logger.info 'Inserted'

    when "deleted"
      @record = PeriodoNaoLetivo.find(params[:gr_id])
      @record.destroy

    when "updated"
        logger.info 'Updated'
    end
  end

  #Parte de periodos
  def periodos
    @periodos = Periodo.all.where(nivel: params[:id])
  end
  def db_action_periodos
    @mode = params["!nativeeditor_status"]
    case @mode
    when "deleted"
      @record = Periodo.find(params[:gr_id])
      @record.destroy
    end
  end
  #encerra parte de periodos

  #Parte dos tipo de periodos
  def tipo_periodos
    @tipo_periodos = TipoPeriodo.all.where('id not in (?)',Periodo.all.where(nivel: params[:id]).select(:tipo_periodo_id))
  end
  #encerra parte de periodos


  #series deste nivel
  def series

    @series = Serie.all.where(nivel: params[:id] )
    respond_with(@series)
  end

  private
  def set_listagem
    @niveis = Nivel.all.order(:created_at)
  end

  def set_registro
    @nivel = Nivel.find(params[:id])
  end

  def nivel_params
    params.permit(:id, :titulo, :descricao, :dias_semana_letivo, :created_at, :updated_at,
            {:dias_nao_letivos_attributes => [:id, :nivel_id, :motivo, :dia]})
  end
  def dias_nao_letivos_params
    params.permit(:motivo, :dia, :nivel_id, :created_at, :updated_at)
  end
  def periodo_nao_letivos_params
    params.permit(:descricao, :inicio,:termino, :nivel_id, :created_at, :updated_at)
  end
end
