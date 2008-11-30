class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string :name
      t.text :body
      t.integer :post_id
      t.boolean :spam_status

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
