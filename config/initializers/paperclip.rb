Paperclip::Attachment.default_options[:storage] = :s3

Paperclip::Attachment.default_options[:s3_credentials] = "#{Rails.root}/config/s3.yml"

Paperclip::Attachment.default_options[:s3_options] = {
  endpoint: 'https://s3-us-west-2.amazonaws.com/mylavailbucket'
}

Paperclip::Attachment.default_options[:url] = ':s3_domain_url'
Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'
Paperclip::Attachment.default_options[:s3_host_name] = 'https://s3-us-west-2.amazonaws.com/mylavailbucket'
Paperclip::Attachment.default_options[:s3_protocol] = 'https'
Paperclip::Attachment.default_options[:s3_region] = 'us-west-2'