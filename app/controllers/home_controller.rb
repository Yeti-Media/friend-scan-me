class HomeController < ApplicationController
  layout "application"
  
  def index
    respond_to_mobile :index
  end
 

  def manifest
    manifest = Manifest.new
    #add_files
    manifest.files << card_landing_url(current_user.slug)
    #add_dirs
    manifest.dirs[Rails.public_path] = ['assets/*']
    render text: manifest.manifest!
  end

  private
  
  def respond_to_mobile(content)
    respond_to do |format|
      format.mobile {render content, :layout => "application"}
    end
  end
  
  
end
