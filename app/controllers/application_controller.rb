class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #layout "dhtmlx"
  layout "layout_2"

  before_action :authenticate_user!, if: :is_api?
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_filter :set_current_user

  def set_current_user
    User.current_user = current_user
  end

 def is_api?
   if params[:controller] == 'api/registros'
     return false
   end
   return true
 end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :nome
  end

end
