class Api::V1::AuthenticationController < Api::V1::BaseController
  before_filter :authenticate!, :only => [:update]

  def create
    user = User.find_or_create_with_omniauth(params[:auth])
    if user.save
      @current_user = User.find(user.id)
      render json: {user_id: user.id.to_s, status: 'ok',
                    qr_code: "http://qurecode.herokuapp.com/api/qrcode.image?size=366&color=244468&background_color=ffffff&second_color=39c&prettify=true&url=#{card_landing_url(@current_user.slug)}" }
    else
      render json: {status: 'error', error: 'The user could not be saved. Try Again'}
    end
  end

  def update
    current_user.associate_provider(params[:auth])
    render json: {status: 'ok'}
  end

end
