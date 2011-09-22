Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, Settings.omniauth.facebook.app_id , Settings.omniauth.facebook.app_secret
if !Rails.env.production?
  provider :twitter, Settings.omniauth.twitter.consumer_key, Settings.omniauth.twitter.consumer_secret
  provider :linked_in, Settings.omniauth.linkedin.api_key, Settings.omniauth.linkedin.api_secret
  provider :last_fm, Settings.omniauth.last_fm.api_key, Settings.omniauth.last_fm.api_secret
  provider :github, Settings.omniauth.github.api_key, Settings.omniauth.github.api_secret
  provider :foursquare, Settings.omniauth.foursquare.client_id, Settings.omniauth.foursquare.client_secret
  provider :instagram, Settings.omniauth.instagram.client_id, Settings.omniauth.instagram.client_secret
  provider :tumblr, Settings.omniauth.tumblr.consumer_key, Settings.omniauth.tumblr.consumer_secret
  provider :flickr, Settings.omniauth.flickr.consumer_key, Settings.omniauth.flickr.consumer_secret
end
end

