module ApplicationHelper
  
  # Return title for each page
  def title
    base_title = "FriendScan.Me"
    if @title.nil?
      base_title
    else
      "#{@title} #{base_title}"
    end
  end
 

  def tweet(msg, url)
    link_to "Tweet", "https://twitter.com/share", 
      "data-ajax" => "false", class: "twitter-share-button", 
      "data-url" => url, "data-text" => msg,
      "data-count" => "horizontal",  "data-via" => "friendscanme"
  end

  def facebook_post(name, caption, description, url, picture)
    link_to "Post to Facebook", "http://www.facebook.com/dialog/feed?
                                 app_id=#{Settings.omniauth.facebook.app_id}&
                                 picture=#{picture}&
                                 name=#{name}&
                                 caption=#{caption}&
                                 description=#{description}&
                                 redirect_uri=#{url}",
             "data-ajax" => "false", class: 'fb-post-link', target: '_new'
  end


  def image_url(source)
    "http://#{request.host_with_port}#{image_path(source)}"
  end

end
