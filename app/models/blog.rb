#For retrieving the image from the remote url
require 'open-uri' 
class Blog < ActiveRecord::Base
    
    belongs_to :user
    belongs_to :category
    
    validates :image,
    attachment_content_type: { content_type: /\Aimage\/.*\Z/ },
    attachment_size: { less_than: 5.megabytes }
    
    has_attached_file :image,
                      :styles => { 
                      :medium => "300x300>",
                      :thumb => "100x100>"
                    }
                      :s3_credentials => Proc.new{|a| a.instance.s3_credentials }
                      :storage => :s3
                      
    def s3_credentials
    {:bucket => 'lavail', :access_key_id => 'AKIAJBROJBFAAVVCH4KA', :secret_access_key => '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'}
    end
end
