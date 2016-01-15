Rails.application.routes.draw do

  get 'registros/verifica_servidor'

  resources :tipo_periodos
  resources :empresas
  resources :niveis do
    member do
      post "/update", :to => "niveis#update1", :as => 'update'
      post "/new_dia_nao_letivo", :to => "niveis#new_dia_nao_letivo", :as => 'new_dia_nao_letivo'
      post "/new_periodo_nao_letivo", :to => "niveis#new_periodo_nao_letivo", :as => 'new_periodo_nao_letivo'
      post "/delete_dia_nao_letivo/:id", :to => "niveis#delete_dia_nao_letivo", :as => 'delete_dia_nao_letivo'
      get 'periodo_nao_letivos', :to => "niveis#periodo_nao_letivos"
      get 'dias_nao_letivos', :to => "niveis#dias_nao_letivos"
      get 'periodos', :to => "niveis#periodos"
      get 'ferias', :to => "niveis#ferias"
      get 'tipo_periodos', :to => 'niveis#tipo_periodos'
      get 'series', :to =>'niveis#series'
    end
  end
  post '/niveis/new', :to =>'niveis#create', :as =>'nivel_new', :via => 'POST'
  resources :series do
    member do
      post "/update", :to => "series#update", :as => 'update'
      get 'turmas', :to =>'series#turmas', :as => 'series_turmas'
    end
  end
  post '/series/new', :to =>'series#create', :as =>'series_new', :via => 'POST'

  resources :turmas do

    member do
      get 'show_limited', :to => 'turmas#show'
      post '/alunos/import', :to =>'alunos#import_por_turma', :as =>'alunos_import', :via => 'POST'
      post "/update", :to => "turmas#update", :as => 'update'
      get 'alunos', :to => 'turmas#alunos'
      get 'aulas', :to => 'turmas#aulas'
      get 'dia_semana_aulas', :to => 'turmas#dia_semana_aulas'
      post '/new_aula', :to => 'turmas#new_aula'

    end

  end
  post '/turmas/new', :to =>'turmas#create', :as =>'turmas_new', :via => 'POST'
  get '/turmas/aula/:id_aula', :to => "turmas#aula"
  post '/update/aula', :to => "turmas#update_aula"
  resources :aulas do
  end

  resources :periodos do
    member do
      post "/update", :to => "periodos#update", :as => 'update'
    end
  end
  post '/periodos/new', :to =>'periodos#create', :as =>'periodos_new', :via => 'POST'

  resources :alunos do
    member do
      post "/update", :to => "alunos#update", :as => 'update'
      get '/historico', :to => "alunos#historico"
    end
  end
  #get '/all_alunos', :to => 'alunos#all_alunos', :as => 'all_alunos'
  post '/alunos/new', :to =>'alunos#create', :as =>'alunos_new', :via => 'POST'
  post '/alunos/import', :to =>'alunos#import', :as =>'alunos_import', :via => 'POST'
  get 'alunos_semturma', :to => 'alunos#alunos_semturma', :as => 'alunos_semturma'
  post 'adiciona_aluno_turma_path', :to => 'alunos#adiciona_aluno_turma', :as => 'adiciona_aluno_turma'

  resources :etiquetas do
    member do

    end

  end
  get '/etiquetas_por_aluno/:aluno_id', :to => "etiquetas#etiquetas_por_aluno", :as => "etiquetas_por_aluno"

  devise_for :users, :path_prefix => 'devise', :skip => [:api, :registros]
  devise_scope :user do
    get '/logout',  :to => 'devise/sessions#destroy'
  end
  resources :users do
    member do
      
    end
  end
  post 'update_user', :to => 'users#update', :as => 'update_user'
  
  resources :dashboard
  get 'calendario' => 'dashboard#calendario'

  resources :registros

  root 'dashboard#index'
  get 'menu_xml' => 'menu#menu_xml'
  get 'horas' => 'menu#horas'
  get 'minutos' => 'menu#minutos'
  get 'niveis_toolbar' => 'niveis#niveis_toolbar'
  get 'admin' => 'dashboard#admin'

  match "tipo_periodos/db_action", :to => "tipo_periodos#db_action", :as => "tipo_periodos_db_action", :via =>"post"
  match "users/db_action", :to => "users#db_action", :as => "users_db_action", :via =>"post"
  match "alunos/db_action", :to => "alunos#db_action", :as => "alunos_db_action", :via =>"post"
  match "etiquetas/db_action", :to => "etiquetas#db_action", :as => "etiquetas_db_action", :via =>"post"
  match "niveis/db_action", :to => "niveis#db_action", :as => "niveis_db_action", :via =>"post"
  match "series/db_action", :to => "series#db_action", :as => "series_db_action", :via =>"post"
  match "turmas/db_action", :to => "turmas#db_action", :as => "turmas_db_action", :via =>"post"
  match "turmas/db_action_alunos", :to => "turmas#db_action_alunos", :as => "turmas_db_action_alunos", :via =>"post"
  match "turmas/db_action_aulas", :to => "turmas#db_action_aulas", :as => "turmas_db_action_aulas", :via =>"post"
  match "niveis/db_action_dias_nao_letivos", :to => "niveis#db_action_dias_nao_letivos", :as => "niveis_db_action_dias_nao_letivos", :via =>"post"
  match "niveis/db_action_periodo_nao_letivos", :to => "niveis#db_action_periodo_nao_letivos", :as => "niveis_db_action_periodo_nao_letivos", :via =>"post"
  match "niveis/db_action_periodos", :to => "niveis#db_action_periodos", :as => "niveis_db_action_periodos", :via =>"post"




  #Api
  namespace :api do
    root 'api#index'
    resources :registros do
      #match "upload_file", :to => "registros#upload_file", :via => "post"
      collection do
        get "upload_file"
        post "upload_file"
        post "upload_file_line"
      end
    end
  end

  namespace :mobile do

  end
end
