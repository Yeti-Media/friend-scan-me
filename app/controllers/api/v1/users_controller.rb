class Api::V1::UsersController < Api::V1::BaseController
  before_filter :authenticate!

  def show
    render json: current_user.to_json(include: [:twitter_info,:facebook_info, :linkedin_info])
  end


  def qr_code
    render json: {qr_code: "http://qurecode.herokuapp.com/api/qrcode.image?size=366&color=244468&background_color=ffffff&second_color=39c&prettify=true&url=#{card_landing_url(current_user.slug)}" }
  end
end
