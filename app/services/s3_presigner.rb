class UploadPresigner
  def self.presign(prefix, filename, limit: limit)
    extname = File.extname(filename)
    filename = "#{SecureRandom.uuid}#{extname}"
    upload_key = Pathname.new(prefix).join(filename).to_s

    creds = Aws::Credentials.new(ENV['AKIAIEMNN7BAULT3LJZQ'], ENV['OVwh8rhnsk5UFIuqYMC2sCeILWYKV7We3IH9GrFZ+fhZH+hquYxUqfyzdkVYD'])
    s3 = Aws::S3::Resource.new(region: 'us-west-2', credentials: creds)
    obj = s3.bucket('mylavailbucket').object(upload_key)

    params = { acl: 'public-read' }
    params[:content_length] = limit if limit

    {
      presigned_url: obj.presigned_url(:put, params),
      public_url: obj.public_url
    }
  end
end