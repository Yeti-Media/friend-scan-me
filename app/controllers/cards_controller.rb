class CardsController < ApplicationController
  def new
  end

  def show
    @user = User.find_by_slug(params[:slug_id])
  end

  def create
    @url = BITLY_CLIENT.shorten("https://www.facebook.com/profile.php?id" + current_user.uid)
    redirect_to @url.url
  end

  def edit
    @user = User.find_by_slug(params[:id])
  end


  def update
  end

end

