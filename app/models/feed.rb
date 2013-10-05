class Feed < ActiveRecord::Base
  has_many :entries
  validate :feed_validation
  validates :url, :uniqueness => true
  def feed_validation
     errors[:base] << ("Title cannot be left blank") if self.title.blank?
     errors[:base] << ("URL cannot be left blank") if self.url.blank?
     
  end 
end
