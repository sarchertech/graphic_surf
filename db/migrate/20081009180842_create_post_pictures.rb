class CreatePostPictures < ActiveRecord::Migration
  def self.up
    create_table :post_pictures do |t|
      t.integer  :post_id
      t.string   :reference
      t.string   :blog_photo_file_name
      t.string   :blog_photo_content_type
      t.integer  :blog_photo_file_size
      t.datetime :blog_photo_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :post_pictures
  end
end
