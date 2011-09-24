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
  
end
