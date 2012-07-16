class Product
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  mount_uploader :asset , AssetUploader

  field :name, type: String
  field :description, type: String
  field :url,  type: String
  field :likes, type: Integer, default: 0
  field :visible, type: Boolean , default: true
  slug :name

  belongs_to :user

  validates :name, presence: true
end
