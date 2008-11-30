class PostPicture < ActiveRecord::Base
  belongs_to :post
  
  has_attached_file :blog_photo
  
  attr_accessible :blog_photo, :reference
end
