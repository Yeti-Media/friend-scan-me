class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  field :name , type: String

  slug :name

  embeds_one :card
  embeds_one :facebook_setting
  embeds_one :twitter_setting


  def self.new_with_omniauth(auth)
    user = User.new
    setting = send("add_#{auth["provider"]}", user , auth)
    user.name = setting.uid
    user
  end

  def self.find_by_provider_and_uid(provider ,uid)
    where("#{provider}_setting"=> {uid: uid}).first
  end

  def associate_provider(auth)
    unless send("#{auth["provider"]}_setting").present?
      self.class.send("add_#{auth["provider"]}", self , auth)
      self.save
    end
  end

  private

  def self.add_facebook(user , auth)
    setting = FacebookSetting.new(uid: auth["uid"])
    user.facebook_setting = setting
  end

  def self.add_twitter(user , auth)
    setting = TwitterSetting.new(uid: auth["user_info"]["nickname"])
    user.facebook_setting = setting
  end


end

