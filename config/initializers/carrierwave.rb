CarrierWave.configure do |config|

  if Rails.env.production?
    config.fog_credentials = {
      # Configuration for Amazon S3
      :provider              => 'AWS',
      :aws_access_key_id     => ENV['S3_KEY'],
      :aws_secret_access_key => ENV['S3_SECRET'],
      :region                => ENV['S3_REGION']
    }
   
    config.cache_dir = "#{Rails.root}/tmp/uploads"                  # To let CarrierWave work on heroku
   
    config.fog_directory    = ENV['S3_BUCKET_NAME']
    config.s3_access_policy = :public_read                          # Generate http:// urls. Defaults to :authenticated_read (https://)
    config.fog_host         = "#{ENV['S3_ASSET_URL']}/#{ENV['S3_BUCKET_NAME']}"
  end
end

# heroku config:add S3_KEY=AKIAI2GFGIII6MDPRG6Q S3_SECRET=AAJQxCgE2LtS70uDzc5AKwtQQVA+wBvC072qj5IK S3_REGION=Ireland S3_ASSET_URL=http://assets.example.com/ S3_BUCKET_NAME=radicalc/profile_pics