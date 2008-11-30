class CreateProjectPictures < ActiveRecord::Migration
  def self.up
    create_table :project_pictures do |t|
      t.integer  :project_id
      t.boolean  :primary_picture, :default => false
      t.string   :photo_file_name
      t.string   :photo_content_type
      t.integer  :photo_file_size
      t.datetime :photo_updated_at
      
      t.timestamps
    end
  end

  def self.down
    drop_table :project_pictures
  end
end
