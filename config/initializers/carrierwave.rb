# config/initializers/carrierwave.rb

CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_public = false
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     ENV["AKIA2RZL2DUHYE2JXUUV"],        # required
    aws_secret_access_key: ENV["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"],        # required
  }
  config.fog_directory  = ENV["pet-social-media"]              # required
end             
