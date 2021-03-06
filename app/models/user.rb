class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  field :name , type: String
  field :bio , type: String
  field :blog_url , type: String
  field :scan_stats , type: Integer , default: 0

  slug :name

  embeds_one :card
  embeds_one :facebook_info
  embeds_one :twitter_info
  embeds_one :linkedin_info
  embeds_one :last_fm_info
  embeds_one :github_info
  embeds_one :foursquare_info
  embeds_one :instagram_info
  embeds_one :tumblr_info
  embeds_one :flickr_info


  def self.find_or_create_with_omniauth(auth)
    User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.new_with_omniauth(auth)
  end

  def self.new_with_omniauth(auth)
    user = User.new
    info = send("add_#{auth["provider"]}", user , auth)
    user.name = info.sluggable_name
    user
  end

  def self.find_by_provider_and_uid(provider ,uid)
    where("#{provider}_info.uid" => uid).first
  end

  def associate_provider(auth)
    unless send("#{auth["provider"]}_info").present?
      self.class.send("add_#{auth["provider"]}", self , auth)
      self.save
    end
  end

  def has_social?(provider)
    send("#{provider}_info").present?
  end


  def update_stats
    self.scan_stats += 1
    self.save
  end

  private

  def self.add_facebook(user , auth)
    info = FacebookInfo.new(uid: auth["uid"], user_name: auth["info"]["name"])
    user.facebook_info = info
  end

  def self.add_twitter(user , auth)
    info = TwitterInfo.new(uid: auth["uid"], user_name: auth["info"]["nickname"])
    user.twitter_info = info
  end

  def self.add_linkedin(user , auth)
    info = LinkedinInfo.new(uid: auth["info"]["name"], user_name:  auth["info"]["name"],
                            profile_url: auth["info"]['urls']["public_profile"])
    user.linkedin_info = info
  end
  
  def self.add_instagram(user , auth)
    info = InstagramInfo.new(uid: auth["info"]["nickname"])
    user.instagram_info = info
  end

  def self.add_github(user , auth)
    info = GithubInfo.new(uid: auth["info"]["nickname"])
    user.github_info = info
  end


  def self.add_last_fm(user , auth)
    info = LastFmInfo.new(uid: auth["uid"],
                          profile_url: auth["user_info"]["urls"]["Profile"])
    user.last_fm_info = info
  end


  def self.add_foursquare(user , auth)
    info = FoursquareInfo.new(uid: auth["user_info"]["nickname"])
    user.foursquare_info = info
  end


  def self.add_tumblr(user , auth)
    info = TumblrInfo.new(uid: auth["uid"])
    user.tumblr_info = info
  end

  def self.add_flickr(user , auth)
    info = FlickrInfo.new(uid: auth["user_info"]["username"], profile_id: auth["uid"])
    user.flickr_info = info
  end


end
