class HomeController < ApplicationController
  layout "application"
  
  def index
    respond_to_mobile "index"
  end
  
  private
  
  def respond_to_mobile(content)
    respond_to do |format|
      format.mobile {render content}
    end
  end
  
  
end
