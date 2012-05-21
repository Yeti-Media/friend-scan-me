class Api::V1::BaseController < ApplicationController
  before_filter :detect_mobile_app!

  protected


  def authenticate!
    current_user
  end

  def current_user
    @current_user ||= User.find(request.headers["X-User-ID"])
  end

  def detect_mobile_app!
    unless is_mobile_app?
      not_found
      Rails.logger.info('No mobile app detected')
    end
  end

  def is_mobile_app?
    Settings.mobile.token == request.headers["X-Access-Token"]
  end

  def not_found
    render json: "ERRRORRRRR" #raise ActionController::RoutingError.new('Not Found')
  end
end
