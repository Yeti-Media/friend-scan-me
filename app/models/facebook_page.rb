class FacebookPage
  include Mongoid::Document
  include Mongoid::Slug
  
  field :name , :type => String
  field :facebook_id , :type => Integer
  field :url , :type => String

  slug :name

  belongs_to :user


  def self.add_pages(user,auth)
    pages_result = facebook_client(auth['credentials']['token']).selection.find('fql').param(q: "SELECT page_id, type FROM page_admin WHERE uid=me()").info!
    pages_result['data'].each do |page|
      next if page['type'] == 'APPLICATION'
      facebook_page = user.facebook_pages.where(facebook_id: page['page_id'].to_i).first ||
      self.create!(facebook_id: page['page_id'].to_i , user: user)
      page_result = facebook_client.selection.find('fql').param(q: "SELECT page_url, name FROM page WHERE page_id = #{page['page_id']}").info!['data'].first
      facebook_page.update_attributes!(name: page_result['name'], 
                                       url: page_result['page_url'])
    end
  end

  private

  def self.facebook_client(token=nil)
    @facebook_client ||= FBGraph::Client.new(client_id: Settings.omniauth.facebook.app_id,
                                             secret_id: Settings.omniauth.facebook.app_secret,
                                             token: token)
  end

end
