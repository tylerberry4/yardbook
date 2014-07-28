CarrierWave.configure do |config|
  config.permissions = 0666
  config.directory_permissions = 0777

  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => Rails.application.secrets.aws_access_key_id,
      :aws_secret_access_key  => Rails.application.secrets.aws_secret_access_key
  }

  if Rails.env.production?
    config.storage = :fog
  else
    config.storage = :file
  end

  config.fog_directory = 'theironyardbook'
end

  # if Rails.env.production?
  #   config.storage = :fog
  # else
  #   config.storage = :file
  # end

  # if Rails.env.test? || Rails.env.development?
  #   config.storage = :file
  #   #config.enable_processing = false
  #   #config.root = "#{Rails.root}/tmp/uploads/#{DateTime.now.to_f}.#{rand(999)}.#{rand(999)}"
  # else
  #   config.storage = :fog
  # end
  #
  #
  # config.cache_dir = "#{Rails.root}/tmp/uploads"                  # To let CarrierWave work on heroku
  #
  # config.fog_directory = 'ironyardbook'
  # config.fog_public     = false
  # config.fog_attributes = {}
# end