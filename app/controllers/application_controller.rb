class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :signed_in?, :current_user




  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def signed_in?
    !!current_user
  end

  def authenticate_user
    unless signed_in?
       render :status => 404
    end
  end
end
