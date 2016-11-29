#For retrieving the image from the remote url
require 'open-uri' 

class Category < ActiveRecord::Base
  has_many :blogs, dependent: :nullify
  
  has_attached_file :image,
    :styles => { :medium => "1645x1095>",
    :thumb => "100x100>" }
     
  validates_attachment_content_type :image,
    :content_type => /\Aimage\/.*\z/
    
  def image_from_url(url)
    self.avatar = open(url)
  end
end