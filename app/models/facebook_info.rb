class FacebookInfo
  include Mongoid::Document

  field :uid , type: String
  field :user_name, type: String

  embedded_in :user

  validates :uid , presence: true

end

