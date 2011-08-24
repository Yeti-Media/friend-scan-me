Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, Settings.omniauth.facebook.app_id , Settings.omniauth.facebook.app_secret
  provider :twitter, Settings.omniauth.twitter.consumer_key, Settings.omniauth.twitter.consumer_secret
  provider :linked_in, Settings.omniauth.linkedin.api_key, Settings.omniauth.linkedin.api_secret
end

