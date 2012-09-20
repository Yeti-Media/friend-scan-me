class Api::V1::AuthenticationController < Api::V1::BaseController
  before_filter :authenticate!, :only => [:update]

  def create
    user = User.find_or_create_with_omniauth(params[:auth])
    if user.save
      @current_user = User.find(user.id)
      render json: {user_id: user.id.to_s, status: 'ok',
                    qr_code: "http://api.qrserver.com/v1/create-qr-code/?data=#{card_landing_url(@current_user.slug)}&size=183x183&background_color=ffffff&color=244468&second_color=39c&prettify=true&" }
    else
      render json: {status: 'error', error: 'The user could not be saved. Try Again'}
    end
  end

  def update
    current_user.associate_provider(params[:auth])
    render json: {status: 'ok'}
  end

end
