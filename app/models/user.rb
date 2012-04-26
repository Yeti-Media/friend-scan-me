class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  field :name , type: String
  field :bio , type: String
  field :blog_url , type: String

  slug :name

  embeds_one :card
  embeds_one :facebook_info
  embeds_one :twitter_info
  embeds_one :linked_in_info
  embeds_one :last_fm_info
  embeds_one :github_info
  embeds_one :foursquare_info
  embeds_one :instagram_info
  embeds_one :tumblr_info
  embeds_one :flickr_info
  has_many :facebook_pages


  def self.find_or_create_with_omniauth(auth)
    if user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) 
      user.send("update_#{auth['provider']}", auth)
    else  
      user = User.new_with_omniauth(auth)
    end
    user
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
    if send("#{auth["provider"]}_info").present?
      self.send("update_#{auth["provider"]}" , auth)
    else
      self.class.send("add_#{auth["provider"]}", self , auth)
      self.save
    end
  end

  def has_social?(provider)
    send("#{provider}_info").present?
  end


  private

  def self.add_facebook(user , auth)
    info = FacebookInfo.new(uid: auth["uid"], user_name: auth["user_info"]["name"], email: auth["user_info"]["email"])
    FacebookPage.add_pages(user, auth)
    user.facebook_info = info
  end

  def update_facebook(auth)
    self.facebook_info.update_attributes(uid: auth["uid"], user_name: auth["user_info"]["name"], email: auth["user_info"]["email"])
    FacebookPage.add_pages(self, auth)
  end


  def self.add_twitter(user , auth)
    info = TwitterInfo.new(uid: auth["uid"], user_name: auth["user_info"]["nickname"])
    user.twitter_info = info
  end

  def update_twitter(auth)
    self.twitter_info.update_attributes(uid: auth["uid"], user_name: auth["user_info"]["nickname"])
  end
  

  def self.add_linked_in(user , auth)
    info = LinkedInInfo.new(uid: auth["user_info"]["name"],
                            profile_url: auth["user_info"]["public_profile_url"])
    user.linked_in_info = info
  end

  def update_linked_in(user , auth)
    self.linked_in_info.update_attributes(uid: auth["user_info"]["name"],
                                          profile_url: auth["user_info"]["public_profile_url"])
  end

  def self.add_last_fm(user , auth)
    info = LastFmInfo.new(uid: auth["uid"],
                          profile_url: auth["user_info"]["urls"]["Profile"])
    user.last_fm_info = info
  end

  def self.add_github(user , auth)
    info = GithubInfo.new(uid: auth["user_info"]["nickname"])
    user.github_info = info
  end

  def self.add_foursquare(user , auth)
    info = FoursquareInfo.new(uid: auth["user_info"]["nickname"])
    user.foursquare_info = info
  end

  def self.add_instagram(user , auth)
    info = InstagramInfo.new(uid: auth["user_info"]["nickname"])
    user.instagram_info = info
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
