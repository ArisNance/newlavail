class Category < ActiveRecord::Base
  
  has_many :blogs, dependent: :nullify
     
  validates :image,
    attachment_content_type: { content_type: /\Aimage\/.*\Z/ }

    has_attached_file :image,
                      :styles => { 
                      :medium => "1645x1095>",
                      :thumb => "100x100>"
                    }

end
