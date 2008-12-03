class CreatePreviewPictures < ActiveRecord::Migration
  def self.up
    create_table :preview_pictures do |t|
      t.integer  :project_id
      t.string   :preview_photo_file_name
      t.string   :preview_photo_content_type
      t.integer  :preview_photo_file_size
      t.datetime :preview_photo_updated_at
      
      t.timestamps
    end
  end

  def self.down
    drop_table :preview_pictures
  end
end
