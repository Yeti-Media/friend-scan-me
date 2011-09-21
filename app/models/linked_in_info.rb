class LinkedInInfo
  include Mongoid::Document

  field :uid , type: String
  field :profile_url , type: String

  embedded_in :user

  validates :uid , presence: true
end

