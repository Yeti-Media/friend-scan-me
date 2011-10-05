class HomeController < ApplicationController
  layout "application"
  
  def index
    session[:mobile_view] = false
    # respond_to do |format|
    #   format.mobile {render "index", :layout => "application"}
    # end
  end
  
end
