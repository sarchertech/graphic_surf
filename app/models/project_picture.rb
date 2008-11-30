class ProjectPicture < ActiveRecord::Base
  belongs_to :project
  
  has_attached_file :photo, :styles => { :thumb => "570x380>" }
  
  attr_accessible :photo
  attr_accessible :primary_picture
  
end
