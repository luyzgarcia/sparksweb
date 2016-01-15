class TipoPeriodosController < ApplicationController
  before_action :set_registro, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json
  protect_from_forgery :except => [:create, :update, :db_action]
  def index
    set_listagem
    respond_with(@tipos)
  end
  
  def new
    @tipo = TipoPeriodo.new
  end
  
  def create
    @tipo = TipoPeriodo.new(tipo_periodo_params)
    respond_to do |format|
        if @tipo.save
          format.json { render json: {:message => 'Adicionado com sucesso!'}, status: 200}
        else
          format.json { render json: {:message => 'Erro ao cadastrar periodo com sucesso!'}, status: 400}
        end
      end
  end
  
  def edit
  end
  
  def update
    
    if(@tipo.update(tipo_periodo_params))
      respond_to do |format|
        if (request.format == 'text/html')
          format.html {redirect_to tipo_periodos_path, notice: 'Tipo de periodo  atualizado com sucesso!'}
        else
          format.html { render 'edit', notice: 'Erro ao atualizar'}
        end
      end
    else
      respond_to do |format|
        format.json { render json: {:errors => @tipo.errors}, status: 422}
        format.html { render 'edit', notice: 'Erro ao cadastradar!'} 
      end    
    end
  end

  def db_action
    @mode = params["!nativeeditor_status"]
    case @mode
      when "updated"
        @record = TipoPeriodo.find(params[:gr_id])
        if(!@record.update(tipo_periodo_params))
          @mode = 'error'
          @erro = 'Erro ao atualizar!'
        end
      when "deleted"
        @record = TipoPeriodo.find(params[:gr_id])
        logger.info @record.periodos.inspect

        if !@record.periodos.empty?
          @mode = 'error'
          @erro = 'Você não pode excluir um tipo de periodo que esta associado a vários niveis'      
        else
          @record.destroy
        end
    end

  end
  
  private
  def set_listagem
    @tipos = TipoPeriodo.all
  end  
  
  def set_registro
    @tipo = TipoPeriodo.find(params[:id])
  end
  
  def tipo_periodo_params
    params.permit(:titulo, :status)
  end
end
