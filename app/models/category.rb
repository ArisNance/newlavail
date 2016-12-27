class Category < ActiveRecord::Base
  
  has_many :blogs, dependent: :nullify
     
  validates :image,
    attachment_content_type: { content_type: /\Aimage\/.*\Z/ }
    
  has_attached_file :image, :styles => { :medium => "1645x1095>", :thumb => "100x100>" },
                      :storage => :s3,
                      :s3_credentials => Proc.new{|a| a.instance.s3_credentials }
                      
  def s3_credentials
    {:bucket => "mylavailbucket", :s3_region => "mylavailbucket.s3.amazonaws.com", :access_key_id => "AKIAIEMNN7BAULT3LJZQ", :secret_access_key => "OVwh8rhnsk5UFIuqYMC2sCeILWYKV7We3IH9GrFZ+fhZH+hquYxUqfyzdkVYD"}
  end
end


