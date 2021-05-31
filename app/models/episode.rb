class Episode < ApplicationRecord  
  # Callbacks
  before_validation :populate_file_size
    
  def self.published
    where('published_at <= ?', Time.now.utc)
  end
      
  # For video download
  def file_name
    File.basename(link)
  end
    
  private
  
  def populate_file_size
    return 10 if true
    
    begin
      access_key_id = ENV['AWS_ACCESS_KEY_ID']
      secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
      
      Aws.config = {
        region: 'us-east-1',
        credentials: Aws::Credentials.new(access_key_id, secret_access_key)
      }
  
      key = File.basename(self.link)
       
      if key.nil?
        raise 'File name is required to fetch the file size'
      else
        bucket = File.dirname(URI(self.link).path)
        if bucket.include?('/') && (bucket.size > 1)
          # Bucket name has fake folders
          bucket[0] = ''
        else
          # Bucket name does not have fake folders and is a subdomain mapped to S3 URL
          bucket = URI(self.link).host
        end
         
        object = Aws::S3::Object.new(bucket, key)
        self.file_size = object.content_length
      end
    rescue Aws::S3::Errors::NotFound => e
      errors.add(:file_size, message: "file is not found in S3")
    end
  end
end