Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, Settings.omniauth.facebook.app_id , Settings.omniauth.facebook.app_secret
  provider :twitter, Settings.omniauth.twitter.consumer_key, Settings.omniauth.twitter.consumer_secret
end

