class HomeController < ApplicationController
  before_action :authenticate_user!
	protect_from_forgery except: :index
	skip_before_action :verify_authenticity_token
  
  def index
    
  end
end
