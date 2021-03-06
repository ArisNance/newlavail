#For retrieving the image from the remote url
class Blog < ActiveRecord::Base
    
    belongs_to :user
    belongs_to :category
    
    validates :image,
    attachment_content_type: { content_type: /\Aimage\/.*\Z/ }

    has_attached_file :image,
                    #   :s3_credentials => "#{Rails.root}/config/s3.yml",
                      :styles => { 
                      :medium => "1645x1095>",
                      :thumb => "100x100>"
                    }
                    
  
end
