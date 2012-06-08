class Api::V1::AuthenticationController < Api::V1::BaseController
  before_filter :authenticate!, :only => [:update]

  def create
    user = User.find_or_create_with_omniauth(params[:auth])
    if user.save
      render json: {user_id: user.id , status: 'ok'}
    else
      render json: {status: 'error', error: 'The user could not be saved. Try Again'}
    end
  end

  def update
    current_user.associate_provider(params[:auth])
    render json: {status: 'ok'}
  end


end
