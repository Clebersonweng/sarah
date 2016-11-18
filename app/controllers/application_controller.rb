class ApplicationController < ActionController::Base
  include ActionController::ImplicitRender
  include ActionController::Helpers
  include ActionController::Caching 
  #protect_from_forgery_with::exception
  before_action :configure_devise_permitted_parameters, if: :devise_controller?
    layout :layout_by_resource
  
  
  
  
  protected
  def layout_by_resource
    if devise_controller?
      "login"
    else
      "bootstrap"
    end
  end

  def configure_devise_permitted_parameters
    registration_params = [:own_machine, :role_id, :email, :password, :password_confirmation]

    if params[:action] == 'update'
      devise_parameter_sanitizer.permit(:account_update) { 
        |u| u.permit(registration_params << :current_password)
      }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.permit(:sign_up) { 
        |u| u.permit(registration_params) 
      }
    end
  end
  
end
