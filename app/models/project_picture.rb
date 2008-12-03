class ProjectPicture < ActiveRecord::Base
  belongs_to :project
  
  has_attached_file :photo
  
  attr_accessible :photo
  attr_accessible :primary_picture
  
end
