class Category < ActiveRecord::Base
  
  has_many :blogs, dependent: :nullify
     
  validates :image,
    attachment_content_type: { content_type: /\Aimage\/.*\Z/ }
    
  has_attached_file :image,
                    :s3_credentials => "#{Rails.root}/config/s3.yml",
                    :s3_host_name => "s3-us-west-2.amazonaws.com",
                    :region => "us-west-2",
                    :styles => { 
                    :medium => "1645x1095>", 
                    :thumb => "100x100>" 
                    }
end


# postgres://chdacbkhvwoqoo:haArLfKQ_JZVc8HcwQz24aiMRW@ec2-54-243-210-223.compute-1.amazonaws.com:5432/d9faa0af43167q