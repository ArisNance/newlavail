class AddAttachmentToBlogs < ActiveRecord::Migration
  def self.up
    change_table :blogs do |t|
      add_attachment :blogs, :image
  end
  end
  

  def self.down
    remove_attachment :blogs, :image
  end
end