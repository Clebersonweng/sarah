require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  include ActionController::ImplicitRender
  include ActionController::Helpers
  include ActionController::Caching 
  protect_from_forgery # para evitar envios para hackear por outros formatos
  before_action :configure_devise_permitted_parameters, if: :devise_controller?
    layout :layout_by_resource
    respond_to :html, :json
    responders :flash
    
    
    
    
    
    
    
    
    
    #######################################################################
    protected
    def layout_by_resource
      if devise_controller?
        "login"
      else
        "bootstrap"
      end
    end
    #######################################################################
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
    ############################################################################
    def after_sign_out_path_for(resource)
      root_path
    end
  end