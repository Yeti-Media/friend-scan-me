class SessionsController < ApplicationController

  def create
    auth = request.env["omniauth.auth"]
    if signed_in?
      current_user.associate_provider(auth)
      redirect_to edit_card_path(current_user.slug), :notice => "Signed in!"
    else
      user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.new_with_omniauth(auth)
      if user.save!
        session[:user_id] = user.id
        redirect_to edit_card_path(user.slug), :notice => "Signed in!"
      else
        redirect_to root_path, :notice => "Try Again!"
      end
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end

end

