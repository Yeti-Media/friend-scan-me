class GithubInfo
  include Mongoid::Document

  field :uid , type: String

  embedded_in :user

  validates :uid , presence: true
end

