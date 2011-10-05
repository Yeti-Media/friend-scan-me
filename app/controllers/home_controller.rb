class HomeController < ApplicationController
  layout "application"
  
  def index
    session[:mobile_view] = false
  end
  
end
