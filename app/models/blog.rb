#For retrieving the image from the remote url
require 'open-uri' 


class Blog < ActiveRecord::Base
    belongs_to :user
    belongs_to :category
    
    has_attached_file :image,
    :styles => { :medium => "300x300>",
    :thumb => "100x100>" }
    
    validates_attachment_content_type :image,
    :content_type => /\Aimage\/.*\z/
    
    def avatar_from_url(url)
    self.avatar = open(url)
    end
end
