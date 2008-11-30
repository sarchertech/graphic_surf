class Post < ActiveRecord::Base
  has_many :post_pictures, :dependent => :destroy
  
  has_many :comments
  
  named_scope :recent, :limit => 30, :order => 'created_at DESC'
  
  named_scope :published, :conditions => ['published = ?', true]
  
  validates_presence_of :title
  validates_presence_of :description

  after_update :save_pictures
  
  def new_picture_attributes=(picture_attributes)
    picture_attributes.each do |attributes|
      post_pictures.build(attributes)
    end
  end
  
  def existing_picture_attributes=(picture_attributes)
    post_pictures.reject(&:new_record?).each do |picture|
      attributes = picture_attributes[picture.id.to_s]
      if attributes
        picture.attributes = attributes
      else
        post_pictures.destroy(picture)
      end
    end
  end
  
  def save_pictures
    post_pictures.each do |picture|
      picture.save(false)
    end
  end
end
