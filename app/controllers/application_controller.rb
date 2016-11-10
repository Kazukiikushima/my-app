class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def admin
      unless current_user.type == "Realtor"
           flash[:danger] = "only realtor"
           redirect_to root_url
      end
  end

  private
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:comment])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:type])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:job])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:sex])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:age])
    devise_parameter_sanitizer.permit(:account_update, keys: [:comment])
    devise_parameter_sanitizer.permit(:account_update, keys: [:age])
    devise_parameter_sanitizer.permit(:account_update, keys: [:job])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
