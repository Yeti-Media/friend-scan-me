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
end
