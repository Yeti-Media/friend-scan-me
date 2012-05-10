module CardsHelper

  # Show Helpers

  def link_to_add_facebook_friend(user)
     link_to t('cards.helpers.link_to_add_facebook_friend'),
     "http://www.facebook.com/dialog/friends/?id=#{user.facebook_info.uid}&app_id=#{Settings.omniauth.facebook.app_id}&redirect_uri=#{request.url}"
  end

  def url_add_facebook_friend(user)
     "http://www.facebook.com/dialog/friends/?id=#{user.facebook_info.uid}&app_id=#{Settings.omniauth.facebook.app_id}&redirect_uri=#{request.url}"
  end

  def link_to_tumblr_follow(user)
    link_to "Follow on Tumblr", "http://www.tumblr.com/follow/#{user.tumblr_info.uid}", popup: true
  end

  def link_to_twitter_follow(user)
    link_to t('cards.helpers.link_to_twitter_follow')+ user.twitter_info.user_name, "https://twitter.com/intent/user?screen_name=#{user.twitter_info.user_name}", class: "twitter-follow-button" , target:'_new'
  end

  # Edit HELPERS
  def link_to_qr_code(user, w=200 ,h = 200)
    link_to "Your QRcode", "http://api.qrserver.com/v1/create-qr-code/?data=#{card_landing_url(user.slug)}&size=#{w}x#{h}"
  end
  
  def image_tag_qr_code(user, w=150 ,h = 150)
    image_tag ("http://api.qrserver.com/v1/create-qr-code/?data=#{card_landing_url(user.slug)}&size=#{w}x#{h}")
  end
  
  def bookmark_qr_code(user, w=150 ,h = 150)
    image_tag ("http://api.qrserver.com/v1/create-qr-code/?data=http://friendscan.me&size=#{w}x#{h}")
  end

  def link_to_facebook(user)
    link_to "Facebook" , "http://facebook.com/profile.php?id=#{user.facebook_info.uid}" , popup: true
  end

  def link_to_twitter(user)
    link_to "Twitter", "https://twitter.com/#{user.twitter_info.uid}" , popup: true
  end

  def link_to_linkedin(user)
    link_to "Linkedin Profile", user.linkedin_info.profile_url , popup: true
  end

  def link_to_last_fm(user)
    link_to "Last.fm", user.last_fm_info.profile_url , popup: true
  end

  def link_to_github(user)
    link_to "Github", "https://github.com/#{user.github_info.uid}", popup: true
  end

  def link_to_foursquare(user)
    link_to "Foursquare", "https://foursquare.com/#{user.foursquare_info.uid}", popup: true
  end

  def link_to_instagram(user)
    link_to "Instagram", "https://instagram.com/#{user.instagram_info.uid}", popup: true
  end

  def link_to_tumblr(user)
    link_to "Tumblr", "http://#{user.tumblr_info.uid}.tumblr.com/", popup: true
  end

  def link_to_flickr(user)
    link_to "Flickr", "http://www.flickr.com/photos/#{user.flickr_info.profile_id}/", popup: true
  end


end

