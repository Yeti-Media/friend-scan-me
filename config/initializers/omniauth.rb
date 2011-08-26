Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, Settings.omniauth.facebook.app_id , Settings.omniauth.facebook.app_secret
  provider :twitter, Settings.omniauth.twitter.consumer_key, Settings.omniauth.twitter.consumer_secret
  provider :linked_in, Settings.omniauth.linkedin.api_key, Settings.omniauth.linkedin.api_secret
  provider :last_fm, Settings.omniauth.last_fm.api_key, Settings.omniauth.last_fm.api_secret
  provider :github, Settings.omniauth.github.api_key, Settings.omniauth.github.api_secret
end

