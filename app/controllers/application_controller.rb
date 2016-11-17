class ApplicationController < ActionController::Base
  include ActionController::ImplicitRender
  include ActionController::Helpers
  include ActionController::Caching 
  protect_from_forgery with: :exception
  
  layout :layout_by_resource
  protected

  def layout_by_resource
    if devise_controller?
      "login"
    else
      "bootstrap"
    end
  end

end
