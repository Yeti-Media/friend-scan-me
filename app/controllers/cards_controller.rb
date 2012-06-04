class CardsController < ApplicationController
  before_filter :authenticate_user , :except => [:show, :edit]

  def new
  end

  def show
    @user = User.find_by_slug(params[:slug_id])
    @user.update_stats if request.format == :qrcode
    @title = @user.name + " @"
    respond_to_mobile :show
  end

  def create
    @url = BITLY_CLIENT.shorten("https://www.facebook.com/profile.php?id" + current_user.uid)
    redirect_to @url.url
  end

  def edit
    @user = current_user || User.find_by_slug(params[:id])
    @title = @user.name + " @"
    respond_to_mobile :edit
  end


  def update
    if current_user.update_attributes(params[:user])
      flash[:notice] = "Saved"
    else
      flash[:notice] = "Oooops!"
    end
    redirect_to :back
  end
  
  private
  
  def respond_to_mobile(content)
    respond_to do |format|
      format.mobile {render content}
    end
  end


end

