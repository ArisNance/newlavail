class Category < ActiveRecord::Base
  has_many :blogs, dependent: :nullify
  
  has_attached_file :image,
    :styles => { :medium => "1645x1095>",
    :thumb => "100x100>" }
     
  validates_attachment_content_type :image,
    :content_type => /\Aimage\/.*\z/
end