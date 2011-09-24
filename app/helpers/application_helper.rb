module ApplicationHelper
  
  # Return title for each page
  def title
    base_title = "Friend.Scan.Me"
    if @title.nil?
      base_title
    else
      "#{@title} - #{base_title}"
    end
  end
  
end
