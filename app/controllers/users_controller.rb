class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :destroy]
  respond_to :html, :xml, :json
  protect_from_forgery :except => [:create, :update, :db_action]
  
  def index
    logger.debug 'Entrou no index do users----------------'
    #set_listagem
    @users = User.all.order(created_at: :desc)
    #@user = User.new
    respond_to do |format|
      format.html
      format.json {render :json => @users.as_json}
      format.xml 
    end
  end
  
  def sign_up
    logger.debug 'Entrou aqui----------------'
  end

  def show
    respond_to do |format|
      format.xml
    end
    #respond_with(@user)

  end
  
  def new
    @user = User.new
  end
  
  def create
    save_user
    
    respond_to do |format|
      if @user.save
       format.html { redirect_to users_path, notice: 'Usuario foi cadastrado com sucesso.' }
      else
        format.json { render json: {:errors => @user.errors}, status: 422}
        format.html { render 'new', notice: 'Erro ao cadastradar!'}   
      end
    end
  end
  
  def edit
  end
  
  def update
    @record = User.find(params[:id_user])
    
    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end
    #logger.debug 'request tipo:'
    #logger.debug 
    #return false
    
    if(@record.update(user_params))
      respond_to do |format|
        #if (request.format == 'text/html')
        #  format.html {redirect_to root_path, notice: 'Usuário atualizado com sucesso!'}
        #else
        #  return render json: { success: true}
        #end
        #@mode = 'updated'
        #format.xml { render 'db_action'} 
        format.json { render json: {:message => 'Atualizado com sucesso!'}, status: 200}
      end
    else
      respond_to do |format|
        format.json { render json: {:message => 'Houve um erro ao atualizar!'}, status: 400}
      end    
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    if @user.id == current_user.id
      logger.debug 'Você nao pode se excluir'
      respond_to do |format|
        format.html {redirect_to users_path, notice: 'Você não pode se excluir'}
        format.json { render json: {:errors => @user.errors}, status: 422}
      end
    else
      respond_to do |format|
        if @user.destroy
          format.html {redirect_to users_path, notice: 'Registro excluido!'}
          return render json: { success: true}
        else
          format.json { render json: {:errors => @user.errors}, status: 422}
          format.html {redirect_to users_path, notice: 'Erro ao excluir registro!'} 
        end
     end
    end
  end


  def db_action
    @mode = params["!nativeeditor_status"]
    case @mode
      
    when "updated"
      #@record = Aluno.find(params[:gr_id])
      #if(@record.update(alunos_params))

      #else
      #  @mode = 'error'
      #  @erro = 'Ix mano!'
      #end
    when "deleted"
      @record = User.find(params[:gr_id])
      if @record.id == current_user.id
        logger.debug 'Você nao pode se excluir'
        @mode = 'error'
        @erro = 'Você não pode se excluir'      
      else

      end

      #@record = Aluno.find(params[:gr_id])
      #@record.destroy
    end

  end
  
  private
    def save_user
      @user = User.new(user_params)
      
      if params[:password].blank?
        params.delete(:password)
        params.delete(:password_confirmation)
      end
    end
  
    def set_listagem
      #@users = initialize_grid(User.order(created_at: :desc), per_page: 20)
    end
  
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.permit(:nome, :email, :password, :password_confirmation, :encrypted_password, :status, :role)
    end
end
