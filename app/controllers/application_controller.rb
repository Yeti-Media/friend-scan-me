class ApplicationController < ActionController::Base
  protect_from_forgery
  has_mobile_fu
  helper_method :signed_in?, :current_user 
  before_filter :set_locale
  before_filter :set_og_tags

  private

  def set_og_tags
    @og_description = t('og.description')
    @og_title = t('og.title')
    @og_url =  "http://friendscan.me"
    @og_icon = "http://friendscan.me/assets/facebook-icon.png"
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def signed_in?
    !!current_user
  end

  def authenticate_user
    unless signed_in?
       redirect_to "/", :notice => "Please sign in first!"
    end
  end


  def set_locale
     session[:locale] = params[:locale] if params[:locale].present?
     I18n.locale = session[:locale] || I18n.default_locale
  end

  def default_url_options(options={})
    { :locale => I18n.locale }
  end
end

