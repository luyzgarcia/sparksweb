class AlunosController < ApplicationController
  before_action :set_registro, only: [:show, :edit, :update, :destroy]
  before_action :set_listagem, only: [:index]
  respond_to :html, :xml, :json
  protect_from_forgery :except => [:create, :update, :import_por_turma, :import, :db_action, :adiciona_aluno_turma]

  def index
    respond_with(@alunos)
  end


  def new
    @aluno = Aluno.new(alunos_params)
  end
  def show
  end

  def edit
    respond_with(@alunos)
  end

  def alunos_semturma
    @alunos = Aluno.all.where(turma: nil).order(:nome)
    respond_to do |format|
      format.xml { render :index }
    end
  end

  def create
    #logger.debug nivel_params
    @record = Aluno.new(alunos_params)
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
    if(@aluno.update(alunos_params))
      respond_to do |format|
         format.json { render json: {:message => 'Atualizado com sucesso!'}, status: 200}
      end
    end
  end

  def db_action
    @mode = params["!nativeeditor_status"]
    case @mode
    when "inserted"

    when "updated"
      @record = Aluno.find(params[:gr_id])
      if(@record.update(alunos_params))

      else
        @mode = 'error'
        @erro = 'Ix mano!'
      end
    when "deleted"
      @record = Aluno.find(params[:gr_id])
      @record.destroy
    end
  end
  def import
    logger.info 'entrou no import'
    Aluno.import(params[:file], nil)
  end


  def import_por_turma
    turma_id = params[:id]
    Aluno.import(params[:file], turma_id)

    respond_to do |format|
      format.json {render json: {:state => true, :name => params[:file].original_filename}, status:200}
    end
  end

  def adiciona_aluno_turma
    @record = Aluno.find(params[:id])
    logger.info @record.nome

    if(@record.update_attribute(:turma_id, params[:turma_id]))
      respond_to do |format|
        format.json { render json: {:message => "Aluno(a) '#{@record.nome}' adicionado a turma com sucesso."}, status: 200}
      end
    else
      format.json { render json: {:message => "Erro ao adicionar o aluno(a) '#{@record.nome}' a turma."}, status: 400}
    end
  end

  #Retorna os registros de entrada e saida do aluno 
  def historico
    @record = Aluno.find(params[:id])
    #id_etiquetas = @record.etiquetas.map {|i| i.codigo.to_s}
    #etiqueta_query = Registro.select("id").where("etiqueta_id in (?)", id_etiquetas)
    #@registros_historico = Registro.where(etiqueta_query.where_values).order(dia: :desc, hora: :asc)
    @registros_historico = Registro.where(aluno: @record).order(dia: :desc, hora: :asc)

    #logger.info @registros_historico.inspect
    respond_to do |format| 
      format.xml
    end
  end

  private
  def set_listagem
    @alunos = Aluno.all.order(:created_at)
  end

  def set_registro
    @aluno = Aluno.find(params[:id])
  end

  def alunos_params
    params.permit(:id, :codigo, :nome, :rg, :cpf, :nome_mae, :telefone_mae, :celular_mae, :email_mae,
                  :nome_pai, :telefone_pai, :celular_pai, :email_pai, :created_at, :updated_at, :turma_id)
  end
end
