class EtiquetasController < ApplicationController
  #before_action :set_registro, only: [:show, :edit, :update, :destroy]
  #before_action :set_listagem, only: [:index]
  respond_to :html, :xml, :json
  protect_from_forgery :except => [:create, :update, :db_action]

  def index
    respond_with(@etiquetas)
  end

  #Retorna as etiquetas do aluno pelo id
  def etiquetas_por_aluno
    logger.info(params)
    @etiquetas_aluno = Etiqueta.all.where(aluno_id: params[:aluno_id])
    respond_with @etiquetas_aluno
  end

  def create
    @record = Etiqueta.new(etiquetas_params)
    if(@record.save)
      respond_to do |format|
         format.json { render json: {:message => 'Cadastrado com sucesso!'}, status: 200}
      end
    else
      respond_to do |format|
        format.json { render json: {:message => "Poxa, deu erro! <br/> #{@record.errors.first[1]}"}, status: 402}
      end
    end
  end

  def db_action
    @mode = params["!nativeeditor_status"]
    case @mode
   
    when "deleted"
      @record = Etiqueta.find(params[:gr_id])
      @record.destroy
    end
  end

  private
  def set_listagem
    @etiquetas = Etiqueta.all.order(:created_at)
  end

  def set_registro
    @etiqueta = Etiqueta.find(params[:id])
  end

  def etiquetas_params
    params.permit(:id, :codigo, :created_at, :updated_at, :aluno_id)
  end
end
