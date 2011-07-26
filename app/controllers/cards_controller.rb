class CardsController < ApplicationController
  def new
  end

  def show
  end

  def create
    @url = bitly.shorten("https://www.facebook.com/profile.php?id" + current_user.uid)
  end
  
  def update
  end

end
