class Api::V1::UsersController < Api::V1::BaseController
  before_filter :authenticate!

  def show
    render json: current_user.to_json(include: [:twitter_info,:facebook_info, :linkedin_info])
  end


  def qr_code
    render json: {qr_code: "http://api.qrserver.com/v1/create-qr-code/?data=#{card_landing_url(current_user.slug)}&size=#{w}x#{h}"}
  end
end
