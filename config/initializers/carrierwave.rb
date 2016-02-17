CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage = :aws
  else
    config.storage = :file
  end
  config.aws_bucket = ENV.fetch('s3_bucket')
  config.aws_acl    = 'public-read'

  # The maximum period for authenticated_urls is only 7 days.
  config.aws_authenticated_url_expiration = 60 * 60 * 24 * 7

  # Set custom options such as cache control to leverage browser caching
  config.aws_attributes = {
    expires: 1.week.from_now.httpdate,
    cache_control: 'max-age=604800'
  }

  config.aws_credentials = {
    access_key_id:     ENV.fetch('s3_id'),
    secret_access_key: ENV.fetch('s3_key'),
    region:            ENV.fetch('s3_region') # Required
  }

end
