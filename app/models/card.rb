class Card
  include Mongoid::Document
  include Mongoid::Timestamps

  field :url , type: String

  embedded_in :user

  def url

  end


  def qr_code(w = 200,h = 200)
    "http://api.qrserver.com/v1/create-qr-code/?data=#{self.url}&size=#{w}x#{h}"
  end

end

