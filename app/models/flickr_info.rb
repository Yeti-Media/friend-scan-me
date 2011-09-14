class FlickrInfo
  include Mongoid::Document

  field :uid , type: String
  field :profile_id , type: String

  embedded_in :user

  validates :uid , presence: true
end

