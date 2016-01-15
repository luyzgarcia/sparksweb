class TurmasController < ApplicationController
  before_action :set_registro, only: [:show, :show_limited, :edit, :update, :destroy, :dias_nao_letivos,
    :periodo_nao_letivos, :alunos, :dia_semana_aulas, :aulas]
  before_action :set_listagem, only: [:index]
  respond_to :html, :xml, :json
  protect_from_forgery :except => [:create, :update, :db_action, :db_action_alunos,
    :dia_semana_aulas, :new_aula, :db_action_aulas, :update_aula]

  def index
    respond_with(@turmas)
  end

  def new
    @turma = Serie.new(turmas_params)
  end
  def show

  end
  def show_limited
  end

  def edit
    #@nivel.dias_nao_letivos.build
    respond_with(@turma)
  end

  def create
    #logger.debug nivel_params
    @record = Turma.new(turmas_params)
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
    if(@turma.update(turmas_params))
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
      @record = Turma.find(params[:gr_id])
      @record.destroy
    end
  end

  #Aulas
  def aulas
    @aulas = Aula.all.where(turma: params[:id]).order(:dia_semana, :horario_inicio)
  end

  def aula
    logger.info params
    @aula = Aula.find(params[:id_aula])
  end

  def update_aula
    logger.info params
    new_aula()
  end

  def dia_semana_aulas
    @dias = @turma.serie.nivel.dias_semana_letivo.split(',')
    logger.info @dias
  end

  def new_aula
    #@record = Aula.new(aulas_params)
    @record = Aula.where(id: params[:id_aula]).first_or_initialize
    @record.attributes = aulas_params
    @record[:horario_inicio] = Time.new(0,01,01,params[:hora_entrada],params[:minuto_entrada],0).to_s(:time)
    @record[:horario_termino] = Time.new(0,01,01,params[:hora_saida],params[:minuto_saida],0).to_s(:time)


    logger.info 'vai tentar salvar'
    if(@record.save)
      respond_to do |format|
         format.json { render json: {:message => 'Cadastrado com sucesso!'}, status: 200}
      end
    else
      logger.info 'nao salvou'
      logger.info @record.errors[:aula][0]
      respond_to do |format|
        format.json { render json: {:message => "Houve um erro ao cadastrar a aula! : #{@record.errors[:aula][0]} ."}, status: 400}
      end

    end
  end

  def db_action_aulas
    @mode = params["!nativeeditor_status"]
    case @mode
    when "deleted"
      @record = Aula.find(params[:gr_id])
      @record.destroy
    end

    respond_to do |format|
      format.xml { render :db_action }
    end

  end

  #Alunos
  def alunos
    @alunos = Aluno.all.where(turma: params[:id]).order(:nome)
  end

  def db_action_alunos
    @mode = params["!nativeeditor_status"]
    case @mode
    when "updated"
      @record = Aluno.find(params[:gr_id])
      if(@record.update(alunos_params))

      else
        @mode = 'error'
        @erro = 'Algo não deu certo =/'
      end
    when "deleted"
      @record = Aluno.find(params[:gr_id])
      @record.turma = nil
      @record.save
    end

  end

  private
  def set_listagem
    @turmas = Turma.all.order(:created_at)
  end

  def set_registro
    @turma = Turma.find(params[:id])
  end

  def turmas_params
    params.permit(:titulo, :serie_id, :created_at, :updated_at)
  end

  def aulas_params
    params.permit(:titulo, :horario_inicio, :horario_termino, :turma_id, :dia_semana, :created_at, :updated_at)
  end

  def alunos_params
    params.permit(:id, :codigo, :nome, :rg, :cpf, :nome_mae, :telefone_mae, :celular_mae, :email_mae,
                  :nome_pai, :telefone_pai, :celular_pai, :email_pai, :created_at, :updated_at, :turma_id)
  end


end
