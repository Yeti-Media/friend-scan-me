module CardsHelper

  # Show Helpers

  def link_to_add_facebook_friend(user)
     link_to "Add as a Friend on Facebook",
     "http://www.facebook.com/dialog/friends/?id=#{user.facebook_setting.uid}&app_id=#{Settings.omniauth.facebook.app_id}&redirect_uri=#{request.url}"
  end

  def link_to_twitter_follow(user)
    link_to "Follow @#{user.twitter_setting.uid}", "https://twitter.com/#{user.twitter_setting.uid}", class: "twitter-follow-button"
  end

  # Edit HELPERS
  def link_to_qr_code(user, w=200 ,h = 200)
    link_to "Your QRcode", "http://api.qrserver.com/v1/create-qr-code/?data=#{card_landing_url(user.slug)}&size=#{w}x#{h}"
  end

  def link_to_facebook(user)
    link_to "Facebook" , "http://facebook.com/profile.php?id=#{user.facebook_setting.uid}" , popup: true
  end

  def link_to_twitter(user)
    link_to "Twitter", "https://twitter.com/#{user.twitter_setting.uid}" , popup: true
  end



end

