#For retrieving the image from the remote url
require 'open-uri' 
class Blog < ActiveRecord::Base
    
    belongs_to :user
    belongs_to :category
    
    has_attached_file :image,
                      :styles => { :medium => "300x300>",
                      :thumb => "100x100>",
                      :storage => :s3,
                      :s3_credentials => Proc.new{|a| a.instance.s3_credentials
                    }
    
    validates_attachment_content_type :image,
    :content_type => /\Aimage\/.*\z/
    
    def avatar_from_url(url)
    self.avatar = open(url)
    end
    
    def s3_credentials
    {:bucket => 'lavail', :access_key_id => 'AKIAJBROJBFAAVVCH4KA', :secret_access_key => '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'}
    end
end
