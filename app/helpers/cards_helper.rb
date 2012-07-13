module CardsHelper

  # Show Helpers

  def link_to_add_facebook_friend(user)
     link_to t('cards.helpers.link_to_add_facebook_friend'),
     "http://www.facebook.com/dialog/friends/?id=#{user.facebook_info.uid}&app_id=#{Settings.omniauth.facebook.app_id}&redirect_uri=#{request.url}"
  end

  def link_to_twitter_follow(user)
    link_to t('cards.helpers.link_to_twitter_follow')+ user.twitter_info.user_name, "https://twitter.com/intent/user?screen_name=#{user.twitter_info.user_name}", class: "twitter-follow-button" , target:'_new'
  end

  def link_to_linkedin(user)
    link_to(t("cards.helpers.link_to_linkedin"), user.linkedin_info.profile_url , popup: true)
  end

  def link_to_instagram(user)
    link_to t("cards.helpers.link_to_instagram"), "instagram://user?username=#{user.instagram_info.uid}", popup: true
  end
  
  def link_to_github(user)
    link_to t("cards.helpers.link_to_github"), "https://github.com/#{user.github_info.uid}", popup: true
  end

  # Edit HELPERS
  def link_to_qr_code(user, w=200 ,h = 200)
    link_to "Your QRcode", qrcode_url(card_landing_url(user.slug, :format => :qrcode), w, h)
  end
  
  def image_tag_qr_code(user, w=150 ,h = 150)
    image_tag(qrcode_url(card_landing_url(user.slug, :format => :qrcode), w, h))
  end
  
  def bookmark_qr_code(user, w=150 ,h = 150)
    image_tag(qrcode_url("http://friendscan.me", w, h))
  end

  def qrcode_url(url, w, h)
    "http://qurecode.herokuapp.com/api/qrcode.image?size=#{w}&color=244468&background_color=ffffff&second_color=39c&prettify=true&url=#{url}"
  end

  def link_to_tumblr_follow(user)
    link_to "Follow on Tumblr", "http://www.tumblr.com/follow/#{user.tumblr_info.uid}", popup: true
  end


  def link_to_last_fm(user)
    link_to "Last.fm", user.last_fm_info.profile_url , popup: true
  end


  def link_to_foursquare(user)
    link_to "Foursquare", "https://foursquare.com/#{user.foursquare_info.uid}", popup: true
  end


  def link_to_tumblr(user)
    link_to "Tumblr", "http://#{user.tumblr_info.uid}.tumblr.com/", popup: true
  end

  def link_to_flickr(user)
    link_to "Flickr", "http://www.flickr.com/photos/#{user.flickr_info.profile_id}/", popup: true
  end


end

