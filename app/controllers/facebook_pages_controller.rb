class FacebookPagesController < ApplicationController
  before_filter :authenticate_user , :except => [:show]


  def index
    @facebook_pages = current_user.facebook_pages
  end


  def show
    @facebook_page = FacebookPage.find_by_slug(params[:id])
  end

end
