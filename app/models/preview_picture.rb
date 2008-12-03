class PreviewPicture < ActiveRecord::Base
  belongs_to :project
  
  has_attached_file :preview_photo
  
  attr_accessible :preview_photo
end
