class AddAttachmentToCategories < ActiveRecord::Migration
  def self.up
    change_table :categories do |t|
      add_attachment :categories, :image
    end
  end

  def self.down
    remove_attachment :categories, :image
  end
end
